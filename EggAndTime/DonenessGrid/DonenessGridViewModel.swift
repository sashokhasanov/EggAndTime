//
//  DonenessGridViewModel.swift
//  EggAndTime
//
//  Created by Сашок on 20.04.2022.
//

import Foundation

class DonenessGridViewModel: ObservableObject {
    @Published var cells: [DonenessViewModel] = []
    
    func fetchDoneness(eggName: String) async {
        if let doneness = EggStore.doneness[eggName] {
            self.cells = doneness.map { DonenessViewModel($0) }
        }
    }
}
