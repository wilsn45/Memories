//
//  AddMemoryViewController.swift
//  Memories
//
//  Created by Wilson Shakya on 25/12/19.
//  Copyright © 2019 Wilson Shakya. All rights reserved.
//

import UIKit

class AddMemoryViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var imgViewBack: UIImageView!
    
    @IBOutlet weak var memoryTitleTxt: UITextField!
    
    @IBOutlet weak var memoryDescTextView: UITextView!
    
    @IBOutlet weak var memoryDescriptionHeiightConstraint: NSLayoutConstraint!
    var descHeightConter = 140
    override func viewDidLoad() {
        super.viewDidLoad()
        memoryDescTextView.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == Message.memoryDescPlaceholder {
            textView.text = ""
        }
    }
//    public func textViewDidChange(_ textView: UITextView) {
////        print(textView.text.count)
//        if textView.text.count > descHeightConter {
//            memoryDescriptionHeiightConstraint.constant = memoryDescriptionHeiightConstraint.constant + 20
//            descHeightConter = descHeightConter + 35
//        }
    
 //   }

}
