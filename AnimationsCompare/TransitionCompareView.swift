//
//  TransitionCompareView.swift
//  AnimationsCompare
//
//  Created by Carlos Kimura on 14/12/22.
//

import SwiftUI

struct TransitionCompareView: View {
    
    @State var showSquare = true
    
    var body: some View {
        VStack {
            Button(showSquare ? "Hide the Square" : "Show the Square") {
                showSquare.toggle()
            }
            
            if showSquare {
                RoundedRectangle(cornerRadius: 15)
                    .frame(width: 150, height: 150)
                    .foregroundColor(.red)
            }
            Spacer()
        }
    }
}

struct TransitionCompareView_Previews: PreviewProvider {
    static var previews: some View {
        TransitionCompareView()
    }
}
