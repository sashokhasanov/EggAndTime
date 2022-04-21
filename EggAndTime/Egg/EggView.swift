//
//  EggView.swift
//  EggAndTime
//
//  Created by Сашок on 20.04.2022.
//

import SwiftUI

struct EggView: View {
    let viewModel: EggViewModel
    
    var body: some View {
        CardView(text: viewModel.name, imageName: viewModel.imageName)
    }
}

struct EggView_Previews: PreviewProvider {
    static var previews: some View {
        EggView(viewModel: EggViewModel(EggStore.eggs[0]))
            .frame(width: 150, height: 150)
    }
}
