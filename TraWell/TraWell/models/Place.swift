//
//  Place.swift
//  TraWell
//
//  Created by Unholy Saint on 14/12/16.
//  Copyright © 2016 Ajit Horo. All rights reserved.
//

import Foundation

class Place {
    
    var name:String?
    var imageName:String?
    
    init() {
        self.name = ""
        self.imageName = ""
    }
    
    init(name:String, imageName:String) {
        self.name = name
        self.imageName = imageName
    }
}
