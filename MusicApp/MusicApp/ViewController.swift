//
//  ViewController.swift
//  MusicApp
//
//  Created by jasper on 26/08/2020.
//  Copyright © 2020 jasper. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet var table: UITableView!
    var songs = [Song]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSongs()
        table.delegate = self
        table.dataSource = self
        
    }
    
    func configureSongs(){
        
        songs.append(Song(name: "Thunder",
        albumName: "Deluxe",
        artistName: "Netsky",
        imageName: "cover5",
        trackName: "song5"))
        
        songs.append(Song(name: "Here With You",
        albumName: "Deluxe",
        artistName: "Netsky",
        imageName: "cover4",
        trackName: "song4"))
        
        songs.append(Song(name: "Come Alive",
        albumName: "Deluxe",
        artistName: "Netsky",
        imageName: "cover2",
        trackName: "song2"))
        
        songs.append(Song(name: "Give & Take",
        albumName: "Deluxe",
        artistName: "Netsky",
        imageName: "cover1",
        trackName: "song1"))
        
        songs.append(Song(name: "High Alert",
        albumName: "Deluxe",
        artistName: "Netsky",
        imageName: "cover3",
        trackName: "song3"))
    }
    
    //table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let song = songs[indexPath.row]
        
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: song.imageName)
        cell.textLabel?.font = UIFont(name: "Broadway", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Bodoni MT", size: 16)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //player
        let position = indexPath.row
        guard let vc = storyboard?.instantiateViewController(identifier: "player") as? PlayerViewController else {
            return
        }
        vc.songs = songs
        vc.position = position
        
        present(vc, animated: true)
    }
}

struct Song{
    let name: String
    let albumName: String
    let artistName: String
    let imageName: String
    let trackName: String
}

