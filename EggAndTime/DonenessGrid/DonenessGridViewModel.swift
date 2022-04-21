//
//  DonenessGridViewModel.swift
//  EggAndTime
//
//  Created by Сашок on 20.04.2022.
//

import Foundation

class DonenessGridViewModel: ObservableObject {
    @Published var cells: [DonenessViewModel] = []
    
    func fetchData(eggName: String) async {
        if let doneness = EggStore.doneness[eggName] {
            cells = doneness.map { DonenessViewModel($0) }
        }
    }
}
