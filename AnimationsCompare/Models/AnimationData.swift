//
//  AnimationData.swift
//  AnimationsCompare
//
//  Created by Carlos Kimura on 14/12/22.
//

import Foundation
import SwiftUI

struct AnimationData: Identifiable {
    
    var id = UUID()
    var type: AnimationType
    
    // Linear and eased
    var length: Double = 1.0
    var delay: Double = 1.0
    
    // Spring
    var mass: Double = 1.0
    var stiffness: Double = 100.0
    var damping: Double = 10.0
    var initialVelocity: Double = 0.0
    
    // Interpolating Spring
    var response: Double = 0.55
    var dampingFraction: Double = 0.82
    
    var animationTimeFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 1
        return formatter
    }
    
    var description: String {
        var typeString: String
        switch type {
        case .linear:
            typeString = "Linear"
        case .easeIn:
            typeString = "Ease In"
        case .easeOut:
            typeString = "Ease Out"
        case .easeInOut:
            typeString = "Ease In/Out"
        case .spring:
            typeString = "Spring"
        case .interpolatingSpring:
            typeString = "Interpolating Spring"
        }
        
        let delayString = animationTimeFormatter.string(for: delay) ?? "??"
        let lengthString = animationTimeFormatter.string(for: length) ?? "??"
        let responseString = animationTimeFormatter.string(for: response) ?? "??"
        let dampingFractionString = animationTimeFormatter.string(for: dampingFraction) ?? "??"
        let massString = animationTimeFormatter.string(for: mass) ?? "??"
        let stiffnessString = animationTimeFormatter.string(for: stiffness) ?? "??"
        let dampingString = animationTimeFormatter.string(for: damping) ?? "??"
        
        if type == .linear || type == .easeIn || type == .easeOut || type == .easeInOut {
            return "\(typeString) Animation\nLength: \(lengthString) s Delay: \(delayString) s"
        }
        
        if type == .spring {
            return "\(typeString) Animation\nResponse: \(responseString) Damping Fraction \(dampingFractionString)"
        }
        
        // interpolating spring
        return "\(typeString) Animation\nMass: \(massString) Stiffness: \(stiffnessString) Damping: \(dampingString)"
    }
}

enum AnimationType {
    case linear
    case easeIn
    case easeOut
    case easeInOut
    case spring
    case interpolatingSpring
}
