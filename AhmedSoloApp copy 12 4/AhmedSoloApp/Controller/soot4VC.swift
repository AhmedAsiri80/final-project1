//
//  soot4VC.swift
//  AhmedSoloApp
//
//  Created by Ahmed Assiri on 02/06/1443 AH.
//
//

import Foundation

import UIKit

class sootVC5: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var sootlable5: UILabel!
    @IBOutlet var table5: UITableView!
    
    var songs4 = [Song4]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        //self.sootlable5.layer.cornerRadius = 20
        view.backgroundColor = UIColor(named: "Color")
        configureSongs()
        table5.delegate = self
        table5.dataSource = self
    }
    
         func configureSongs() {
             songs4.append(Song4(name:" سورة الفاتحة",
                               albumName:"الشيخ علي جابر ",
                               artistName: "تشغيل",
                               imageName: "808",
                               trackName: "100"))
             songs4.append(Song4(name: "سورة البقره" ,
                               albumName: "الشيخ علي جابر ",
                               artistName: "تشغيل",
                               imageName: "808",
                               trackName: "200"))
             songs4.append(Song4(name: "سورة آل عمران",
                               albumName:  "الشيخ علي جابر ",
                               artistName: "تشغيل",
                               imageName: "808",
                               trackName: "300"))
             songs4.append(Song4(name: " سورة النساء ",
                               albumName: "الشيخ علي جابر " ,
                               artistName: "تشغيل",
                               imageName: "808",
                               trackName: "400"))
             songs4.append(Song4(name: "سورةالمائدة",
                               albumName: "الشيخ علي جابر ",
                               artistName: "تشغيل",
                               imageName: "808",
                               trackName: "500"))
             
             songs4.append(Song4(name: "سورة الانعام",
                               albumName: "الشيخ علي جابر " ,
                               artistName: "تشغيل",
                               imageName: "808",
                               trackName: "600"))
             songs4.append(Song4(name: "سورة الاعراف",
                               albumName: "الشيخ علي جابر ",
                               artistName: "تشغيل",
                               imageName: "808",
                               trackName: "700"))
             songs4.append(Song4(name: "سورة الانفال",
                               albumName: "الشيخ علي جابر ",
                               artistName: "تشغيل",
                               imageName: "808",
                               trackName: "800"))
             
             songs4.append(Song4(name: "سورة التوبة ",
                               albumName: "الشيخ علي جابر ",
                               artistName: "تشغيل",
                               imageName: "808",
                               trackName: "900"))
             songs4.append(Song4(name: "سورة يونس ",
                               albumName: "الشيخ علي جابر ",
                               artistName: "تشغيل",
                               imageName: "808",
                               trackName: "1000"))
             songs4.append(Song4(name: "سورة هود",
                               albumName: "الشيخ علي جابر ",
                               artistName: "تشغيل",
                               imageName: "808",
                               trackName: "1100"))
             songs4.append(Song4(name: "سورة يوسف ",
                               albumName: "الشيخ علي جابر ",
                               artistName: "تشغيل",
                               imageName: "808",
                               trackName: "1200"))
             songs4.append(Song4(name: "سورة الرعد",
                               albumName: "الشيخ علي جابر ",
                               artistName: "تشغيل",
                               imageName: "808",
                               trackName: "1300"))
             songs4.append(Song4(name: "سورة إبراهيم",
                               albumName: "الشيخ علي جابر ",
                               artistName: "تشغيل",
                               imageName: "808",
                               trackName: "1400"))

             songs4.append(Song4(name: "سورة الحجر",
                               albumName: "الشيخ علي جابر ",
                               artistName: "تشغيل",
                               imageName: "808",
                               trackName: "1500"))

             songs4.append(Song4(name: "سورة النحل",
                               albumName: "الشيخ علي جابر ",
                               artistName: "تشغيل",
                               imageName: "808",
                               trackName: "1600"))
             songs4.append(Song4(name: "سورة النحل",
                               albumName: "الشيخ علي جابر ",
                               artistName: "تشغيل",
                               imageName: "808",
                               trackName: "1700"))
             songs4.append(Song4(name: "سورة النحل",
                               albumName: "الشيخ علي جابر ",
                               artistName: "تشغيل",
                               imageName: "808",
                               trackName: "1800"))

         }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs4.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "123", for: indexPath)
        let song = songs4[indexPath.row]
        // configure
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: song.imageName)
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 17)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // present the player
        let position = indexPath.row
        guard let vc = storyboard?.instantiateViewController(identifier: "player4") as? PlayerViewController5 else {
            return
        }
        vc.songs = songs4
        vc.position = position
        present(vc, animated: true)
    }
    
    
}


import Foundation
import AVFoundation
import UIKit

class PlayerViewController5: UIViewController {
    
    public var position: Int = 0
    public var songs: [Song4] = []
    
    @IBOutlet var holder5: UIView!
    
    var player5: AVAudioPlayer?
    
    // User Interface elements
    
