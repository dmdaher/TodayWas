//
//  Feeling.swift
//  TodayWas
//
//  Created by Devin Daher on 9/6/18.
//  Copyright © 2018 Devin Daher. All rights reserved.
//

import Foundation

class Feeling: NSObject{
    //var feel : String
    var comment : String
    var isGood : Bool
    
//    init(feel: String, comment: String){
//        self.feel = feel;
//        self.comment = comment;
//    }
    
    init(isGood: Bool, comment: String){
        self.isGood = isGood;
        self.comment = comment;
    }
}
