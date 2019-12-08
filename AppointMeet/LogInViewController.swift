//  LogInViewController.swift
//  Completed By Mobeen Raza
import UIKit
import Firebase

class LogInViewController: UIViewController {

    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

   
    @IBAction func logInPressed(_ sender: AnyObject) {

        Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            if(error != nil){
                print(error!)
            }
            else{
                print("Successfully logged in")
                self.performSegue(withIdentifier: "goToOption", sender: self)
            }
        }
        
        
    }
    


    
}  
