//
//  ViewController.swift
//  PumpkinCarving
//
//  Created by Zheng, Minghui on 9/27/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var monthCover: UIImageView!
    @IBOutlet weak var leftEyeCover: UIImageView!
    @IBOutlet weak var rightEyeCover: UIImageView!
    
    @IBOutlet weak var scorePumpkinLabel: UILabel!
    @IBOutlet weak var numPumpkinLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var numProgressLabel: UILabel!
    
    let pumpkiinCarving = PumpkiinCarving()
    
    override var prefersStatusBarHidden: Bool { return true }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateScore(score: 0)

    }
    func updateScore(score: Int) {
        let nf = NumberFormatter()
        nf.locale = Locale.current
        numPumpkinLabel?.text = nf.string(from: NSNumber(value: score))
    }
    
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        let point = sender.location(in: self.view)
        let(carvePumpkin,score,progress) = pumpkiinCarving.tryLocation(point)
        carving(score)
        updateScore(score: score)
//        if progress==true{
//            handleGameOver()
//        }
    }
    func carving(_ score: Int){
        let loc = pumpkiinCarving.carveProgress(score)
        if loc==1{
            leftEyeCover.isHidden = true
        }else if loc == 2{
            rightEyeCover.isHidden = true
        }else if loc == 3{
            monthCover.isHidden = true
        }
    }
    func handleGameOver(){
        monthCover.isHidden = false
    
    }
    }
