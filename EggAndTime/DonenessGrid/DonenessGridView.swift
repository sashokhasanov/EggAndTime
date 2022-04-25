//
//  DonenessesView.swift
//  EggAndTime
//
//  Created by Сашок on 20.04.2022.
//

import SwiftUI

struct DonenessGridView: View {
    @EnvironmentObject var navigationHelper: NavigationHelper
    @StateObject private var viewModel: DonenessGridViewModel = DonenessGridViewModel()
    
    private var columns = [
        GridItem(.adaptive(minimum: 160), spacing: 17, alignment: .center)
    ]
    
    private let eggName: String

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, alignment: .center, spacing: 17) {
                ForEach(viewModel.cells, id: \.name) { cell in
                    NavigationLink(destination: TimerView(eggName: eggName, donenessName: cell.name)) {
                        DonenessView(viewModel: cell)
                    }
                    .isDetailLink(false)
                }
            }
            .padding()
        }
        .navigationTitle(eggName)
        .task {
            await viewModel.fetchData(eggName: eggName)
        }
    }
    
    init(eggName: String) {
        self.eggName = eggName
    }
}

struct DonenessesView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DonenessGridView(eggName: "Куриное")
            DonenessGridView(eggName: "Куриное")
                .previewDevice("iPhone SE (2nd generation)")
        }
    }
}
