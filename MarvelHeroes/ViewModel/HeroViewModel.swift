//
//  HeroViewModel.swift
//  MarvelHeroes
//
//  Created by RafaelAlmeida on 16/07/19.
//  Copyright © 2019 RafaelAlmeida. All rights reserved.
//

import Foundation
import UIKit

struct HeroViewModel {
    let hero: Hero
    let image: UIImage?
    
    init(hero: Hero, image: UIImage?) {
        self.hero = hero
        self.image = image
    }
}
