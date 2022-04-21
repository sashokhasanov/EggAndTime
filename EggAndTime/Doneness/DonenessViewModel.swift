//
//  DonenessViewModel.swift
//  EggAndTime
//
//  Created by Сашок on 22.04.2022.
//

import Foundation

class DonenessViewModel {
    var name: String {
        doneness.name
    }
    
    var imageName: String {
        doneness.imageName
    }
    
    private var doneness: Doneness
    
    init(_ doneness: Doneness) {
        self.doneness = doneness
    }
}
