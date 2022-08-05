//
//  MainBackGroundView.swift
//  NuttyPlayGround
//
//  Created by Nuttanai on 25/1/2564 BE.
//

import UIKit
import Lottie

class MainBackGroundView: UIView {
    @IBOutlet weak var containView: UIView!
    @IBOutlet weak var backGroundView: AnimationView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        Bundle.main.loadNibNamed("MainBackGround", owner: self, options: nil)
        addSubview(containView)
        containView.frame = self.bounds
        containView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        backGroundView.contentMode = .scaleAspectFill
        backGroundView.loopMode = .loop
        backGroundView.animationSpeed = 1
        backGroundView.play()
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }

    @objc func playAnimation() {
        backGroundView.play()
    }

    @objc func stopAnimation() {
        backGroundView.stop()
    }
}
