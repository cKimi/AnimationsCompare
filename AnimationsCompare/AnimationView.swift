//
//  AnimationView.swift
//  AnimationsCompare
//
//  Created by Carlos Kimura on 14/12/22.
//

import SwiftUI

struct AnimationView: View {
    
    var animation: AnimationData
    
    @Binding var location: Double
    
    var currentAnimation: Animation {
        switch animation.type {
        case .easeIn:
            return Animation.easeIn(duration: animation.length)
        case .easeOut:
            return Animation.easeOut(duration: animation.length)
        case .easeInOut:
            return Animation.easeInOut(duration: animation.length)
        case .interpolatingSpring:
            return Animation.interpolatingSpring(mass: animation.mass, stiffness: animation.stiffness, damping: animation.damping, initialVelocity: animation.initialVelocity)
        case .spring:
            return Animation.spring(response: animation.response, dampingFraction: animation.dampingFraction)
        default:
            return Animation.linear(duration: animation.length)
        }
    }
    
    var slowMotion = false
    
    var body: some View {
        GeometryReader { proxy in
            Group {
                HStack {
                    Image(systemName: "gear.circle")
                        .rotationEffect(.degrees(360 * location))
                    Image(systemName: "star.fill")
                        .offset(x: proxy.size.width * location * 0.8)
                }
                .font(.title)
                .animation(
                    currentAnimation
                        .delay(animation.delay)
                        .speed(slowMotion ? 0.25 : 1.0),
                    value: location)
            }
        }
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        let animation = AnimationData(type: .linear, length: 1.0, delay: 0.0)
        
        AnimationView(animation: animation, location: .constant(0.0))
    }
}
