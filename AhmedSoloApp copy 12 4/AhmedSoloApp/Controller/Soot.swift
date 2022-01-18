//
//  Soot.swift
//  AhmedSoloApp
//
//  Created by Ahmed Assiri on 23/04/1443 AH.
//

import Foundation

import UIKit

class sootVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var sootlable: UILabel!
    @IBOutlet var table: UITableView!
    
    var songs = [Song]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
//        self.sootlable.layer.cornerRadius = 20
        view.backgroundColor = UIColor(named: "Color")
        configureSongs()
        table.delegate = self
        table.dataSource = self
    }
    
    func configureSongs() {
        songs.append(Song(name:" سورة الفاتحة",
                          albumName:"الشيخ ماهر المعيقلي",
                          artistName: "تشغيل",
                          imageName: "606",
                          trackName: "001"))
        songs.append(Song(name: "سورة البقره" ,
                          albumName: " الشيخ ماهر المعيقلي",
                          artistName: "تشغيل",
                          imageName: "606",
                          trackName: "002"))
        songs.append(Song(name: "سورة آل عمران",
                          albumName:  "الشيخ ماهر المعيقلي",
                          artistName: "تشغيل",
                          imageName: "606",
                          trackName: "003"))
        songs.append(Song(name: " سورة النساء ",
                          albumName: "الشيخ ماهر المعيقلي",
                          artistName: "تشغيل",
                          imageName: "606",
                          trackName: "004"))
        songs.append(Song(name: "سورةالمائدة",
                          albumName: "الشيخ ماهر المعيقلي",
                          artistName: "تشغيل",
                          imageName: "606",
                          trackName: "005"))
        
        songs.append(Song(name: "سورة الانعام",
                          albumName: "الشيخ ماهر المعيقلي",
                          artistName: "تشغيل",
                          imageName: "606",
                          trackName: "006"))
        songs.append(Song(name: "سورة الاعراف",
                          albumName: "الشيخ ماهر المعيقلي",
                          artistName: "تشغيل",
                          imageName: "606",
                          trackName: "007"))
        songs.append(Song(name: "سورة الانفال",
                          albumName: "الشيخ ماهر المعيقلي",
                          artistName: "تشغيل",
                          imageName: "606",
                          trackName: "008"))
        
        songs.append(Song(name: "سورة التوبة ",
                          albumName: "الشيخ ماهر المعيقلي",
                          artistName: "تشغيل",
                          imageName: "606",
                          trackName: "009"))
        songs.append(Song(name: "سورة يونس ",
                          albumName: "الشيخ ماهر المعيقلي",
                          artistName: "تشغيل",
                          imageName: "606",
                          trackName: "010"))
        songs.append(Song(name: "سورة هود",
                          albumName: "الشيخ ماهر المعيقلي",
                          artistName: "تشغيل",
                          imageName: "606",
                          trackName: "011"))
        songs.append(Song(name: "سورة يوسف ",
                          albumName: "الشيخ ماهر المعيقلي",
                          artistName: "تشغيل",
                          imageName: "606",
                          trackName: "012"))
        songs.append(Song(name: "سورة الرعد",
                          albumName: "الشيخ ماهر المعيقلي",
                          artistName: "تشغيل",
                          imageName: "606",
                          trackName: "013"))
        songs.append(Song(name: "سورة إبراهيم",
                          albumName: "الشيخ ماهر المعيقلي",
                          artistName: "تشغيل",
                          imageName: "606",
                          trackName: "014"))

        songs.append(Song(name: "سورة الحجر",
                          albumName: "الشيخ ماهر المعيقلي",
                          artistName: "تشغيل",
                          imageName: "606",
                          trackName: "015"))

        songs.append(Song(name: "سورة النحل",
                          albumName: "الشيخ ماهر المعيقلي",
                          artistName: "تشغيل",
                          imageName: "606",
                          trackName: "016"))

    }
    
    
    
    // Table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "123", for: indexPath)
        let song = songs[indexPath.row]
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
        guard let vc = storyboard?.instantiateViewController(identifier: "player") as? PlayerViewController else {
            return
        }
        vc.songs = songs
        vc.position = position
        present(vc, animated: true)
    }
    
    
}

