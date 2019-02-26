//
//  FeedTableViewController.swift
//  week 4 inclass
//
//  Created by Michael Block on 11/26/18.
//  Copyright © 2018 Michael Block. All rights reserved.
//

import UIKit

class FeedTableViewController: UITableViewController {
    var array = [UInt64(0)]
    var curlength = 100

    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "userPostFeedCell")
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "fib")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return curlength
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "fib", for: indexPath)
        
        
        if indexPath.row == curlength - 1 {
            curlength += 100
            tableView.reloadData()
        }
        
        let curval = self.array.last!
        let curStr = String(curval)
        cell.textLabel?.text = curStr
        
        self.array.append(fib(UInt64(self.array.count)))
        
        
        return cell

}

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 40
    
    }
    
    func fib(_ n: UInt64) -> UInt64 {
        let ct = self.array.count
        if (ct > 2){
            print(ct)
            return self.array[ct-1] + self.array[ct-2]
        }
        else{
        return n < 2 ? n : (fib(n-1) + fib(n-2))
        }
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

