//
//  TimerView.swift
//  EggAndTime
//
//  Created by Сашок on 21.04.2022.
//

import SwiftUI

struct TimerView: View {
    @Environment(\.scenePhase) var scenePhase
    
    @EnvironmentObject var navigationHelper: NavigationHelper
    @StateObject var viewModel: TimerViewModel = TimerViewModel()
    
    private var eggName: String
    private var donenessName: String
    
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(viewModel.eggNameText)
                Text(viewModel.donenessText)
            }
            .font(.title)
            .padding()
            
            Spacer()
            
            VStack(spacing: 50) {
                ZStack {
                    ProgressView(timerViewModel: viewModel,
                                 lineWidth: 15,
                                 baseColor: .gray,
                                 progressColor: .orange)
                        .frame(width: 350, height: 350)
                    Text(viewModel.timerText)
                        .font(.system(size: 50))
                        .fontWeight(.thin)
                        .offset(x: 0, y: 30)
                }
                Button(action: viewModel.buttonTapped) {
                    Text(viewModel.buttonTitle)
                        .font(.system(size: 25))
                        .foregroundColor(.white)
                }
                .frame(width: 200, height: 50)
                .background(Color.red)
                .clipShape(Capsule())
            }
            
            Spacer()
            
            Button("На главную") {
                navigationHelper.rootLinkIsActive = false
            }
            .disabled(viewModel.isRunning)
            .font(.system(size: 20))
            .padding()
        }
        .navigationBarHidden(true)
        .task {
            await viewModel.fetchData(eggName: eggName, donenessName: donenessName)
        }
    }
    
    init(eggName: String, donenessName: String) {
        self.eggName = eggName
        self.donenessName = donenessName
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TimerView(eggName: "Куриное", donenessName: "Вкрутую")
            TimerView(eggName: "Куриное", donenessName: "Вкрутую")
                .previewDevice("iPhone SE (2nd generation)")
        }
    }
}
