

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var userpass = ["cat": "meow", "dog":"woof", "parrot":"squawk"]
    
    struct GlobalVariable{
        static var currentUser = String()
    }
    let def = UserDefaults.standard
    
    @IBOutlet weak var SVCTV: UITableView!
    
    @IBAction func logOutButtonPressed(_ sender: Any) {
        //navigationController?.popViewController(animated: true)
        self.dismiss(animated: true
            , completion: nil)
        let domain = Bundle.main.bundleIdentifier!
        def.removePersistentDomain(forName: domain)
        def.synchronize()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
        
    }    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    
        let loggedIn = def.bool(forKey: "loggedin")
        
        SecondViewController.GlobalVariable.currentUser = ViewController.GlobalVariable.un
        
        if loggedIn {
            if let user = def.string(forKey: "username") {
                SecondViewController.GlobalVariable.currentUser = user
            }
        }
        cell.textLabel?.text = SecondViewController.GlobalVariable.currentUser
        
        return cell
    }
    override func viewDidAppear(_ animated: Bool) {
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }

}
