//
//  MergeTwoImageView.swift
//  Test_XibFile
//
//  Created by it on 10/03/2021.
//

import UIKit

class MergeTwoImageView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        loadNib()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }
    
    func loadNib(){
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "MergeTwoImageView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo:self.topAnchor, constant: .zero).isActive = true
        view.leftAnchor.constraint(equalTo:self.leftAnchor, constant: .zero).isActive = true
        view.rightAnchor.constraint(equalTo:self.rightAnchor, constant: .zero).isActive = true
        view.bottomAnchor.constraint(equalTo:self.bottomAnchor, constant: .zero).isActive = true
    }
    
}
