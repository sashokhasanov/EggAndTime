//
//  EggViewModel.swift
//  EggAndTime
//
//  Created by Сашок on 22.04.2022.
//

import Foundation

class EggViewModel {
    var name: String {
        egg.name
    }
    
    var imageName: String {
        egg.imageName
    }
    
    private let egg: Egg
    
    init(_ egg: Egg) {
        self.egg = egg
    }
}
