import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class SecondVC: UIViewController {
    
    var passedInt = Int()
    var email = String()
    var password = String()
    var uid = String()
    var score = 0
    
    @IBOutlet weak var finalScore: UILabel!
    
    var ref: FIRDatabaseReference!
    
    
    @IBAction func buttonPressed(sender: AnyObject) {
        print(passedInt)
        print(uid)
    
        ref.child(uid).setValue(["Score": passedInt])
        ref = FIRDatabase.database().reference()
        
    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
    self.present(nextViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        finalScore.text = String(passedInt)
    }
    

        override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
