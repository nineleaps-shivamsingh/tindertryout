//
//  Apicalls.swift
//  tindertryout
//
//  Created by Nineleaps on 18/02/19.
//  Copyright © 2019 Nineleaps. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper
import SwiftKeychainWrapper

class Apicalls{
    
    var parameters: [String: Any] = [:]
    var baseurl = URL(string: "http://ec2-3-91-83-117.compute-1.amazonaws.com:3000/")
    var headers: HTTPHeaders?
    var global_response: Any?
    
     func loginapicall(_ usr1: String, _ pwd1: String, completion: @escaping ((DataResponse<LoginResponse>)) -> (Void))
    {
        
        let requesturl = URL(string: "login", relativeTo: baseurl)
        parameters = ["username": usr1, "password": pwd1]
        print ("URL = = = = \(String(describing: requesturl))!")
        Alamofire.request(requesturl!, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers:nil).responseObject { (response: DataResponse<LoginResponse>) in
        completion(response)
        }
    }
    
    
    func retrievepetsapicall(_ token: String, completion: @escaping ((DataResponse<PetImage>)) -> (Void))
    {
        
        let requesturl = URL(string: "pets", relativeTo: baseurl)
        headers = ["Authorization" : token]
        
        Alamofire.request(requesturl!, method: .get, encoding: JSONEncoding.default, headers: headers).responseObject { (response: DataResponse<PetImage>) in
            completion(response)
        }
    }
    
    func updatelikes(_ id: String, _ status: Bool)
    {
    
        let requesturl = URL(string: "pets/likes/\(id)", relativeTo: baseurl)
        
        parameters = ["liked" : status]
        Alamofire.request(requesturl!, method: .put, parameters: parameters)
    }
    
    func likedlistapicall(completion: @escaping ((DataResponse<PetImage>))-> (Void))
    {
        let requesturl = URL(string:"pets/likes", relativeTo: baseurl)
        
        Alamofire.request(requesturl!, method: .get).responseObject { (response: DataResponse<PetImage>) in
            
            completion(response)
        }
    }
    
    func logoutapicall(completion: @escaping ((DataResponse<PetImage>)) -> (Void))
    {
        
        let requesturl = URL(string: "logout", relativeTo: baseurl)
        Alamofire.request(requesturl!, method: .post).responseObject { (response: DataResponse<PetImage>) in
            completion(response)
        }
    }
}

