import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var table: UITableView!

    var songs = [Song]()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureSongs()
        table.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
    }

func configureSongs(){
        
        songs.append(Song(name: "Thunder",
        albumName: "Deluxe",
        artistName: "Netsky",
        imageName: "cover5",
        trackName: "Thunder"))
        
        songs.append(Song(name: "Here_With_You",
        albumName: "Deluxe",
        artistName: "Netsky",
        imageName: "cover4",
        trackName: "Here With You"))
        
        songs.append(Song(name: "Come_Alive",
        albumName: "Deluxe",
        artistName: "Netsky",
        imageName: "cover2",
        trackName: "Come Alive"))
        
        songs.append(Song(name: "Give_&_Take",
        albumName: "Deluxe",
        artistName: "Netsky",
        imageName: "cover1",
        trackName: "Give & Take"))
        
        songs.append(Song(name: "High_Alert",
        albumName: "Deluxe",
        artistName: "Netsky",
        imageName: "cover3",
        trackName: "High Alert"))
    }

    // Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as! CustomTableViewCell
        
        let song = songs[indexPath.row]
        // configure
        cell.configure(with: song.name, imageName: song.imageName, subTitle: song.albumName)
        
        cell.accessoryType = .disclosureIndicator
        cell.titleLabel.font = UIFont(name: "Helvetica-Bold", size: 18)
        cell.subtitleLabel.font = UIFont(name: "Helvetica", size: 17)

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        // present the player with segue
        let position = indexPath.row
        guard let vc = storyboard?.instantiateViewController(identifier: "player") as? PlayerViewController else {
            return
        }
        vc.songs = songs
        vc.position = position
        present(vc, animated: true)
    }


}

struct Song {
    let name: String
    let albumName: String
    let artistName: String
    let imageName: String
    let trackName: String
}
