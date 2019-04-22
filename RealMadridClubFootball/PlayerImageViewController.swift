//
//  PlayerImageViewController.swift
//  RealMadridClubFootball
//
//  Created by Georgy Jose on 18/02/2019.
//  Copyright © 2019 Georgy Jose. All rights reserved.
//

import UIKit

class PlayerImageViewController: UIViewController {
// Image View Controller to display the image of the player
    var playerInfo : Player!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBAction func playerInfoAction(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
        
        nameLabel.text = playerInfo.name
        imageView.image = UIImage(named : playerInfo.picture) // The Image view will load the image from the player string obtained from the xml
        
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if(segue.identifier == "videoSegue"){
            let destination = segue.destination as! VideoPlayerViewController
        }
        else if(segue.identifier == "detailSegue"){
       let destination = segue.destination as! PlayerDetailsViewController
            destination.playerInfo = self.playerInfo
        // Get the new view controller using segue.destination.
        }
            
        // Pass the selected object to the new view controller.
        
        
    }
    

}
