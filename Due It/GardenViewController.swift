//
//  GardenViewController.swift
//  Due It
//
//  Created by Dan McKenna on 11/28/18.
//  Copyright © 2018 Due It. All rights reserved.
//

import UIKit

class GardenViewController: UIViewController {
    @IBOutlet weak var BackgroundImageView: UIImageView!
    
    @objc func tapAction(sender: UITapGestureRecognizer){
        // Get points for the UIImageView
        let touchPoint = sender.location(in: self.BackgroundImageView)
        print(touchPoint)
        
        // Get points from the image itself
        let z1 = touchPoint.x * (BackgroundImageView.image?.size.width)! / BackgroundImageView.frame.width
        let z2 = touchPoint.y * (BackgroundImageView.image?.size.height)! / BackgroundImageView.frame.height
        print("Touched point (\(z1), \(z2)")
        
        let pin = UIImageView(frame: CGRect(x: touchPoint.x - 20, y: touchPoint.y - 20, width: 40, height: 40))
        pin.image = UIImage(named: "flower.png")
        BackgroundImageView.addSubview(pin)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        
        self.BackgroundImageView.isUserInteractionEnabled = true
        self.BackgroundImageView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
