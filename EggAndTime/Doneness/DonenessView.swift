//
//  DonenessView.swift
//  EggAndTime
//
//  Created by Сашок on 20.04.2022.
//

import SwiftUI

struct DonenessView: View {
    let viewModel: DonenessViewModel
    
    var body: some View {
        CardView(text: viewModel.name, imageName: viewModel.imageName)
    }
}

struct DonenessView_Previews: PreviewProvider {
    static var previews: some View {
        DonenessView(viewModel: DonenessViewModel(EggStore.doneness["Куриное"]![0]))
    }
}
