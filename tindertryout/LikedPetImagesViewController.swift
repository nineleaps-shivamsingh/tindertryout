//
//  LikedPetImagesViewController.swift
//  tindertryout
//
//  Created by Nineleaps on 13/02/19.
//  Copyright © 2019 Nineleaps. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class LikedPetImagesViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
   
    @IBOutlet weak var searchBar: UISearchBar!
    
    var likedpets = [Pets]()
    var searcharray = [Pets]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        likedlist_apicall()
      
       
    }
    


    func likedlist_apicall()
    {
        
        
        obj.likedlistapicall { (response) -> (Void) in 
            
            if response.response?.statusCode == 200 {
                
                let fetchResponse = response.result.value
                self.likedpets = (fetchResponse?.res?.info?.pet!)!
                self.searcharray = self.likedpets
                
                self.tableView.delegate = self
                self.tableView.dataSource = self
                self.tableView.tableFooterView = UIView(frame: CGRect.zero)
                self.tableView.reloadData()
              

                
            }
            
        
        }
    }
    
    private func setupsearchbar(){
        
        searchBar.delegate = self
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        guard !searchText.isEmpty else {
            searcharray = likedpets
            tableView.reloadData()
            return
        }
        searcharray = likedpets.filter({ pets -> Bool in
        
            guard searchBar.text != nil else { return false }
            return (pets.name?.lowercased().contains(searchText.lowercased()))!
        })
        
        tableView.reloadData()
    }
    
//    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
//
//
//
//    }
  

}

extension LikedPetImagesViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searcharray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let pet = searcharray[indexPath.row]
        
        
        // swiftlint:disable force_cast
        let cell = tableView.dequeueReusableCell(withIdentifier:"CustomCell") as! CustomCell
        cell.setPet(name: pet.name!, image: pet.image!)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}

