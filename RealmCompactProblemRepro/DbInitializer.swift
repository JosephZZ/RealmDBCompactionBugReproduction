//
//  DbInitializer.swift
//  RealmCompactProblemRepro
//
//  Created by Joseph Zhou on 4/21/16.
//  Copyright © 2016 Joseph. All rights reserved.
//

import Foundation
import RealmSwift
import Photos

class DbInitializer{
    var realm = try? Realm()
    
    func run(){
        initializeDB()
        //if you comment out this makeRealmCompact function, 
        //you'll see that imageProcessor will work
        makeRealmCompact()
        print("finish db init")
    }
    
    func initializeDB(){
        try! realm!.write{
            realm?.deleteAll()
        }
        let photos = PHAsset.fetchAssetsWithMediaType(.Image, options: nil)
        photos.enumerateObjectsUsingBlock{(object, _, _)in
            let photo = object as! PHAsset
            self.addNewLocalPhotoEntryInDatabase(photo)
        }
    }
    
    func makeRealmCompact(){
        let paths = NSSearchPathForDirectoriesInDomains(.LibraryDirectory, .UserDomainMask, true)
        let documentDir = paths[0]
        let compactPath = documentDir + "/randomeStringBlahBlah.realm"
        try! self.realm!.writeCopyToPath(compactPath)
        let originalPath = self.realm!.path
        self.realm!.invalidate()
        realm = nil
        try! NSFileManager.defaultManager().replaceItemAtURL(NSURL(fileURLWithPath: originalPath), withItemAtURL: NSURL(fileURLWithPath: compactPath), backupItemName: nil, options: .UsingNewMetadataOnly, resultingItemURL: nil)
        self.realm = try! Realm()
    }
    
    func addNewLocalPhotoEntryInDatabase (photo : PHAsset){
        let photoEntry = Photo()
        photoEntry.localIdentifier  = photo.localIdentifier
        photoEntry.latitude.value   = photo.location?.coordinate.latitude
        photoEntry.longitude.value  = photo.location?.coordinate.longitude
        photoEntry.creationDate     = photo.creationDate
        photoEntry.heightWidthRatio = Double(photo.pixelHeight)/Double(photo.pixelWidth)
        try! realm!.write{
            realm!.add(photoEntry)
        }
    }
}