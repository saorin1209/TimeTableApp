//
//  Class.swift
//  timeTableApp
//
//  Created by staff on 2018/11/11.
//  Copyright © 2018年 staff. All rights reserved.
//

import UIKit

class Class: NSObject, NSCoding {
    
    let className: String
    let roomName: String
    let cellNumber: Int
    
    init(className: String, roomName: String, cellNumber: Int) {
        
        self.className = className
        self.roomName = roomName
        self.cellNumber = cellNumber
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.className, forKey: "name")
        aCoder.encode(self.roomName, forKey: "room")
        aCoder.encode(self.cellNumber, forKey: "number")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.className = aDecoder.decodeObject(forKey: "name") as! String
        self.roomName = aDecoder.decodeObject(forKey: "room") as! String
        self.cellNumber = aDecoder.decodeInteger(forKey: "number")
    }
}
