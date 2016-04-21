//
//  imageProcessor.swift
//  RealmCompactProblemRepro
//
//  Created by Joseph Zhou on 4/21/16.
//  Copyright © 2016 Joseph. All rights reserved.
//

import Foundation
import RealmSwift


class ImageProcessor{
    
    func startProcessing(){
        print("start processing que")
        while true{
            print("entered processing task")
            
            //using realm, it'll stuck at the following line trying to instanstiate an instance
            //and never got to print anything
            let realm = try! Realm()
            sleep(1)
            print("finished task")
            //but if you comment off the realm part you'll see it starts to print
        }

    }
    
}
