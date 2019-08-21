//
//  RegisterViewController.swift
//
//  This is the View Controller which registers new users with Firebase
//

import UIKit
import Firebase
import FirebaseAuth

class RegisterViewController: UIViewController {

    
    //Pre-linked IBOutlets

    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

  
    @IBAction func registerPressed(_ sender: AnyObject) {
        

        
        //TODO: Set up a new user on our Firbase database
        Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!)
        { // closure
            
            (user, error)  in   // int , bool simplified func
            if error != nil{    // if error is not empty print error
                print(error!)
            }
            else {
                //success
                print("registration succesful") // else successfull and move forward with segue
                self.performSegue(withIdentifier: "goToChat", sender: self)  // perform segue afterwards also self it 
            }
        }// closures
    }
}
//////////////////////////////////////////////////////////////////////////////////////////
//        `FIRAuthErrorCodeInvalidEmail` - Indicates the email address is malformed.
//        + `FIRAuthErrorCodeEmailAlreadyInUse` - Indicates the email used to attempt sign up
//        already exists. Call fetchProvidersForEmail to check which sign-in mechanisms the user
//        used, and prompt the user to sign in with one of those.
//        + `FIRAuthErrorCodeOperationNotAllowed` - Indicates that email and password accounts
//        are not enabled. Enable them in the Auth section of the Firebase console.
//        + `FIRAuthErrorCodeWeakPassword` - Indicates an attempt to set a password that is
//        considered too weak. The NSLocalizedFailureReasonErrorKey field in the NSError.userInfo
//        dictionary object will contain more detailed explanation that can be shown to the user.
