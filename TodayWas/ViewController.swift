//
//  ViewController.swift
//  How_was_your_day
//
//  Created by Devin Daher on 8/15/18.
//  Copyright © 2018 Devin Daher. All rights reserved.
//

import UIKit
import Firebase
//import FirebaseDatabase

class ViewController: UIViewController {
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var invalidTextLabel: UILabel!
    var ref: DatabaseReference!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        invalidTextLabel.text = ""
        ref = Database.database().reference()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //grabs currently logged in user and sends them to main page instead of sign in screen
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        if Auth.auth().currentUser != nil{
//            self.performSegue(withIdentifier: "toMainScreen", sender: self)
//        }
    }
    
    @IBAction func loginButton(_ sender: Any) {
        guard let email = self.emailTextField.text else{return}
        guard let password = self.passwordTextField.text else{return}
        
        Auth.auth().signIn(withEmail: email, password: password){ user, error in
            if error == nil && user != nil{
                self.dismiss(animated: false, completion: nil)
                self.performSegue(withIdentifier: "toMainScreen", sender: self)
                self.emailTextField.text = ""
                self.passwordTextField.text = ""
            }
            else{
                self.invalidTextLabel.text = error!.localizedDescription
                self.invalidTextLabel.textColor = UIColor.red
            }
            
        }
    }
    
    @IBAction func registerButton(_ sender: Any) {
        guard let username = self.emailTextField.text else{return}
        guard let email = self.emailTextField.text else{return}
        guard let password = self.passwordTextField.text else{return}
        //if creating user succeeds, performs segue to main calendar screen
        //if not, error is shown
        Auth.auth().createUser(withEmail: email, password: password){ user, error in
            if error == nil && user != nil{
                self.performSegue(withIdentifier: "toMainScreen", sender: self)
                self.emailTextField.text = ""
                self.passwordTextField.text = ""
                //add user to database
                //let userID = Auth.auth().currentUser!.uid
                self.saveProfile()
                //change request
                print("Welcome, \(username)")
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = username
                changeRequest?.commitChanges{ error in
                    if error == nil{
                        print ("User display name changed!")
                        //                        self.dismiss(animated: false, completion: nil)
                    }
                }
            }
            else{
                self.invalidTextLabel.text = error!.localizedDescription
                self.invalidTextLabel.textColor = UIColor.red
                //                print("Error creating user: \(error!.localizedDescription)")
            }
        }
    }
    
    func saveProfile(){
        print("in save profile")
        guard let currUser = Auth.auth().currentUser else{return}
        self.ref.child("users").child(currUser.uid).setValue(["email":(currUser.email)!])
//        var profileRef:DocumentReference? = nil
//        profileRef = self.db.collection("users").addDocument(data: [
//            "email": Auth.auth().currentUser?.email as Any
//        ]) { err in
//            if let err = err {
//                print("Error adding document: \(err)")
//            } else {
//                print("Document added with ID: \(profileRef!.documentID)")
//            }
//        }
        
    }


}

