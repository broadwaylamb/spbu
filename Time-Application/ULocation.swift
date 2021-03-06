//
//  ULocation.swift
//  Time-Application
//
//  Created by Даниил on 18.09.16.
//  Copyright © 2016 Daniil Gavrilov. All rights reserved.
//

import Foundation
import SwiftyJSON

struct ULocation {
    
    let title: String
    let latitude: Double
    let longitude: Double
    let unit: String
    
    init(from json: JSON) {
        title = json["location"].string!
        latitude = json["latitude"].double!
        longitude = json["longitude"].double!
        unit = json["unit"].string!
    }
    
}
