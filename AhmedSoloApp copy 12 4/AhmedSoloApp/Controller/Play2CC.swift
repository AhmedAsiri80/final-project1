//
//  Play2CC.swift
//  AhmedSoloApp
//
//  Created by Ahmed Assiri on 23/05/1443 AH.
//


import Foundation
import AVFoundation
import UIKit

class PlayerViewController2: UIViewController {
    
    public var position: Int = 0
    public var songs: [Song2] = []
    
    @IBOutlet var holder2: UIView!
    
    var player2: AVAudioPlayer?
    
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
        if holder2.subviews.count == 0 {
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
            
            player2 = try AVAudioPlayer(contentsOf: URL(string: urlString)!)
            
            guard let player = player2 else {
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
                                      width: holder2.frame.size.width-20,
                                      height: holder2.frame.size.width-20)
        albumImageView2.image = UIImage(named: song.imageName)
        holder2.addSubview(albumImageView2)
        
        // Labels: Song name, album, artist
        songNameLabel2.frame = CGRect(x: 10,
                                     y: albumImageView2.frame.size.height + 10,
                                     width: holder2.frame.size.width-20,
                                     height: 70)
        albumNameLabel2.frame = CGRect(x: 10,
                                      y: albumImageView2.frame.size.height + 10 + 70,
                                      width: holder2.frame.size.width-20,
                                      height: 70)
        artistNameLabel2.frame = CGRect(x: 10,
                                       y: albumImageView2.frame.size.height + 10 + 140,
                                       width: holder2.frame.size.width-20,
                                       height: 70)
        
        songNameLabel2.text = song.name
        albumNameLabel2.text = song.albumName
        artistNameLabel2.text = song.artistName
        
        holder2.addSubview(songNameLabel2)
        holder2.addSubview(albumNameLabel2)
        holder2.addSubview(artistNameLabel2)
        
        // Player controls
        let nextButton = UIButton()
        let backButton = UIButton()
        
        // Frame
        let yPosition = artistNameLabel2.frame.origin.y + 70 + 20
        let size: CGFloat = 70
        
        playPauseButton.frame = CGRect(x: (holder2.frame.size.width - size) / 2.0,
                                       y: yPosition,
                                       width: size,
                                       height: size)
        
        nextButton.frame = CGRect(x: holder2.frame.size.width - size - 20,
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
        
        holder2.addSubview(playPauseButton)
        holder2.addSubview(nextButton)
        holder2.addSubview(backButton)
        
        // slider
        let slider2 = UISlider(frame: CGRect(x: 20,
                                            y: holder2.frame.size.height-60,
                                            width: holder2.frame.size.width-40,
                                            height: 50))
        slider2.value = 0.5
        slider2.addTarget(self, action: #selector(didSlideSlider(_:)), for: .valueChanged)
        holder2.addSubview(slider2)
    }
    
    @objc func didTapBackButton() {
        if position > 0 {
            position = position - 1
            player2?.stop()
            for subview in holder2.subviews {
                subview.removeFromSuperview()
            }
            configure()
        }
    }
    
    @objc func didTapNextButton() {
        if position < (songs.count - 1) {
            position = position + 1
            player2?.stop()
            for subview in holder2.subviews {
                subview.removeFromSuperview()
            }
            configure()
        }
    }
    
    @objc func didTapPlayPauseButton() {
        if player2?.isPlaying == true {
            // pause
            player2?.pause()
            // show play button
            playPauseButton.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)
            
            // shrink image
            UIView.animate(withDuration: 0.2, animations: {
                self.albumImageView2.frame = CGRect(x: 30,
                                                   y: 30,
                                                   width: self.holder2.frame.size.width-60,
                                                   height: self.holder2.frame.size.width-60)
            })
        }
        else {
            // play
            player2?.play()
            playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)
            
            // increase image size
            UIView.animate(withDuration: 0.2, animations: {
                self.albumImageView2.frame = CGRect(x: 10,
                                                   y: 10,
                                                   width: self.holder2.frame.size.width-20,
                                                   height: self.holder2.frame.size.width-20)
            })
        }
    }
    
    @objc func didSlideSlider(_ slider: UISlider) {
        let value = slider.value
        player2?.volume = value
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let player = player2 {
            player.stop()
        }
    }
    
}
