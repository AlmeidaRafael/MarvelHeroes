//
//  HeroViewModel.swift
//  MarvelHeroes
//
//  Created by RafaelAlmeida on 22/07/19.
//  Copyright © 2019 RafaelAlmeida. All rights reserved.
//

import Foundation
import UIKit

struct HeroViewModel {
    let hero: Hero
    let image: URL
    
    init(hero: Hero) {
        self.hero = hero
        let url = hero.thumbnail.path + APIUtils.imageLandscapeAmazing + hero.thumbnail.imgExtension
        self.image = URL(string: url)!
    }
}
