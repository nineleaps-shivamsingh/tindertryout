//
//  PetImages.swift
//  tindertryout
//
//  Created by Nineleaps on 12/02/19.
//  Copyright © 2019 Nineleaps. All rights reserved.
//

import ObjectMapper

class PetImage: Mappable{
  
    var res: Petresponse?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        res<-map["response"]
    }
    
}

class Petresponse: Mappable {
    
    var info: Data?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        info<-map["data"]
    }
    
}

class Data: Mappable {
    
    var pet:[Pets]?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        pet<-map["pets"]
    }
    
}

class Pets: Mappable {
    
    var id: String?
    var image: String?
    var name: String?
    var liked: Bool?
    var description: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        id<-map["_id"]
        image<-map["image"]
        name<-map["name"]
        liked<-map["liked"]
        description<-map["description"]
    
    }
}

class Status: Mappable {
    
    var code: Int?
    var msg: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        
        code<-map["code"]
        msg<-map["message"]
        
    }
    
}
