//
//  FeelingsModel.swift
//  TodayWas
//
//  Created by Devin Daher on 9/6/18.
//  Copyright © 2018 Devin Daher. All rights reserved.
//

import Foundation
import UIKit

class FeelingsModel: NSObject {
    private var feelings:[String:Feeling] //dictionary with array of events
    //private var feelingArr:[Feeling]
    private(set) var currentIndex: Int
    static let sharedInstance = FeelingsModel()
    
    override init(){
        feelings = [String:Feeling]()
        //feelingArr = [Feeling]()
        currentIndex = 0
    }
    
    // Inserting a flashcard
    //should this insert function have params as date and Feeling meaning the Feeling was created elsewhere and passed in, or should it take date, isGood, comment, and create Feeling instance in here
    //next thing i need to think of is should i use singleton? How do i call this function insert without making a singleton? i need to save these feelings for each user...maybe pull from Firebase? maybe i add to FB and pull from there OR should I add to this model first...
    func insert(date:String, isGood: Bool,
                comment: String){
        let newFeeling = Feeling(isGood: isGood, comment: comment)
        //feelings.updateValue(<#T##value: Feeling##Feeling#>, forKey: <#T##String#>)
        //feelings[date] = newFeeling
    }
    
    func numberOfDaysWithFeelings() -> Int{
        return feelings.count
    }
    
    //grabs feeling for a certain date
    func getFeeling(date:String) -> Feeling?{
        //guard let feelingArr = feelings[date] else{return nil}
        if(feelings.count == 0 || feelings[date] == nil){return nil}
        else{
            return feelings[date]
        }
    }
    
//    func addEventsUsingFirebase(date:String, event: Event){
//        guard var savedEventArr = events[date] else{
//            print("in the else of the guard....")
//            var newArr = [Event]()
//            newArr.append(event)
//            events[date] = newArr
//            print("######### the dictionary count is now: \(events.count) and the array size at this date is: \(newArr.count)")
//            return
//        }
//        savedEventArr.append(event)
//        events[date] = savedEventArr
//    }
//
//    //removes an event
//    func removeEvent(date: String, index: Int){
//        guard var dayEventsArray = events[date] else{return}
//        if(dayEventsArray.count > 0){
//            if(index < dayEventsArray.count && index >= 0){
//                dayEventsArray.remove(at: index)
//            }
//        }
//    }
}


