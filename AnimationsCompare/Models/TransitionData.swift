//
//  TransitionData.swift
//  AnimationsCompare
//
//  Created by Carlos Kimura on 14/12/22.
//

import SwiftUI

enum TransitionType {
    case slide
    case scale
    case move
    case offset
    case opacity
}

struct TransitionProperties {
    var scale: Double = 0.0
    var anchorPoint: UnitPoint = .center
    var edge: Edge = .leading
    var offsetX: Double = 0.0
    var offsetY: Double = 0.0
}
