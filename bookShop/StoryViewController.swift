//
//  StoryViewController.swift
//  bookShop
//
//  Created by BruceLee on 2017/12/1.
//  Copyright © 2017年 BruceLee. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController {
    var book: Book?
    
    @IBOutlet var bookImg: UIImageView!
    @IBOutlet var bookStory: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let book = book {
            navigationItem.title = "\(book.name)"
            bookImg.image = UIImage(named:"\(book.imgName)")
            bookStory.text = book.story
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
