//
//  ViewController.swift
//  spot
//
//  Created by Troy M. Connor on 10/4/16.
//  Copyright © 2016 Troy Connor. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class TableViewController: UITableViewController {
    
    
    var names = [String]()
    var images = [String]()
    
    typealias JSONStandard = [String: AnyObject]
    var searchUrl = "https://api.github.com/users/troy0820/followers"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        callAlamo(url: searchUrl)
    }
    
    func callAlamo(url: String) {
        Alamofire.request(url).responseJSON(completionHandler: {
            response in
            self.parseData(JSONData: response.data!)
            
        })
    }
    func parseData(JSONData : Data) {
        do {
            let json = JSON(data: JSONData)
            for i in 0..<json.count {
                names.append("\(json[i]["login"])")
                images.append("\(json[i]["avatar_url"])")
                self.tableView.reloadData()
            }
            print("\(images)")
        }
        catch {
            print(error)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
            cell!.textLabel!.text = names[indexPath.row]
            return cell!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let trackVc = segue.destination as? TrackViewController
        
        guard let cell = sender as? UITableViewCell,
              let IndexPath = tableView.indexPath(for: cell) else {
                return
        }
        trackVc?.follower = names[IndexPath.row]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
