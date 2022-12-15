//
//  ContentView.swift
//  AnimationsCompare
//
//  Created by Carlos Kimura on 14/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TransitionCompareView()
                .tabItem {
                    Text("Transitions")
                    Image(systemName: "viewfinder")
                }
            tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
