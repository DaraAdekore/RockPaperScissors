//
//  ButtonView.swift
//  RockPaperScissor
//
//  Created by Dara Adekore on 2023-05-04.
//

import SwiftUI

struct ScissorsView: View {
    var body: some View {
        Image("scissors")
            .renderingMode(.original)
            .resizable()
            .frame(width: 100, height: 100)
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}

struct ScissorsView: View {
    var body: some View {
        Image("scissors")
            .renderingMode(.original)
            .resizable()
            .frame(width: 100, height: 100)
            .clipShape(Circle())
            .overlay(
                Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}
struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ScissorsView()
    }
}
