//
//  ListTableViewController.swift
//  bookShop
//
//  Created by BruceLee on 2017/11/30.
//  Copyright © 2017年 BruceLee. All rights reserved.
//

import UIKit

struct NotificationObjectKey{
    static let bookName = "bookName"
    static let bookAuthor = "bookAuthor"
    static let tag = 3
}
extension Notification.Name{
    static let bookEdited = Notification.Name("bookEdited")
}

class ListTableViewController: UITableViewController{
    var books = [Book]()
    @IBOutlet var BookNameLabels: [UILabel]!
    @IBOutlet var BookCoverImages: [UIImageView]!
    @IBOutlet var BookAuthorLabels: [UILabel]!


    struct PropertyKeys{
        static let storySegue1 = "editStory1"
        static let storySegue2 = "editStory2"
    }
    @IBAction func edit1Clicked(_ sender: Any) {
        performSegue(withIdentifier: PropertyKeys.storySegue1, sender: sender)
    }
    @IBAction func edit2Clicked(_ sender: Any) {
        performSegue(withIdentifier: PropertyKeys.storySegue2, sender: sender)
    }
    
    //edit1 exit的unwind1
    @IBAction func unwindToList1(segue: UIStoryboardSegue) {
        let source = segue.source as? Edit1TableViewController
        if let book = source?.book, let row = source?.tag{
            books[row] = book
            BookNameLabels[row].text = book.name
            BookAuthorLabels[row].text = book.author
        }
    }
    
    //edit2 exit的unwind2
    @IBAction func unwindToList2(segue: UIStoryboardSegue) {}
    
    //notification觸發時執行此func
    @objc func updateBookNoti(noti: Notification){
        if let userInfo = noti.userInfo, let row = userInfo[NotificationObjectKey.tag] as? Int, let bookName = userInfo[NotificationObjectKey.bookName] as? String, let bookAuthor = userInfo[NotificationObjectKey.bookAuthor] as? String{
            var book = books[row]
            book.name = bookName
            book.author = bookAuthor
            books[row] = book
            BookNameLabels[row].text = bookName
            BookAuthorLabels[row].text = bookAuthor
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
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateBookNoti(noti:)), name: .bookEdited, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == PropertyKeys.storySegue1{
            if let button = sender as? UIButton{
                let editTableViewController = segue.destination as? Edit1TableViewController
                editTableViewController?.book = books[button.tag]
                editTableViewController?.tag = button.tag
                
            }
        }else if segue.identifier == PropertyKeys.storySegue2{
            if let button = sender as? UIButton{
                let editTableViewController = segue.destination as? Edit2TableViewController
                editTableViewController?.book = books[button.tag]
                editTableViewController?.tag = button.tag
                
            }
        }else if let row = tableView.indexPathForSelectedRow?.row{
            let storyViewController = segue.destination as? StoryViewController
            storyViewController?.book = books[row]
        }
    }
}
