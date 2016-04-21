//
//  model.swift
//  RealmCompactProblemRepro
//
//  Created by Joseph Zhou on 4/21/16.
//  Copyright © 2016 Joseph. All rights reserved.
//

import Foundation
import RealmSwift
class Photo : Object {
    dynamic var localIdentifier = ""
    let latitude = RealmOptional<Double>()
    let longitude = RealmOptional<Double>()
    dynamic var creationDate : NSDate? = nil
    dynamic var displayedTimes = 0
    dynamic var clickedTimes = 0
    dynamic var heightWidthRatio:Double = 1.0
    
    override static func primaryKey() -> String? {
        return "localIdentifier"
    }
}