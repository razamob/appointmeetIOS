//  LogInViewController.swift
//  Completed By Mobeen Raza
// Controller for functionaity of login view
import UIKit
import Firebase

class LogInViewController: UIViewController {

    //components
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

   
    @IBAction func logInPressed(_ sender: AnyObject) {

        //Use firebase to try and ogin
        Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            //print error if there is one
            if(error != nil){
                print(error!)
            }
            else{
                //else print success and go to option view
                print("Successfully logged in")
                self.performSegue(withIdentifier: "goToOption", sender: self)
            }
        }
        
        
    }
    


    
}  
