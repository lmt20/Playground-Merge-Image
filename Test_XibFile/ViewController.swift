//
//  ViewController.swift
//  Test_XibFile
//
//  Created by it on 10/03/2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        addMergeTwoImageView(firstImage: UIImage(named: "image1"), secondImage: UIImage(named: "image2"))
    }
    
    func testCustomView() {
        
        let customView = CustomView()
        customView.frame = CGRect(x: 20, y: 300, width: 300, height: 200)
        customView.contentView.backgroundColor = .blue
        view.addSubview(customView)
    }
    
    func addMergeTwoImageView(firstImage: UIImage?, secondImage: UIImage?) {
        
        let frameWidth = 300
        let frameHeight = 300
        
        let containerFrame = CGRect(
            x: (Int(view.frame.size.width) - frameWidth)/2,
            y: (Int(view.frame.size.height) - frameHeight)/2, width: frameWidth, height: frameWidth
        )
        let containerView = MergeTwoImageView(frame: containerFrame)
        containerView.layer.borderWidth = 10
        containerView.layer.borderColor = UIColor.orange.cgColor
        
        // Add first image of two parts
        let firstImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight))
        if let firstImage = firstImage {
            firstImageView.image = firstImage
        } else {
            firstImageView.backgroundColor = UIColor.white
            firstImageView.layer.borderWidth = 2
            firstImageView.layer.borderColor = 
            
        }
        theFirstOfTwoPart(imageView: firstImageView)
        
        // Add second image of two parts
        let secondImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frameWidth, height: frameHeight))
        if let secondImage = secondImage {
            secondImageView.image = secondImage
        } else {
            secondImageView.backgroundColor = UIColor.white
        }
        theSecondOfTwoPart(imageView: secondImageView)
        
        containerView.addSubview(firstImageView)
        containerView.addSubview(secondImageView)
        view.addSubview(containerView)
        
    }
    
    func theFirstOfTwoPart(imageView: UIView) {
        let path = UIBezierPath()
        let frameSize = imageView.frame.size

        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: frameSize.width*2/3 - 10, y: 0))
        path.addLine(to: CGPoint(x: frameSize.width/3 - 10, y: frameSize.height))
        path.addLine(to: CGPoint(x: 0, y: frameSize.height))
        path.close()
        
        let shape = CAShapeLayer()
        path.stroke()
        shape.path = path.cgPath
        shape.fillColor = UIColor.orange.cgColor
        
        imageView.layer.mask = shape
        imageView.layer.masksToBounds = true
        
    }

    func theSecondOfTwoPart(imageView: UIView) {
        let path = UIBezierPath()
        let frameSize = imageView.frame.size

        path.move(to: CGPoint(x: frameSize.width * 2/3 + 10, y: 0))
        path.addLine(to: CGPoint(x: frameSize.width, y: 0))
        path.addLine(to: CGPoint(x: frameSize.width, y: frameSize.height))
        path.addLine(to: CGPoint(x: frameSize.width * 1/3 + 10, y: frameSize.height))
        path.close()
        
        let shape = CAShapeLayer()
        path.stroke()
        shape.path = path.cgPath
        shape.fillColor = UIColor.orange.cgColor
        
        imageView.layer.mask = shape
        imageView.layer.masksToBounds = true
        
    }

}

