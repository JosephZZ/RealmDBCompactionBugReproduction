//
//  ViewController.swift
//  RealmCompactProblemRepro
//
//  Created by Joseph Zhou on 4/21/16.
//  Copyright © 2016 Joseph. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    let realm = try! Realm()
    override func viewDidLoad() {
        super.viewDidLoad()
        print("start vc")
        let photoIDs = realm.objects(Photo.self).map({$0.localIdentifier})
        photoIDs.forEach{id in
            sleep(1)
            let photo = realm.objectForPrimaryKey(Photo.self, key: id)
            print(photo?.localIdentifier)
        }
        
        print("finish vc")
        // Do any additional setup after loading the view, typically from a nib.
    }


}

