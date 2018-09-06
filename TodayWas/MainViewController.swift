//
//  MainViewController.swift
//  TodayWas
//
//  Created by Devin Daher on 8/18/18.
//  Copyright © 2018 Devin Daher. All rights reserved.
//

import UIKit
import Firebase

class MainViewController: UIViewController, UINavigationControllerDelegate, UITextViewDelegate, UITextFieldDelegate {
    @IBOutlet weak var detailTextView: UITextView!
    @IBOutlet weak var feelingLabel: UILabel!
    
    let today = Date()
    let formatter = DateFormatter()
    override func viewDidLoad() {
        super.viewDidLoad()
        //swipe right gesture
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight(gesture:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        //swipe left gesture
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft(gesture:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        if Auth.auth().currentUser == nil{
//            self.performSegue(withIdentifier: "return", sender: self)
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func swipeRight(gesture: UISwipeGestureRecognizer){
        
        let newFeeling = Feeling(isGood: true,comment: detailTextView.text)
        let todayString = formatter.string(from: today)
        print("what is the date: \(todayString)")
        //addToDB(newFeeling)
    }
    
    @objc func swipeLeft(gesture: UISwipeGestureRecognizer){
        let newFeeling = Feeling(isGood: false,comment: detailTextView.text)
    }
    
    func addToDB(date: String, newFeeling: Feeling){
        
    }
    
//    func textField(_ textField: UITextField,
//                   shouldChangeCharactersIn range: NSRange,
//                   replacementString string: String) -> Bool{
//        let changedString = (textField.text as NSString?)?.replacingCharacters(in: range, with: string) ?? string
//        if string == "\n"{
//            textField.resignFirstResponder()
//            return false
//        }else{
//            checkIfFieldsAreEmpty(questionText: questionInputLabel.text, answerText: changedString)
//            return true
//        }
//    }
    
//    func textView(_ textView: UITextView,
//                  shouldChangeTextIn affectedCharRange: NSRange,
//                  replacementText replacementString: String) -> Bool{
//        let changedString = (textView.text as NSString?)?.replacingCharacters(in: affectedCharRange, with: replacementString) ?? replacementString
//        if replacementString == "\n" {
//            textView.resignFirstResponder()
//            return false
//        }
//        else{
//            checkIfFieldsAreEmpty(questionText: changedString, answerText: answerInputLabel.text!)
//            return true
//        }
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
