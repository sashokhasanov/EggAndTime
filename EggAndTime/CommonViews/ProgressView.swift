//
//  ProgressView.swift
//  EggAndTime
//
//  Created by Сашок on 21.04.2022.
//

import SwiftUI

struct ProgressView: View {
    @ObservedObject var timerViewModel: TimerViewModel

    let lineWidth: CGFloat
    let baseColor: Color
    let progressColor: Color
    
    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            ZStack {
                makeEggPath(width: width, height: height)
                    .stroke(lineWidth: lineWidth)
                    .foregroundColor(baseColor)
                
                makeEggPath(width: width, height: height)
                    .trim(from: timerViewModel.progress, to: 1)
                    .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin:.round))
                    .foregroundColor(progressColor)
                    .animation(.linear(duration: 1), value: timerViewModel.progress)
            }
        }
    }
    
    func makeEggPath(width: CGFloat, height: CGFloat) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 0.49999*width, y: 0))
            path.addCurve(to: CGPoint(x: 0.10567*width, y: 0.59838*height), control1: CGPoint(x: 0.26828*width, y: 0), control2: CGPoint(x: 0.10567*width, y: 0.38819*height))
            path.addCurve(to: CGPoint(x: 0.21927*width, y: 0.88197*height), control1: CGPoint(x: 0.10567*width, y: 0.70591*height), control2: CGPoint(x: 0.14602*width, y: 0.80662*height))
            path.addCurve(to: CGPoint(x: 0.49999*width, y: 1.00001*height), control1: CGPoint(x: 0.29326*width, y: 0.95809*height), control2: CGPoint(x: 0.39295*width, y: 1.00001*height))
            path.addCurve(to: CGPoint(x: 0.78073*width, y: 0.88198*height), control1: CGPoint(x: 0.60703*width, y: 1.00001*height), control2: CGPoint(x: 0.70674*width, y: 0.95809*height))
            path.addCurve(to: CGPoint(x: 0.89433*width, y: 0.59838*height), control1: CGPoint(x: 0.854*width, y: 0.80663*height), control2: CGPoint(x: 0.89433*width, y: 0.70591*height))
            path.addCurve(to: CGPoint(x: 0.49999*width, y: 0), control1: CGPoint(x: 0.89433*width, y: 0.38819*height), control2: CGPoint(x: 0.73172*width, y: 0))
            path.closeSubpath()
        }
    }
}

struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView(timerViewModel: TimerViewModel(),
                     lineWidth: 15,
                     baseColor: .gray,
                     progressColor: .orange)
            .frame(width: 300, height: 300)
    }
}
