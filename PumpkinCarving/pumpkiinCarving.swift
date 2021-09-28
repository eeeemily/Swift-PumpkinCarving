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
    var counter: Int = 0
    var numPumpkin: Int = 0
    var nextCarve: Bool = true
    func findCenterCG(with gameRect: CGRect){
        pumpkinLocation = pumpkinLocation.offset(dx: gameRect.width / 2, dy: gameRect.height / 2)
    }
    func next(carvable: Bool){
        nextCarve = true
    }
    func tryLocation(_ point: CGPoint) -> (Int, Int, Bool) {
        let dist = distance(between: point, and: pumpkinLocation)
        carvePumpkin = dist <= 110.0
        if(nextCarve){
            score += 1
            counter+=1
        }

        if(counter==3){
            numPumpkin+=1
            counter=0
            nextCarve = false
        }
        return (numPumpkin, score, carvePumpkin)
    }
    func distance(between pointA: CGPoint, and pointB: CGPoint) -> CGFloat {
        let x = pow(Double(pointB.x - pointA.x), 2)
        let y = pow(Double(pointA.y - pointB.y), 2)
        return CGFloat((x+y).squareRoot())
    }
    func progress(_ score: Int) -> String{
        switch score%3 {
        case 0:
            return "100%"
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

extension CGPoint {
    mutating func offset(dx: CGFloat, dy: CGFloat) -> CGPoint {
        x += dx
        y += dy
        return self
    }
}
