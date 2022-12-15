//
//  EditAnimation.swift
//  AnimationsCompare
//
//  Created by Carlos Kimura on 14/12/22.
//

import SwiftUI

struct EditAnimation: View {
    @Binding var animation: AnimationData
    @State var location = 0.0
    
    var body: some View {
        Form {
            Section("Animation Type") {
                Picker("Animation Type", selection: $animation.type) {
                    Text("Linear").tag(AnimationType.linear)
                    Text("Ease In").tag(AnimationType.easeIn)
                    Text("Ease Out").tag(AnimationType.easeOut)
                    Text("Ease In-Out").tag(AnimationType.easeInOut)
                    Text("Spring").tag(AnimationType.spring)
                    Text("Interpolating Spring").tag(AnimationType.interpolatingSpring)
                }
            }
            Section("Animation Parameters") {
                if animation.type == .linear || animation.type == .easeIn ||
                    animation.type == .easeOut || animation.type == .easeInOut {
                    Stepper(
                        "Delay \(animation.delay.formatted()) s",
                        value: $animation.delay,
                        in: 0...10,
                        step: 0.1
                    )
                    Stepper(
                        "Length \(animation.length.formatted()) s",
                        value: $animation.length,
                        in: 0...10,
                        step: 0.1
                    )
                } else if animation.type == .spring {
                    Stepper(
                        "Response \(animation.response.formatted())",
                        value: $animation.response,
                        in: 0...10,
                        step: 0.05
                    )
                    Stepper(
                        "Damping Fraction \(animation.dampingFraction.formatted())",
                        value: $animation.dampingFraction,
                        in: 0...10,
                        step: 0.1
                    )
                } else if animation.type == .interpolatingSpring {
                    Stepper(
                        "Mass \(animation.mass.formatted())",
                        value: $animation.mass,
                        in: 0...10,
                        step: 0.1
                    )
                    Stepper(
                        "Stiffness \(animation.stiffness.formatted())",
                        value: $animation.stiffness,
                        in: 0...10,
                        step: 0.1
                    )
                    Stepper(
                        "Damping \(animation.damping.formatted())",
                        value: $animation.damping,
                        in: 0...500,
                        step: 10
                    )
                    Stepper(
                        "Initial Velocity \(animation.initialVelocity.formatted())",
                        value: $animation.initialVelocity,
                        in: 0...1,
                        step: 0.05
                    )
                }
            }
            Section("Description") {
                Text(animation.description)
            }
            Section("Tap to Preview") {
                AnimationView(animation: animation, location: $location)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        if location == 0.0 {
                            location = 1.0
                        } else {
                            location = 0.0
                        }
                    }
            }
            .textFieldStyle(.roundedBorder)
        }
        .navigationTitle("Edit Animation")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CreateAnimation_Previews: PreviewProvider {
    static var previews: some View {
        let data = AnimationData(type: .linear, length: 1.0, delay: 0.0)
        NavigationStack {
            EditAnimation(
                animation: .constant(data)
            )
        }
    }
}
