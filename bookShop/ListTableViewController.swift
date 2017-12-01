//
//  ListTableViewController.swift
//  bookShop
//
//  Created by BruceLee on 2017/11/30.
//  Copyright © 2017年 BruceLee. All rights reserved.
//

import UIKit

class ListTableViewController: UITableViewController {
    var books = [Book]()
    @IBOutlet var BookNameLabels: [UILabel]!
    @IBOutlet var BookCoverImages: [UIImageView]!
    @IBOutlet var BookAuthorLabels: [UILabel]!

   
    struct PropertyKeys{
        static let storySegue = "bookStory"
    }
    @IBAction func editClicked(_ sender: Any) {
        performSegue(withIdentifier: PropertyKeys.storySegue, sender: nil)
    }
    
    @IBAction func unwindToList(segue: UIStoryboardSegue) {
        let source = segue.source as? EditTableViewController
        if let book = source?.book, let row = tableView.indexPathForSelectedRow?.row{
            books[row] = book
            BookNameLabels[row].text = book.name
            BookAuthorLabels[row].text = book.author
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        books.append(Book(name:"人人都能學會製作厲害圖表", author:"Smart智富", imgName:"book1", story:"""
            詐騙集團＆惡德商法評論家‧首度公開——
            27個詐騙集團經典話術與心理戰術
            談判、推銷、會報、客訴……
            掌握人心，順利談判，就靠這一本！
            """))
        books.append(Book(name:"Google6大神器‧提升工作效率100%", author:"Smart智富", imgName:"book2",story:"""
            讓你學會受用一生的策略思考
            只要遵照四大步驟,論點整理+假設擬定+執行方案 +PDCA
            人生所有疑難雜症都將迎刃而解！
            """))
        for i in 0..<BookNameLabels.count{
            BookNameLabels[i].text = books[i].name
            BookAuthorLabels[i].text = books[i].author
            BookCoverImages[i].image = UIImage(named: books[i].imgName)
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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

    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == PropertyKeys.storySegue {
            if let button = sender as? UIButton{
                let StoryViewController = segue.destination as? StoryViewController
                StoryViewController?.book = books[button.tag]
            }else if let row = tableView.indexPathForSelectedRow?.row{
                let editTableViewController = segue.destination as? EditTableViewController
                editTableViewController?.book = books[row]
            }
        }
        
        
//        let editTableViewController = segue.destination as? EditTableViewController
//        if let row = tableView.indexPathForSelectedRow?.row{
//            editTableViewController?.book = books[row]
//        }
//        if let indexPath = tableView.indexPathForSelectedRow{
//            editTableViewController?.book = books[indexPath.row]
//        }
    }
 

}
