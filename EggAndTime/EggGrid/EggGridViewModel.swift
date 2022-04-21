//
//  EggGridViewModel.swift
//  EggAndTime
//
//  Created by Сашок on 20.04.2022.
//

import Foundation

class EggGridViewModel: ObservableObject {
    @Published var cells: [EggViewModel] = []
    
    func fetchEggs() async {
        var result = [EggViewModel]()
        
        for egg in EggStore.eggs {
            result.append(EggViewModel(egg))
        }
        
        cells = result
    }
}
