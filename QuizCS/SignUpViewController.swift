import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class SignUpViewController: UIViewController {

    //Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var ref: FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = FIRDatabase.database().reference()
    }
    
    //Sign Up Action for email    
    @IBAction func createAccountAction(_ sender: AnyObject) {
        if emailTextField.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please enter your email and password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        } else {
            FIRAuth.auth()?.createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
                
                if error == nil {
                    print("You have successfully signed up")
                    //Goes to the Setup page which lets the user take a photo for their profile picture and also chose a username
                    
                    let userID: String = user!.uid
                    let userEmail: String = self.emailTextField.text!
                    let userPassword: String = self.passwordTextField.text!
                    let userScore = 0
                    
                    self.ref.child("Users").child(userID).setValue(["Email": userEmail, "Password": userPassword, "Score": userScore])
                    
                    print("Registered " + user!.uid)
                    
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                    vc.stringPassed = self.emailTextField.text!
                    self.present(vc, animated: true, completion: nil)
                    
                    
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main1", bundle:nil)
                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
                    
                    nextViewController.uid = userID
                    nextViewController.score = userScore
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
      
    }
}
}
