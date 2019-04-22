//
//  VideoPlayerViewController.swift
//  RealMadridClubFootball
//
//  Created by Georgy Jose on 10/03/2019.
//  Copyright © 2019 Georgy Jose. All rights reserved.
//

import UIKit
import AVFoundation

class VideoPlayerViewController: UIViewController {

    
    @IBOutlet weak var videoPlayer: UIView!
    
    var playerVideo: AVPlayer!
    var playerLayer : AVPlayerLayer!
    var videoStatus = false
   
    
    let path = Bundle.main.path(forResource: "bestrealvideo", ofType: "mp4")!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let videoUrl = URL(fileURLWithPath: path)
        playerVideo = AVPlayer(url: videoUrl)
        
        playerLayer = AVPlayerLayer(player: playerVideo)
        playerLayer.videoGravity = .resize
        
        videoPlayer.layer.addSublayer(playerLayer)
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
            playerVideo.play()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        playerLayer.frame = videoPlayer.bounds
    }
    @IBAction func videoPlay(_ sender: UIButton) {
        playerVideo.play()
        
    }
    
    
    @IBAction func videoPause(_ sender: UIButton) {
        playerVideo.pause()
    }
    @IBAction func videoBack(_ sender: UIButton) {
        
        let currentVideoTime = CMTimeGetSeconds(playerVideo.currentTime())
        var reverseTime = currentVideoTime - 10
        
        if (reverseTime < 10.0){
            reverseTime = 0
        }
            else{
                let skipTime:CMTime = CMTimeMake(value: Int64(reverseTime*1000), timescale: 1000)
                playerVideo.seek(to: skipTime)
            }
        
    }
    @IBAction func videoForward(_ sender: UIButton) {
        guard let totalDuration = playerVideo.currentItem?.duration else {return }
        let currentVideoTime = CMTimeGetSeconds(playerVideo.currentTime())
        let forwardTime = currentVideoTime + 10
        
        if(forwardTime < (CMTimeGetSeconds(totalDuration) - 10.0))
        {
            let skipTime: CMTime = CMTimeMake(value: Int64(forwardTime*1000), timescale: 1000)
            playerVideo.seek(to: skipTime)
        }
       
            
            
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
