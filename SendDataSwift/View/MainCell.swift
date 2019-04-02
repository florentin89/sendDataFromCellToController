//
//  PopUpCell.swift
//  SendDataSwift
//
//  Created by Florentin Lupascu on 02/04/2019.
//  Copyright © 2019 Florentin Lupascu. All rights reserved.
//

import UIKit

protocol MainCellDelegate {
    func tappedOnPassOrFail(passBtn: UIButton, failBtn: UIButton)
    func tapGestureOnCell()
    func receiveImageViewFromCell(imageView: UIImageView)
}

class MainCell: UITableViewCell {
    
    // Interface Links
    @IBOutlet weak var nameOfCheckLabel: UILabel!
    @IBOutlet weak var passButton: UIButton!
    @IBOutlet weak var failButton: UIButton!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var tagIconImageView: UIImageView!
    @IBOutlet weak var tagNameLabel: UILabel!
    @IBOutlet weak var selectedImageView: UIImageView!
    
    // Properties
    var delegate: MainCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Register Gesture for cell
        let longTapGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.tapEdit(sender:)))
        addGestureRecognizer(longTapGesture)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @objc func tapEdit(sender: UITapGestureRecognizer) {
        delegate?.tapGestureOnCell()
    }
    
    // Config the cell for Defect and Damage Check
    func configCell(){
        
        nameOfCheckLabel.text = "Do you smoke ?"
        commentLabel.text = "Looong text"
        tagNameLabel.text = "Tag name 1, tag name 2, tag name 3, tag name 4, tag name 5"
        passButton.imageView?.image = UIImage(named: "whiteTickIcon")
        failButton.imageView?.image = UIImage(named: "whiteCrossIcon")
        delegate?.receiveImageViewFromCell(imageView: selectedImageView)
    }
    
    @IBAction func passBtnOrFailBtnTapped(_ sender: UIButton) {
        
        delegate?.tappedOnPassOrFail(passBtn: passButton, failBtn: failButton)
    }
    
}
