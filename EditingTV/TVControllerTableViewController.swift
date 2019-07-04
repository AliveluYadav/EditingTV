//
//  TVControllerTableViewController.swift
//  EditingTV
//
//  Created by Alivelu Ravula on 4/7/18.
//  Copyright © 2018 Alivelu Ravula. All rights reserved.
//

import UIKit

class TVControllerTableViewController: UITableViewController {

    var actorsArry=["chiru","Ram Charan","Sai Dharam","varun","venkky","Nag","nani"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
//         self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return actorsArry.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:"qwe", for: indexPath)
        cell.textLabel?.text=actorsArry[indexPath.row]

        // Configure the cell...

        return cell
    }


    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle
        
    {
        if(indexPath.row<=3){
        return UITableViewCellEditingStyle.insert
    }
   else if(indexPath.row>3 && indexPath.row<=5)
        {
            return .delete
        }
        else
        {
            return .none
        }
    }
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            self.actorsArry.remove(at: indexPath.row)
            self.actorsArry.remove(at: 2)
            self.actorsArry.remove(at: 3)
            
            var seccondIP = IndexPath(row:2,section:0)
            var thirdIP = IndexPath(row:3,section:0)

            tableView.deleteRows(at: [indexPath,seccondIP,thirdIP], with:UITableViewRowAnimation.right)
            
            
//            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        else if editingStyle == .insert {
            
            self.actorsArry.insert("kajal", at: indexPath.row)
            tableView.insertRows(at: [indexPath], with: UITableViewRowAnimation.left)
           
        }    
    }
    

//
//    // Override to support rearranging the table view.
//    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//
//    }
//

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)
    {
        var sourceArryItem=self.actorsArry[sourceIndexPath.row]
        self.actorsArry.remove(at: sourceIndexPath.row)
        self.actorsArry.insert(sourceArryItem, at: destinationIndexPath.row)

    
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
