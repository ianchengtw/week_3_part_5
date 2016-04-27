//
//  MyCell.swift
//  youbike
//
//  Created by Ian on 4/25/16.
//  Copyright © 2016 AppWorks School Ian Cheng. All rights reserved.
//

import UIKit

protocol CellDelegation: class {
    func cell(cell: MyCell, viewMap sender: AnyObject?)
}

class MyCell: UITableViewCell {
    
    @IBOutlet weak var theImageView: UIImageView!
    @IBOutlet weak var theLabel: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var remainingBikes: UILabel!
    @IBOutlet weak var viewMap: UIButton!
    @IBOutlet weak var separateLine: UIView!
    
    weak var delegate: CellDelegation?
    
    func initAction() {
        
        self.theLabel.font = UIFont.ybkTextStyle2Font(20)
        self.theLabel.textColor = UIColor.ybkBrownishColor()
        
        self.address.font = UIFont.ybkTextStyle2Font(14)
        self.address.textColor = UIColor.ybkSandBrownColor()
        
        self.viewMap.setTitle("看地圖", forState: .Normal)
        self.viewMap.setTitleColor(UIColor.ybkDarkSalmonColor(), forState: .Normal)
//        self.viewMap.font = UIFont.ybkTextStyle2Font(16)
        self.viewMap.layer.cornerRadius = 5
        self.viewMap.layer.borderWidth = 1
        self.viewMap.layer.borderColor = UIColor.ybkDarkSalmonColor().CGColor
//        self.viewMap.addTarget(self, action: #selector(viewMap(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.viewMap.addTarget(self, action: Selector("viewMap:"), forControlEvents: UIControlEvents.TouchUpInside)

        self.backgroundColor = UIColor.ybkPaleColor()
        self.separateLine.backgroundColor = UIColor.ybkDarkSandColor()
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initAction()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func getRemainingBike(remainingBike: Int) -> NSMutableAttributedString {
        
        let prefix = "剩"
        let bikes = String(remainingBike)
        let subfix = "台"
        let remainingBikesString = (prefix + bikes + subfix) as NSString
        
        let font_1 = [ NSForegroundColorAttributeName: UIColor.ybkDarkSalmonColor(), NSFontAttributeName: UIFont.ybkTextStyleFont(80)! ]
        let font_2 = [ NSForegroundColorAttributeName: UIColor.ybkSandBrownColor(), NSFontAttributeName: UIFont.ybkTextStyle2Font(20)! ]
        
        let attributedString = NSMutableAttributedString(string: remainingBikesString as String)
        attributedString.addAttributes(font_2, range: remainingBikesString.rangeOfString(prefix))
        attributedString.addAttributes(font_1, range: remainingBikesString.rangeOfString(bikes))
        attributedString.addAttributes(font_2, range: remainingBikesString.rangeOfString(subfix))
        
        return attributedString
        
    }
    
    func viewMap(sender: UIButton) {
        print("did click")
        self.delegate?.cell(self, viewMap: sender)
    }
    
}

//extension MyCell {
//    @objc private func viewMap(sender: UIButton) {
//        print("did click")
//        self.delegate?.cell(self, viewMap: sender)
//    }
//}
