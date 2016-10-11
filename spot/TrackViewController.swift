//
//  TrackViewController.swift
//  spot
//
//  Created by Troy M. Connor on 10/10/16.
//  Copyright © 2016 Troy Connor. All rights reserved.
//

import UIKit
import SDWebImage

class TrackViewController: UIViewController {

    var follower: String?
    var picture: String?
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var image: UIImageView!
    
    @IBAction func buttonPress(_ sender: AnyObject) {
        print("This button has been pushed")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        trackName.text = follower
        
        let imageURL:NSURL? = NSURL(string: picture!)
        
        if let url = imageURL {
            image.sd_setImage(with: url as URL!)
        }
        
    }


   
}
