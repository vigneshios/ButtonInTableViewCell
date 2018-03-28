//
//  InstaCell.swift
//  ButtonsInTableViewCell
//
//  Created by Apple on 28/03/18.
//  Copyright © 2018 Vignesh. All rights reserved.
//

import UIKit

protocol MyCellDelegate {
    func didLikeButtonTapped(_ sender: InstaCell)
    func didLoveButtonTapped(_ sender: InstaCell)
    func didDeleteButtontapped(_ sender: InstaCell)
}


class InstaCell: UITableViewCell {

    // Outlets
    @IBOutlet weak var quoteTextLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var loveButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    // Variables
    var delegate: MyCellDelegate?
    
    
    func configureCell(quote: Insta){
        quoteTextLabel.text = quote.quote
    }
    
    // Actions
    @IBAction func likeButtonTapped(_ sender: Any) {
        print("Like Tapped")
        delegate?.didLikeButtonTapped(self)
    }
    
    @IBAction func loveButtonTapped(_ sender: Any) {
        print("Love Tapped")
        delegate?.didLoveButtonTapped(self)
    }
    
    @IBAction func deletequote(_ sender: Any) {
        delegate?.didDeleteButtontapped(self)
    }
    
}
