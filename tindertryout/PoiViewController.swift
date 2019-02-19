//
//  ViewController.swift
//  Example
//
//  Created by HideakiTouhara on 2018/02/26.
//  Copyright © 2018年 HideakiTouhara. All rights reserved.
//

import UIKit
import Poi
import SwiftKeychainWrapper
import Alamofire
import AlamofireObjectMapper

// swiftlint:disable identifier_name
class PoiViewController: UIViewController, PoiViewDataSource, PoiViewDelegate {

    @IBOutlet weak var poiView: PoiView!
    
    var sampleCards = [Card]()
    var fetchedinfo: [Pets]?

    override func viewDidLoad() {
        super.viewDidLoad()
        updatepetlist_apicall()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func updatepetlist_apicall() {

        obj.retrievepetsapicall(KeychainWrapper.standard.string(forKey: "auth_token")!) { (response) -> (Void) in
        
            if response.response?.statusCode == 200 {
                
                let FetchResponse = response.result.value
                self.fetchedinfo = FetchResponse?.res?.info?.pet
                self.createViews()
                self.poiView.dataSource = self
                self.poiView.delegate = self
                
            }
            else
            {
                print("Everything is going bad")
            }
        }
    }
    
    @IBAction func logout_apicall(_ sender: Any) {
                obj.logoutapicall { (response) -> (Void) in
                if response.response?.statusCode == 200 {
                    
                    let _: Bool = KeychainWrapper.standard.removeObject(forKey: "auth_token")
                    Alert.logoutSuccesful(on: self)
                    self.performSegue(withIdentifier: "logout", sender: self)
                    } else {
                    
                    print("Not Entering the logout functionality")
                }
        }
    }
  
    private func createViews() {
        for i in (0..<self.fetchedinfo!.count) {
            // swiftlint:disable force_cast
            let card = UINib(nibName: "Card", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! Card
            card.prepareUI(text: fetchedinfo![i].name!, img: (fetchedinfo![i].image!), desc: fetchedinfo![i].description!)
            sampleCards.append(card)
        }
    }
    
    // MARK: PoiViewDataSource
    func numberOfCards(_ poi: PoiView) -> Int {
        return self.fetchedinfo!.count
    }
    
    func poi(_ poi: PoiView, viewForCardAt index: Int) -> UIView {
        return sampleCards[index]
    }
    
    func poi(_ poi: PoiView, viewForCardOverlayFor direction: SwipeDirection) -> UIImageView? {
        switch direction {
        case .right:
            let good = UIImageView(image: #imageLiteral(resourceName: "like.png"))
            good.tintColor = UIColor.green
            return good
        case .left:
            let bad = UIImageView(image: #imageLiteral(resourceName: "nope.png"))
            bad.tintColor = UIColor.red
            return bad
        }
    }
    
    // MARK: PoiViewDelegate
    func poi(_ poi: PoiView, didSwipeCardAt: Int, in direction: SwipeDirection) {
       let id = fetchedinfo![didSwipeCardAt-1].id!
        switch direction {
        case .left:
           
            obj.updatelikes(id, false)
            
        case .right:
           
            obj.updatelikes(id,true)
        
        }
    }
    
    func poi(_ poi: PoiView, runOutOfCardAt: Int, in direction: SwipeDirection) {
        
        print("Stack Ended")
        
    }

    // MARK: IBAction
    @IBAction func OKAction(_ sender: UIButton) {
        poiView.swipeCurrentCard(to: .right)
    }
    
    @IBAction func cancelAction(_ sender: UIButton) {
        poiView.swipeCurrentCard(to: .left)
    }
    
    @IBAction func undo(_ sender: UIButton) {
        poiView.undo()
}

}
