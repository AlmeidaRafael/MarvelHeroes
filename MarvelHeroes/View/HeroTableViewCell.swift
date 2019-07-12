//
//  HeroTableViewCell.swift
//  MarvelHeroes
//
//  Created by Rafael Almeida Oliveira on 12/07/19.
//  Copyright © 2019 RafaelAlmeida. All rights reserved.
//

import UIKit

class HeroTableViewCell: UITableViewCell {

    @IBOutlet weak var imgHero: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    @IBOutlet weak var viewCard: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewCard.layer.cornerRadius = 20
        viewCard.layer.shadowColor = UIColor.black.cgColor
        viewCard.layer.shadowOpacity = 0.4
        viewCard.layer.shadowOffset = .zero
        viewCard.layer.shadowRadius = 6
        viewCard.layer.shouldRasterize = true
        viewCard.layer.rasterizationScale = UIScreen.main.scale
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(name: String, description: String) {
        lbName?.text = name
        lbDescription?.text = description
    }
    
}
