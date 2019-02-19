//
//  token.swift
//  tindertryout
//
//  Created by Nineleaps on 11/02/19.
//  Copyright © 2019 Nineleaps. All rights reserved.
//


//The class to map the response

import ObjectMapper

class LoginResponse: Mappable {
    var res:Loginresponse?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        res <- map["response"]
       
    }
}

class Loginresponse: Mappable {
    var text: ResText?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        text <- map["data"]
    }
    
    class ResText: Mappable{
        
        var token: String?
        
        required init?(map: Map) {
        
        }
        
        func mapping(map: Map) {
        
            token<-map["token"]
        }
        
    }
    
    class Status:Mappable {
        
        var code:Int?
        var msg:String?
        
        required init?(map: Map) {
            
        }
        
        func mapping(map: Map) {
            
            code<-map["code"]
            msg<-map["String"]
        }
    
    }
}