    private let albumImageView2: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let songNameLabel2: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0 // line wrap
        return label
    }()
    
    private let artistNameLabel2: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0 // line wrap
        return label
    }()
    
    private let albumNameLabel2: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0 // line wrap
        return label
    }()
    
    let playPauseButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Color")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if holder5.subviews.count == 0 {
            configure()
        }
    }
    
    func configure() {
        // set up player
        let song = songs[position]
        
        let urlString = Bundle.main.path(forResource: song.trackName, ofType: "mp3")
        
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            guard let urlString = urlString else {
                print("urlstring is nil")
                return
            }
            
            player5 = try AVAudioPlayer(contentsOf: URL(string: urlString)!)
            
            guard let player = player5 else {
                print("player is nil")
                return
            }
            player.volume = 0.5
            
            player.play()
        }
        catch {
            print("error occurred")
        }
        
        // set up user interface elements
        
        // album cover
        albumImageView2.frame = CGRect(x: 10,
                                      y: 10,
                                      width: holder5.frame.size.width-20,
                                      height: holder5.frame.size.width-20)
        albumImageView2.image = UIImage(named: song.imageName)
        holder5.addSubview(albumImageView2)
        
        // Labels: Song name, album, artist
        songNameLabel2.frame = CGRect(x: 10,
                                     y: albumImageView2.frame.size.height + 10,
                                     width: holder5.frame.size.width-20,
                                     height: 70)
        albumNameLabel2.frame = CGRect(x: 10,
                                      y: albumImageView2.frame.size.height + 10 + 70,
                                      width: holder5.frame.size.width-20,
                                      height: 70)
        artistNameLabel2.frame = CGRect(x: 10,
                                       y: albumImageView2.frame.size.height + 10 + 140,
                                       width: holder5.frame.size.width-20,
                                       height: 70)
        
        songNameLabel2.text = song.name
        albumNameLabel2.text = song.albumName
        artistNameLabel2.text = song.artistName
        
        holder5.addSubview(songNameLabel2)
        holder5.addSubview(albumNameLabel2)
        holder5.addSubview(artistNameLabel2)
        
        // Player controls
        let nextButton = UIButton()
        let backButton = UIButton()
        
        // Frame
        let yPosition = artistNameLabel2.frame.origin.y + 70 + 20
        let size: CGFloat = 70
        
        playPauseButton.frame = CGRect(x: (holder5.frame.size.width - size) / 2.0,
                                       y: yPosition,
                                       width: size,
                                       height: size)
        
        nextButton.frame = CGRect(x: holder5.frame.size.width - size - 20,
                                  y: yPosition,
                                  width: size,
                                  height: size)
        
        backButton.frame = CGRect(x: 20,
                                  y: yPosition,
                                  width: size,
                                  height: size)
        
        // Add actions
        playPauseButton.addTarget(self, action: #selector(didTapPlayPauseButton), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        
        // Styling
        
        playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
        backButton.setBackgroundImage(UIImage(systemName: "backward.fill"), for: .normal)
        nextButton.setBackgroundImage(UIImage(systemName: "forward.fill"), for: .normal)
        
        playPauseButton.tintColor = .black
        backButton.tintColor = .black
        nextButton.tintColor = .black
        
        holder5.addSubview(playPauseButton)
        holder5.addSubview(nextButton)
        holder5.addSubview(backButton)
        
        // slider
        let slider2 = UISlider(frame: CGRect(x: 20,
                                            y: holder5.frame.size.height-60,
                                            width: holder5.frame.size.width-40,
                                            height: 50))
        slider2.value = 0.5
        slider2.addTarget(self, action: #selector(didSlideSlider(_:)), for: .valueChanged)
        holder5.addSubview(slider2)
    }
    
    @objc func didTapBackButton() {
        if position > 0 {
            position = position - 1
            player5?.stop()
            for subview in holder5.subviews {
                subview.removeFromSuperview()
            }
            configure()
        }
    }
    
    @objc func didTapNextButton() {
        if position < (songs.count - 1) {
            position = position + 1
            player5?.stop()
            for subview in holder5.subviews {
                subview.removeFromSuperview()
            }
            configure()
        }
    }
    
    @objc func didTapPlayPauseButton() {
        if player5?.isPlaying == true {
            // pause
            player5?.pause()
            // show play button
            playPauseButton.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
            
            // shrink image
            UIView.animate(withDuration: 0.2, animations: {
                self.albumImageView2.frame = CGRect(x: 30,
                                                   y: 30,
                                                   width: self.holder5.frame.size.width-60,
                                                   height: self.holder5.frame.size.width-60)
            })
        }
        else {
            // play
            player5?.play()
            playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
            
            // increase image size
            UIView.animate(withDuration: 0.2, animations: {
                self.albumImageView2.frame = CGRect(x: 10,
                                                   y: 10,
                                                   width: self.holder5.frame.size.width-20,
                                                   height: self.holder5.frame.size.width-20)
            })
        }
    }
    
    @objc func didSlideSlider(_ slider: UISlider) {
        let value = slider.value
        player5?.volume = value
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let player = player5 {
            player.stop()
        }
    }
    
}
