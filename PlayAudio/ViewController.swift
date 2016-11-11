//
//  ViewController.swift
//  PlayAudio
//
//  Created by Pham Ngoc Hai on 11/10/16.
//  Copyright © 2016 Mystudio. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    var audio = AVAudioPlayer()
    

    @IBOutlet weak var btn_Pause: UIButton!
   
    @IBOutlet weak var sld_Volume: UISlider!
    @IBOutlet weak var btn_Play: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = Bundle.main.path(forResource: "mucsic1", ofType: ".mp3")
        let url = URL(fileURLWithPath: path!)
        btn_Pause.isHidden = true
        audio = try! AVAudioPlayer(contentsOf: url)
        
        audio.prepareToPlay()
        
    }
    @IBAction func sld_Volume(_ sender: AnyObject) {
        audio.volume = sender.value
//        print(audio.volume)
    }
    func addThumtoSld()  {
        sld_Volume.setThumbImage(#imageLiteral(resourceName: "thumb.png"), for: .normal)
        sld_Volume.setThumbImage(#imageLiteral(resourceName: "thumbHightLight.png"), for: .highlighted)
    }
    
    
    @IBAction func btn_PlayPause(_ sender: AnyObject) {
        
            audio.play()
        btn_Play.isHidden = true
        btn_Pause.isHidden = false
           }
    
    @IBAction func btn_stop(_ sender: Any) {
        
        audio.pause()
        btn_Pause.isHidden = true
        btn_Play.isHidden  = false
        
    }
    
    
    
    
}

