//
//  ViewController.swift
//  Memories
//
//  Created by Wilson Shakya on 24/12/19.
//  Copyright © 2019 Wilson Shakya. All rights reserved.
//

import UIKit

class GetInViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var messageView: UIView!
    
    @IBOutlet weak var messageLabel: UILabel!
    var viewModel: GetInViewModel!
    
    @IBOutlet weak var centerView: UIView!
    
    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var btnGetIn: LoadingButton!
    

    @IBOutlet weak var messageLabelHeightConstraint: NSLayoutConstraint!
    var emailID = String()
    let dialogeColor = UIColor.init(red: 37/255.0, green: 194/255.0, blue: 240/255.0, alpha: 1)
    let warningColor = UIColor.init(red: 247/255.0, green: 220/255.0, blue: 149/255.0, alpha: 1)
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = GetInViewModel()
        messageView.layer.cornerRadius = 10
        centerView.layer.cornerRadius = 5
        txtField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func btnGetInClicked(_ sender: Any) {
        
        if (txtField.text?.isEmpty)! {
            messageView.isHidden = false
            messageView.backgroundColor = warningColor
            messageLabel.text = Message.emptyField
            return
        }
        switch viewModel.getInState {
        case .UserExists:
            handleEmailUI()
        case .OTPVerification:
            handleOTPUI()
        case .UserNameSet :
            handleUserNameSetUI()
        }
    }
    
    func handleEmailUI() {
        if !Utility.validateEmail(emailID: txtField.text!) {
            messageView.isHidden = false
            messageView.backgroundColor = UIColor.red
            messageLabel.text = Message.invalidEmailId
            return
        }
        
//        btnGetIn.showLoading()
        emailID = txtField.text!
        messageView.isHidden = false
        let apiResponse = viewModel.isUserExists(email: txtField.text!)

        if apiResponse == .success {
            messageView.backgroundColor = dialogeColor
            messageLabel.text = Message.otpSent
            txtField.text = ""
            txtField.placeholder = "One Time Code"
            if viewModel.isUserExist {
                btnGetIn.setTitle("Get In", for: .normal)
            }
            else {
                btnGetIn.setTitle("Verify Me", for: .normal)
            }
        }
        else {
            messageView.backgroundColor = UIColor.red
            messageLabel.text = Message.apiFailed
        }
    }
    
    func handleOTPUI() {
        if !Utility.validateOTC(otc: txtField.text!){
            messageView.isHidden = false
            messageView.backgroundColor = UIColor.red
            messageLabel.text = Message.invalidOtc
            return
        }
       // btnGetIn.showLoading()
        
        let apiResponse = viewModel.isOTPVerified(otp: txtField.text!)
        if apiResponse == .success {
            
            if viewModel.isUserExist == true {
                NavigateToMemories()
                return
            }
            messageView.backgroundColor = dialogeColor
            messageLabel.text = Message.newUserMessage
            txtField.text = ""
            txtField.placeholder = "User Name"
            btnGetIn.setTitle("Start Memoring", for: .normal)
        }
        else {
            messageView.backgroundColor = UIColor.red
            messageLabel.text = Message.apiFailed
        }
    }
    
    func handleUserNameSetUI () {
        let apiResponse = viewModel.setUserName(userName: txtField.text!)
       
        if apiResponse == .success {
           NavigateToMemories()
        }
        else {
            messageView.backgroundColor = UIColor.red
            messageLabel.text = Message.apiFailed
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func NavigateToMemories() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let memoryViewController = storyBoard.instantiateViewController(withIdentifier: "MemoriesViewController") as! MemoriesViewController
        self.present(memoryViewController, animated: false, completion: nil)
    }
}


