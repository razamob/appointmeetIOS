//  View Controller which registers new users with Firebase
// Completed By Mobeen Raza
// Register Controller for functionality of Register view

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    //components
    @IBOutlet var emailText: UITextField!
    @IBOutlet var passwordText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

  
    @IBAction func registerPressed(_ sender: AnyObject) {
        //Create a user once info is input
        Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { (user, error) in
            //print error if its there
            if error != nil {
                print(error!)
            }
            else{
                //else print registered and move user to options screen
                print("Registered")
                self.performSegue(withIdentifier: "goToOpts", sender: self)
            }
        
        
    } 
    
    
}
}
