//
//  TrackViewController.swift
//  spot
//
//  Created by Troy M. Connor on 10/10/16.
//  Copyright © 2016 Troy Connor. All rights reserved.
//

import UIKit

class TrackViewController: UIViewController {

    var follower: String?
    @IBOutlet weak var trackName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trackName.text = follower
        
    }


   
}
