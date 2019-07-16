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
    @IBOutlet weak var viewContainer: UIView!
    
    var heroViewModel: HeroViewModel! {
        didSet {
            lbName.text = heroViewModel.hero.name
            lbDescription.text = heroViewModel.hero.description
            imgHero.image = heroViewModel.image
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewContainer.layer.cornerRadius = 20
        viewCard.layer.cornerRadius = 20
        viewCard.layer.shadowColor = UIColor.black.cgColor
        viewCard.layer.shadowOpacity = 0.3
        viewCard.layer.shadowOffset = .zero
        viewCard.layer.shadowRadius = 6
        viewCard.layer.shouldRasterize = true
        viewCard.layer.rasterizationScale = UIScreen.main.scale
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
