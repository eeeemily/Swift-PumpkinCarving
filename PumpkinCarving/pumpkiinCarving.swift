//
//  PumpkiinCarving.swift
//  PumpkinCarving
//
//  Created by Zheng, Minghui on 9/27/21.
//

import Foundation
import UIKit

class PumpkiinCarving {
    var pumpkinLocation = CGPoint.zero
    var carvePumpkin = true
    var score = 0

    func tryLocation(_ point: CGPoint) -> (Bool, Int, String) {
        let dist = distance(between: point, and: pumpkinLocation)
        carvePumpkin = dist <= 50.0
        score += 1
        return (carvePumpkin, score, progress(score))
    }
    func distance(between pointA: CGPoint, and pointB: CGPoint) -> CGFloat {
        let x = pow(Double(pointB.x - pointA.x), 2)
        let y = pow(Double(pointA.y - pointB.y), 2)
        return CGFloat((x+y).squareRoot())
    }
    func progress(_ score: Int) -> String{
        switch score%3 {
        case 0:
            return "0%"
        case 1:
            return "25%"
        case 2:
            return "50%"
        default:
            return "0%"
        }
    }
    func carveProgress(_ score: Int) -> Int{
        switch score%3 {
        case 0:
            return 0
        case 1:
            return 1
        case 2:
            return 2
        default:
            return 0
        }
    }
}
