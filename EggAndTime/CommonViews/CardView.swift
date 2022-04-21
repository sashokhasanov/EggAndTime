//
//  EggView.swift
//  EggAndTime
//
//  Created by Сашок on 20.04.2022.
//

import SwiftUI

struct CardView: View {
    let text: String
    let imageName: String
    
    init(text: String = "Текст", imageName: String = "EggPlaceholder") {
        self.text = text
        self.imageName = imageName
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15).foregroundColor(.white).shadow(color: .gray, radius: 4)
            
            VStack(spacing: 10) {
                Image(imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Text(text)
                    .font(.callout)
                    .foregroundColor(.gray)
            }
            .padding()
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView().frame(width: 150, height: 150)
    }
}
