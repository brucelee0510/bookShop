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
            print(book)
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
