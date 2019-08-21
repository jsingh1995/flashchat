//
//  LogInViewController.swift
//  This is the view controller where users login


import UIKit
import Firebase
import FirebaseAuth

class LogInViewController: UIViewController {

    //Textfields pre-linked with IBOutlets
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

   
    @IBAction func logInPressed(_ sender: AnyObject) {

        
        //TODO: Log in the user
        Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            
            if error !=  nil{
                print(error!) // if there is an eeror
            }
            else {
                print("Log in Successful")
            }
        }
         self.performSegue(withIdentifier: "goToChat", sender: self)
    }

//    { // closure
//
//    (user, error)  in   // int , bool simplified func
//    if error != nil{    // if error is not empty print error
//    print(error!)
//    }
//    else {
//    //success
//    print("registration succesful") // else successfull and move forward with segue
//    self.performSegue(withIdentifier: "goToChat", sender: self)
//    }
//    }// closures

    
}  
