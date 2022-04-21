//
//  EggsView.swift
//  EggAndTime
//
//  Created by Сашок on 20.04.2022.
//

import SwiftUI

struct EggGridView: View {
    @EnvironmentObject var navigationHelper: NavigationHelper
    @StateObject private var viewModel: EggGridViewModel = EggGridViewModel()

    private var columns = [
        GridItem(.adaptive(minimum: 150, maximum: 300), spacing: 20, alignment: .center)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns,
                      alignment: .center,
                      spacing: 20) {
                
                ForEach(viewModel.cells, id: \.name) { cell in
                    NavigationLink(isActive: $navigationHelper.navigateToRootView) {
                        DonenessGridView(eggName: cell.name)
                    } label: {
                        EggView(viewModel: cell)
                    }
                    .isDetailLink(false)
                }
            }
            .padding()
        }
        .navigationTitle("Яйцо")
        .task {
            await viewModel.fetchEggs()
        }
    }
}

struct EggsView_Previews: PreviewProvider {
    static var previews: some View {
        EggGridView()
    }
}
