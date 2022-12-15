//
//  AnimationCompareView.swift
//  AnimationsCompare
//
//  Created by Carlos Kimura on 14/12/22.
//

import SwiftUI

struct AnimationCompareView: View {
    @State var animations: [AnimationData] = []
    @State var location = 0.0
    @State var slowMotion = false
    
    func deleteAnimations(at offsets: IndexSet) {
        animations.remove(atOffsets: offsets)
    }
    
    func moveAnimations(source: IndexSet, destination: Int) {
        animations.move(fromOffsets: source, toOffset: destination)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Button("Animate!") {
                    location = location == 0 ? 1 : 0
                }
                .font(.title)
                .disabled(animations.isEmpty)
                List {
                    Toggle("Slow Animations (¼ speed)", isOn: $slowMotion)
                    ForEach($animations) { $animation in
                        NavigationLink {
                            EditAnimation(animation: $animation)
                        } label: {
                            VStack(alignment: .leading) {
                                Text(animation.description)
                                    .fixedSize(horizontal: false, vertical: true)
                                AnimationView(animation: animation, location: $location, slowMotion: slowMotion)
                                    .frame(height: 30)
                            }
                        }
                    }
                    .onDelete(perform: deleteAnimations)
                    .onMove(perform: moveAnimations)
                    Button {
                        let newAnimation = AnimationData(type: .linear)
                        animations.append(newAnimation)
                    } label: {
                        Label(
                            "Add Animation",
                        systemImage: "plus"
                        ).font(.title2)
                    }
                }
                .toolbar {
                    EditButton()
                }
                .navigationBarTitle("Animation Compare")
            }
        }
    }
}

struct AnimationCompareView_Previews: PreviewProvider {
    static var previews: some View {
        let animation1 = AnimationData(type: .linear)
        let animation2 = AnimationData(type: .spring)
        AnimationCompareView(animations: [animation1, animation2])
    }
}
