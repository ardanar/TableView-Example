//
//  EmojiTableViewCell.swift
//  UITableView
//
//  Created by Arda Nar on 16.12.2022.
//

import UIKit

class EmojiTableViewCell: UITableViewCell {

    // MARK: - UI Elements
    @IBOutlet var symbolLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!

    // MARK: - Functions
    func update(with emoji: Emoji){
        symbolLabel.text = emoji.symbol
        nameLabel.text = emoji.name
        descriptionLabel.text = emoji.description
    }
    
}
