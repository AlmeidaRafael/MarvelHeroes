//
//  HeroViewModel.swift
//  MarvelHeroes
//
//  Created by RafaelAlmeida on 16/07/19.
//  Copyright © 2019 RafaelAlmeida. All rights reserved.
//

import Foundation
import UIKit

protocol HomeViewModelDelegate: class {
    func onFetchCompleted(with newIndexPathsToReload: [IndexPath]?)
    func onFetchFailed(with reason: String)
}

final class HomeViewModel {
    private weak var delegate: HomeViewModelDelegate?
    
    var heroes: [Hero] = []
    var imageTasks = [Int: ImageTask]()
    private var total = 0
    private var isFetchInProgress = false
    
    init(delegate: HomeViewModelDelegate) {
        self.delegate = delegate
    }
    
    var totalCount: Int {
        return total
    }
    
    var currentCount: Int {
        return heroes.count
    }
    
    func hero(at index: Int) -> Hero {
        return heroes[index]
    }
    
    func fetchHeroes() {
        guard !isFetchInProgress else {
            return
        }
        
        isFetchInProgress = true
        
        ApiService.shared.fetchAllHeroes(offSet: currentCount){ (response, err) in
            if let err = err {
                DispatchQueue.main.async {
                    self.isFetchInProgress = false
                    self.delegate?.onFetchFailed(with: err.localizedDescription)
                }
            } else {
                DispatchQueue.main.async {
                    self.isFetchInProgress = false
                    self.total = response?.data.total ?? 0
                    if let heroes = response?.data.results {
                        self.heroes.append(contentsOf: heroes)
                    }
                    
                    if self.currentCount > 20 {
                        let indexPathsToReload = self.calculateIndexPathsToReload(from: response!.data.results)
                        self.delegate?.onFetchCompleted(with: indexPathsToReload)
                    } else {
                        self.delegate?.onFetchCompleted(with: .none)
                    }
                }
            }
        }
    }
    
    private func calculateIndexPathsToReload(from newHeroes: [Hero]) -> [IndexPath] {
        let startIndex = heroes.count - newHeroes.count
        let endIndex = startIndex + newHeroes.count
        return (startIndex..<endIndex).map { IndexPath(row: $0, section: 0) }
    }
}
