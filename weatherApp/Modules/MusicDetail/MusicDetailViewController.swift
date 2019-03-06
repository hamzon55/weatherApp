

import UIKit
import Social
class MusicDetailViewController: UIViewController {
    @IBOutlet weak var sharedBtn: UIButton!
    
    @IBOutlet weak var trackName: UILabel!
    @IBOutlet weak var artisteName: UILabel!
    @IBOutlet weak var coverImg: UIImageView!
    @IBOutlet weak var playPauseBtn: UIButton!
    
    @IBOutlet weak var nextSongBtn: UIButton!
    @IBOutlet weak var previousSongBtn: UIButton!
   
    var presenter: MusicDetailViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.updateView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.updateView()
    }
    @IBAction func nextBtnClicked(_ sender: Any) {
        presenter?.nextSongPressed()
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        presenter?.stopMusic()
    }
    
    @IBAction func previousBtnClicked(_ sender: Any) {
        presenter?.previousSongPressed()
    }
    
    @IBAction func btnTapped(_ sender: Any) {
        presenter?.playPausePressed()
    }
    @IBAction func sharedBtn(_ sender: Any) {
        presenter?.shareToSocial()
}
}

extension MusicDetailViewController: MusicDetailPresenterToViewProtocol {

    
}
