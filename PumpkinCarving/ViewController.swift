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
    @IBOutlet weak var carveNextBtn: UIButton!
    
    let pumpkiinCarving = PumpkiinCarving()
    
    override var prefersStatusBarHidden: Bool { return true }
    
    //localization and set everything up to original
    override func viewDidLoad() {
        super.viewDidLoad()
        scorePumpkinLabel.text = NSLocalizedString("str_pumpkinNumberLabel", comment: "")
        progressLabel.text = NSLocalizedString("str_progressLabel", comment: "")
        carveNextBtn.setTitle(NSLocalizedString("str_carveNextBtn", comment: ""), for: .normal)
        updateScore(score: 0)
        numProgressLabel?.text = "0%"
        pumpkiinCarving.findCenterCG(with: self.view.frame)

    }
    func updateScore(score: Int) {
        let nf = NumberFormatter()
        nf.locale = Locale.current
        numPumpkinLabel?.text = nf.string(from: NSNumber(value: score))
    }
    //when "next" button is clicked: change the background color to indicate it's a new pumpkin; hide the carves; reset progress to 0%
    @IBAction func onNextBtn(_ sender: UIButton) {
        view.backgroundColor = UIColor(red: 0.5, green: 0.7, blue: 0.6, alpha: 1.0)
        leftEyeCover.isHidden = false
        rightEyeCover.isHidden = false
        monthCover.isHidden = false
        numProgressLabel?.text = "0%"
        pumpkiinCarving.next(carvable: true)
    }
    //when the screen is tapped; change the background color back to white to indicate user is carving; send the point over to check
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1.0)
        let point = sender.location(in: self.view)
        let(numPumpkin,cut,carvePumpkin) = pumpkiinCarving.tryLocation(point)
        if(carvePumpkin){
            carving(cut)
            updateScore(score: numPumpkin)
        }
        
    }
    //carve pumpkin
    func carving(_ score: Int){
        let loc = pumpkiinCarving.carveProgress(score)
        numProgressLabel.text = pumpkiinCarving.progress(score)
        if loc==0{
            monthCover.isHidden = true
        }else if loc == 1{
            leftEyeCover.isHidden = true
        }else if loc == 2{
            rightEyeCover.isHidden = true
        }
    }
    func handleGameOver(){
        monthCover.isHidden = false
    
    }
}
