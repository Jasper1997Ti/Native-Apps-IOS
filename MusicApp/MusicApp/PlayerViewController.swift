//
//  PlayerViewController.swift
//  MusicApp
//
//  Created by jasper on 26/08/2020.
//  Copyright © 2020 jasper. All rights reserved.
//

import UIKit
import AVFoundation

class PlayerViewController: UIViewController {

    public var position: Int = 0
    public var songs: [Song] = []
    
    @IBOutlet var holder: UIView!
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if holder.subviews.count == 0 {
            configure()
        }
    }
    
    func configure() {
        
        let song = songs[position]
        let url = Bundle.main.path(forResource: song.trackName, ofType: "mp3")
        
        do{
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            guard let url = url else {
                return
            }
            
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: url))
            
            guard let player = player else {
                return
            }
            
        }catch{
            print("erro")
        }
        player!.play()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let player = player {
            player.stop()
        }
    }

}
