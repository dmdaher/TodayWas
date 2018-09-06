//
//  SettingsViewController.swift
//  TodayWas
//
//  Created by Devin Daher on 9/6/18.
//  Copyright © 2018 Devin Daher. All rights reserved.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {
    @IBOutlet weak var logOutButton: UIButton!
    @IBAction func logOutUser(_ sender: Any) {
        try! Auth.auth().signOut()
        
        self.performSegue(withIdentifier: "returnToLogin", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
