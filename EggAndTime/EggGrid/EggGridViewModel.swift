//
//  EggGridViewModel.swift
//  EggAndTime
//
//  Created by Сашок on 20.04.2022.
//

import Foundation

class EggGridViewModel: ObservableObject {
    @Published var cells: [EggViewModel] = []
    
    func fetchData() async {
        cells = EggStore.eggs.map { EggViewModel($0) }
    }
}
