//
//  PlayerDetailsViewController.swift
//  RealMadridClubFootball
//
//  Created by Georgy Jose on 18/02/2019.
//  Copyright © 2019 Georgy Jose. All rights reserved.
//

import UIKit

class PlayerDetailsViewController: UIViewController {

    var playerInfo : Player!
    @IBOutlet weak var nameLabel: UILabel!
   
    
    @IBOutlet weak var nationalityLabel: UILabel!
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
    
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var textLabel: UILabel!
    @IBAction func webInfoAction(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameLabel.text = playerInfo.name
        nationalityLabel.text = playerInfo.nationality
        dobLabel.text = playerInfo.dob
        heightLabel.text =  playerInfo.height
        weightLabel.text = playerInfo.weight
        
        textLabel.text = playerInfo.text
        
        
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! PlayerWebViewController
        // Get the new view controller using segue.destination.
        
        
        // Pass the selected object to the new view controller.
        destination.playerInfo = self.playerInfo
    }
    

}
