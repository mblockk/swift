
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loginusername: UITextField!
    @IBOutlet weak var loginpassword: UITextField!
    @IBOutlet weak var invalidmsg: UILabel!
    
    struct GlobalVariable{
        static var un = String()
    }
    
    var secondVC:SecondViewController? = nil
    
    @IBAction func buttonPressed(_ sender: Any) {
        let secondVC:SecondViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        self.present(secondVC, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secondVC = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController)

    }
    override func viewDidAppear(_ animated: Bool) {
    }

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        let user = loginusername.text!
        let pw = loginpassword.text!
        if let login = secondVC?.userpass[user] {
            if login == pw{
                ViewController.GlobalVariable.un = user
                saveLoggedState()
                return true;
            }            
        }
        invalidmsg.isHidden = false
        
        return false      
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    func saveLoggedState() {
        let def = UserDefaults.standard
        def.set(true, forKey: "loggedin")
        def.set(ViewController.GlobalVariable.un, forKey: "username")
        def.synchronize()
    }
    
}

