import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class ViewController: UIViewController {
    
    var table:[String:String] = [
        "H":"A colourless, odourless gas. It has the lowest density of all gases.", "He":"A colourless, odourless gas that is totally unreactive.", "L":"A soft, silvery metal. It has the lowest density of all metals. It reacts vigorously with water.",
            "Be":"a silvery-white metal. It is relatively soft and has a low density.",
            "B":"has dark amorphous powder. It is used as a rocket fuel igniter and in pyrotechnic flares.",
            "C":"There are a number of pure forms of this element including graphite, diamond, fullerenes and graphene.",
            "N":"A colourless, odourless gas. It is used to make fertilisers, nitric acid, nylon, dyes and explosives.",
            "O":"A colourless, odourless gas. Living things need to take an energy from it for respiration.",
            "F":"A very pale yellow-green, dangerously reactive gas. It is needed for nuclear power industry to separate isotopes.",
            "Ne":"A colourless, odourless gas. It doesn't react with any substances",
            "Na":"A soft metal that tarnishes within seconds of being exposed to the air. It also reacts vigorously with water.",
            "Mg":"A silvery-white metal that ignites easily in air and burns with a bright light. It ignites easily in air and burns with a bright light, it’s used in flares, fireworks and sparklers.",
            "Al":"A silvery-white, lightweight metal. It is soft and malleable. It has low density, is non-toxic, has a high thermal conductivity, has excellent corrosion resistance",
            "Si":"The element, when ultrapure, is a solid with a blue-grey metallic sheen. The element silicon is used extensively as a semiconductor in solid-state devices in the computer and microelectronics industries. ",
            "P":"Two main forms are white and red. White one is used in flares and incendiary devices. Red one is used in the material stuck on the side of matchboxes, used to strike safety matches against to light them.",
            "S":"The most common appearance is yellow crystals or powder. It is used in the vulcanisation of black rubber, as a fungicide and in black gunpowder.",
            "Cl":"A yellowy-green dense gas with a choking smell. It kills bacteria – it is a disinfectant. It is used to treat drinking water and swimming pool water.",
            "Ar":"A colourless, odourless gas that is totally inert to other substances. It is often used when an inert atmosphere is needed",
            "K":"A soft, silvery metal that tarnishes in air within minutes. The greatest demand for these compounds is in fertilisers.",
            "Ca":"A silvery-white, soft metal that tarnishes rapidly in air and reacts with water. is used as a reducing agent in preparing other metals such as thorium and uranium. There are vast deposits of limestone used directly as a building stone and indirectly for cement."]
    
    //Variables
    var currentQuestion = 0
    var rightAnswerPlacement:UInt32 = 0
    var points = 0
    var lives = 3
    
    //Text View
    @IBOutlet weak var lbl: UITextView!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var livesLabel: UILabel!
    
    
    
    //Button
    @IBAction func action(_ sender: AnyObject)
    {
        if (sender.tag == Int(rightAnswerPlacement))
        {
            print ("RIGHT!")
            points += 1
            scoreLabel.text = String(points)
        }
        else
        {
            print ("WRONG!")
            lives = lives - 1
            livesLabel.text = String(lives)
        }
        
        if (currentQuestion != table.count)
        {
            newQuestion()
        }
        else
        {
            performSegue(withIdentifier: "showScore", sender: self)
        }
        
        if lives == 0 {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") as! SecondVC
            vc.passedInt = self.points
            self.present(vc, animated: true, completion: nil)
            performSegue(withIdentifier: "showScore", sender: self)
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool)
    {
        newQuestion()
    }
    
    //Function that displays new question
    func newQuestion()
    {
        let index: Int = Int(arc4random_uniform(UInt32(table.count)))
        let randomVal = Array(table.values)[index]
        let randomKey = Array(table.keys)[index]
        let wrongRandom = Int(arc4random_uniform(UInt32(table.count)))
        let wrongRandomKey = Array(table.keys)[wrongRandom]
        lbl.text = randomVal
        
        
        
        rightAnswerPlacement = arc4random_uniform(2)+1
        
        //Create a button
        var button:UIButton = UIButton()
        
        for i in 1...2
        {
            //Create a button
            button = view.viewWithTag(i) as! UIButton
            
            if (i == Int(rightAnswerPlacement))
            {
                button.setTitle(randomKey, for: .normal)
            }
            else
            {
                button.setTitle(wrongRandomKey, for: .normal)
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

