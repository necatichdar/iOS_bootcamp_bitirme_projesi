//
//  OnboardingVC.swift
//  BitirmeProjesi
//
//  Created by Necati Çuhadar on 12.01.2022.
//

import UIKit
import AVKit
import AVFoundation

class OnboardingVC: UIViewController {
    
    @IBOutlet weak var viewVideo: UIView!
    @IBOutlet weak var button: UIButton!
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playVideo()
        Timer.scheduledTimer(withTimeInterval: 15.0, repeats: true) { timer in
            self.playVideo()
        }
    }
    
    @IBAction func buttonNext(_ sender: Any) {
        //d.removeObject(forKey: "username")
        buttonNext()
    }
    
    func buttonNext(){
        let username1  = d.string(forKey: "username")
        if username1 == nil{
            usernameGiris()
            return
        }
        
        let controller = storyboard?.instantiateViewController(identifier: "HomeNC") as! UINavigationController
        controller.modalPresentationStyle = .fullScreen
        controller.modalTransitionStyle = .flipHorizontal
        present(controller, animated: true, completion: nil)
    }
    func alertGoster(){
        let alertController = UIAlertController(title: "Hata", message: "Lütfen geçerli bir kullanıcı adı giriniz!", preferredStyle: .alert)
        
        let tamamAction = UIAlertAction(title: "Tamam", style: .destructive) { action in
            print("tamam")
        }
        alertController.addAction(tamamAction)
        self.present(alertController, animated: true) {
            print("tamamlandı mı")
        }
    }
    
    func usernameGiris(){
        let alertController = UIAlertController(title: "Bilgi girişi", message: "Lütfen kullanıcı adını giriniz", preferredStyle: .alert)
        
        alertController.addTextField { textField in
            textField.placeholder = "Enter username"
        }
        
        
        let kaydetAction = UIAlertAction(title: "Onayla", style: .destructive) { action in
            let alinanUsername = (alertController.textFields![0] as UITextField).text!
            if alinanUsername.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
                self.alertGoster()
                return
            }
            let username = alinanUsername.trimmingCharacters(in: .whitespacesAndNewlines)
            print("deneme \(username)")
            d.set(username, forKey: "username")
            
            self.buttonNext()
        }
        alertController.addAction(kaydetAction)
        self.present(alertController, animated: true) {
        }
    }
    
    func playVideo() {
        guard let path = Bundle.main.path(forResource: "nusret-video", ofType: ".mp4") else {
            return
        }
        
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        playerLayer.videoGravity = .resizeAspectFill
        self.viewVideo.layer.addSublayer(playerLayer)
        
        
        player.play()
        viewVideo.bringSubviewToFront(button)
        
        
    }
}
