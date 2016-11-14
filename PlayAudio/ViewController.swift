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
    let timer  = Timer()
    @IBOutlet weak var lbl_Timeplay: UILabel!
    
    @IBOutlet weak var btn_Pause: UIButton!
    
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var sld_Duration: UISlider!
    @IBOutlet weak var lbl_TotalTime: UILabel!
    @IBOutlet weak var sld_Volume: UISlider!
    @IBOutlet weak var btn_Play: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let path = Bundle.main.path(forResource: "mucsic1", ofType: ".mp3")
        let url = URL(fileURLWithPath: path!)
        btn_Pause.isHidden = true
        audio = try! AVAudioPlayer(contentsOf: url)
        addThumtoSld()
        audio.prepareToPlay()
        _ =  Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimePlay), userInfo: nil, repeats: true)
        sld_Duration.maximumValue = Float(audio.duration)
        
        
        
    }
    
    
    
    
    
    
    func updateTimePlay()
    {
        let minu1: Int = Int(audio.duration / 60)
        let sec2: Int = Int(audio.duration.truncatingRemainder(dividingBy: 60))
        
        if (sec2 < 10 && minu1 < 10){
            self.lbl_TotalTime.text = "0\(minu1):0\(sec2) "
            
        }else{
            if sec2 < 10 {
                self.lbl_TotalTime.text = "\(minu1):0\(sec2) "
            } else if minu1 < 10 {
                self.lbl_TotalTime.text = "0\(minu1):\(sec2) "
            }else{
                self.lbl_TotalTime.text = "\(minu1):\(sec2) "
            }
            
        }
        
        
        let minu = Int(audio.currentTime / 60)
        let sec = Int(audio.currentTime.truncatingRemainder(dividingBy: 60))
        
        if (minu < 10 && sec < 10)
        {
            self.lbl_Timeplay.text = "0\(minu):0\(sec)"
            
        }else{
            if sec < 10 {
                self.lbl_Timeplay.text = "\(minu):0\(sec) "
            } else if minu < 10 {
                self.lbl_Timeplay.text = "0\(minu):\(sec) "
            }else{
                self.lbl_Timeplay.text = "\(minu):\(sec) "
            }
        }
        
        
        if (minu == minu1 && sec == sec2)
        {
            if (mySwitch.isOn == false)
            {
                print("Ngung")
                btn_Play.isHidden = false
                btn_Pause.isHidden = true
            }
        }
        
        
        sld_Duration.setValue(Float(audio.currentTime), animated: true)
    }
    
    @IBAction func sld_changeDuration(_ sender: AnyObject) {
        audio.currentTime = sender.value
        // timer.invalidate()
        let minu = Int(audio.currentTime / 60)
        let sec = Int(audio.currentTime.truncatingRemainder(dividingBy: 60))
        if (minu < 10 && sec < 10)
        {
            self.lbl_Timeplay.text = "0\(minu):0\(sec)"
            
        }else{
            if sec < 10 {
                self.lbl_Timeplay.text = "\(minu):0\(sec) "
            } else if minu < 10 {
                self.lbl_Timeplay.text = "0\(minu):\(sec) "
            }else{
                self.lbl_Timeplay.text = "\(minu):\(sec) "
            }
        }
        
        
        
        timer.invalidate()
    }
    
    @IBAction func sld_Volume(_ sender: AnyObject) {
        audio.volume = sender.value
        //        print(audio.volume)
    }
    func addThumtoSld()  {
        sld_Volume.setThumbImage(#imageLiteral(resourceName: "thumb.png"), for: .normal)
        sld_Volume.setThumbImage(#imageLiteral(resourceName: "thumbHightLight.png"), for: .highlighted)
    }
    
    
    @IBAction func btn_PlayPause() {
        
        audio.play()
        btn_Play.isHidden = true
        btn_Pause.isHidden = false
    }
    
    @IBAction func btn_stop() {
        
        audio.pause()
        btn_Pause.isHidden = true
        btn_Play.isHidden  = false
    }
    
    @IBAction func Swh_onOff(_ sender: UISwitch) {
        if (mySwitch.isOn){
            print(mySwitch.isOn)
            audio.numberOfLoops = -1
            
        }
        else{
            print(mySwitch.isOn)
            audio.numberOfLoops = 0
        }
    }
    
    
    
    
}

