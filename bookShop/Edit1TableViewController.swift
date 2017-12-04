//
//  Edit1TableViewController.swift
//  bookShop
//
//  Created by BruceLee on 2017/11/30.
//  Copyright © 2017年 BruceLee. All rights reserved.
//

import UIKit

class Edit1TableViewController: UITableViewController,UITextFieldDelegate {
    
    var book: Book?
    var tag: Int?

    @IBOutlet var bookImg: UIImageView!
    @IBOutlet var bookName: UITextField!
    @IBOutlet var bookAuthor: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let book = book {
            bookImg.image = UIImage(named:book.imgName)
            bookName.text = book.name
            bookAuthor.text = book.author
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        book?.name = bookName.text ?? ""
        book?.author = bookAuthor.text ?? ""
    }
}
