import AVFoundation
import UIKit

class PlayerViewController: UIViewController {

    public var position: Int = 0
    public var songs: [Song] = []

    @IBOutlet var stackView: UIStackView!

    var player: AVAudioPlayer?

    // User Interface elements
    @IBOutlet weak var albumImageView: UIImageView!

    @IBOutlet var songNameLabel: UILabel!

    @IBOutlet var artistNameLabel: UILabel!

    @IBOutlet var albumNameLabel: UILabel!

    @IBOutlet var playPauseButton: UIButton!
    
    @IBOutlet var nextButton : UIButton!
    @IBOutlet var backButton : UIButton!
    
    @IBOutlet var slider :UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    func configure() {
        // set up player
        let song = songs[position]

        let urlString = Bundle.main.path(forResource: song.name, ofType: "mp3")

        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)

            guard let urlString = urlString else {
                print("urlstring is nil")
                return
            }

            player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)

            guard let player = player else {
                print("player is nil")
                return
            }
            player.volume = 0.5

            player.play()
        }
        catch {
            print("error occurred")
        }

        // album cover
        albumImageView.image = UIImage(named: song.imageName)

        // Labels: Song name, album, artist

        songNameLabel.text = song.name
        albumNameLabel.text = song.albumName
        artistNameLabel.text = song.artistName

        // Add actions
        playPauseButton.addTarget(self, action: #selector(didTapPlayPauseButton), for: .touchUpInside)
        nextButton.addTarget(self, action: #selector(didTapNextButton), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)


        // slider
        slider.value = 0.5
        slider.addTarget(self, action: #selector(didSlideSlider(_:)), for: .valueChanged)
    }

    @objc func didTapBackButton() {
        if position > 0 {
            position = position - 1
            player?.stop()
            
            configure()
        }
    }

    @objc func didTapNextButton() {
        if position < (songs.count - 1) {
            position = position + 1
            player?.stop()
            
            configure()
        }
    }

    @objc func didTapPlayPauseButton() {
        if player?.isPlaying == true {
            // pause
            player?.pause()
            // show play button
            playPauseButton.setBackgroundImage(UIImage(systemName: "play.fill"), for: .normal)

        }
        else {
            // play
            player?.play()
            playPauseButton.setBackgroundImage(UIImage(systemName: "pause.fill"), for: .normal)

        }
    }

    @objc func didSlideSlider(_ slider: UISlider) {
        let value = slider.value
        player?.volume = value
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let player = player {
            player.stop()
        }
    }

}
