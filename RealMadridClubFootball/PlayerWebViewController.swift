//
//  PlayerWebViewController.swift
//  RealMadridClubFootball
//
//  Created by Georgy Jose on 08/03/2019.
//  Copyright © 2019 Georgy Jose. All rights reserved.
//

import UIKit
import WebKit

class PlayerWebViewController: UIViewController {

    var playerInfo : Player!
    
    @IBOutlet weak var playerWeb: WKWebView!
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
        
        let url = URL(string: playerInfo.url)
        
        playerWeb.load(URLRequest(url: url!))
     
    }
    


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
       
    }
    

}
