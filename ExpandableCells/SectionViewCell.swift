//
//  SectionViewCell.swift
//  ExpandableCells
//
//  Created by abhinav khanduja on 23/09/19.
//  Copyright © 2019 abhinav khanduja. All rights reserved.
//

import UIKit

class SectionView: UIView {
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var topBtn: UIButton!
    @IBOutlet weak var bottomBtn: UIButton!
    
    var isShown : Bool!
    
    var blueBtnTapped : ((Bool)->())?
    var greenBtnTapped : (()->())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setView()
    }
    
    func setView() {
        Bundle.main.loadNibNamed("SectionView", owner: self, options: nil)
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        bottomBtn.isHidden = true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func hideShowBottomButton() {
        bottomBtn.isHidden = isShown
    }
    
    @IBAction func topBtnTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.bottomBtn.isHidden.toggle()
            self.layoutIfNeeded()
        }
        blueBtnTapped?(self.bottomBtn.isHidden)
    }
    @IBAction func bottomBtnTapped(_ sender: UIButton) {
        greenBtnTapped?()
    }
    
}
