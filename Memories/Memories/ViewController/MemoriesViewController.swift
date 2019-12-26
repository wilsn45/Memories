//
//  MemoriesViewController.swift
//  Memories
//
//  Created by Wilson Shakya on 24/12/19.
//  Copyright © 2019 Wilson Shakya. All rights reserved.
//

import UIKit

class MemoriesViewController: UIViewController {

    @IBOutlet weak var btnAddMemories: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        btnAddMemories.layer.cornerRadius = 50
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addMemoriesClicked(_ sender: Any) {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let addMemoryViewController = storyBoard.instantiateViewController(withIdentifier: "AddMemoryViewController") as! AddMemoryViewController
        self.present(addMemoryViewController, animated: false, completion: nil)
    }
    
}
