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
    @State private var selectedEgg = ""

    private var columns = [
        GridItem(.adaptive(minimum: 150, maximum: 300), spacing: 20, alignment: .center)
    ]
    
    var body: some View {
        ScrollView {
            
            NavigationLink(destination: DonenessGridView(eggName: selectedEgg),
                           isActive: $navigationHelper.rootLinkIsActive) {
                EmptyView()
            }
            .isDetailLink(false)
            
            LazyVGrid(columns: columns, alignment: .center, spacing: 20) {
                ForEach(viewModel.cells, id: \.name) { cell in
                    Button {
                        selectedEgg = cell.name
                        navigationHelper.rootLinkIsActive = true
                    } label: {
                        EggView(viewModel: cell)
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Яйцо")
        .task {
            await viewModel.fetchData()
        }
    }
}

struct EggsView_Previews: PreviewProvider {
    static var previews: some View {
        EggGridView()
    }
}
