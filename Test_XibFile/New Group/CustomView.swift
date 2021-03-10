//
//  CustomView.swift
//  Test_XibFile
//
//  Created by it on 10/03/2021.
//

import UIKit

class CustomView: UIView {

    @IBOutlet weak var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customInit()
    }
    
    private func customInit() {
        //Nhớ lấy đúng tên của file XIB nếu không sẽ không chạy được
        Bundle.main.loadNibNamed("CustomView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [ .flexibleHeight, .flexibleWidth]
       
    }
}
