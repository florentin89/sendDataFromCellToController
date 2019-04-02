//
//  PopUpVC.swift
//  SendDataSwift
//
//  Created by Florentin Lupascu on 02/04/2019.
//  Copyright © 2019 Florentin Lupascu. All rights reserved.
//

import UIKit

protocol PopUpDelegate {
    func receiveFirstComment(firstComment: String)
}

class PopUpVC: UIViewController {

    // Interface Links
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var cancelBtnOutlet: UIButton!
    @IBOutlet weak var saveBtnOutlet: UIButton!
    @IBOutlet weak var firstCommentTextField: UITextField!
    @IBOutlet weak var secondCommentTextField: UITextField!
    @IBOutlet weak var popUpView: UIView!
    
    // Properties
    var delegate: PopUpDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // Setup the design for outlets
    func setupViews(){
        
        popUpView.layer.cornerRadius = 20
        popUpView.layer.masksToBounds = true
        
        cancelBtnOutlet.layer.cornerRadius = 5
        saveBtnOutlet.layer.cornerRadius = 5
    }
    
    @IBAction func cancelBtnTapped(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveBtnTapped(_ sender: UIButton) {
        
        delegate?.receiveFirstComment(firstComment: firstCommentTextField.text ?? "")
        dismiss(animated: true, completion: nil)
    }
    
    // Function to hide the Popup when the user click anywhere on the screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if touch?.view == self.view {
            dismiss(animated: true, completion: nil)
        }
    }
    
}
