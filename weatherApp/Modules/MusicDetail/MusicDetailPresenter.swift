

import UIKit
import Social
import AVFoundation
class MusicDetailPresenter: MusicDetailViewToPresenterProtocol {
    
    
    var data = SingletonMusic.sharedInstance.resultsArray
    let count = SingletonMusic.sharedInstance.resultsArray.count
    
    var dataModel: MusicDetailModel!
    var player:AVPlayer?
    var playerItem:AVPlayerItem?
    
    var index = Int()
    var currentIndex = 0
    
    var view: MusicDetailPresenterToViewProtocol?
    var interactor: MusicDetailPresenterToInteractorProtocol?
    var router: MusicDetailPresenterToRouterProtocol?
    
    func updateView() {
        
        currentIndex = index
        showInfo()
        if isSessionAvailable() {
            prepareSession()
            prepareSong()
        } else {
            
        }
    }
    
    private func showInfo(){
        view?.artisteName.text = data[currentIndex].artistName
        view?.trackName.text = data[currentIndex].trackName
        displayImageCover(image: data[currentIndex].artworkUrl100)
    }
    
    private func isSessionAvailable() -> Bool{
        if data[currentIndex].previewUrl == nil { return false }
        return true
    }
    
    func playPausePressed() {
        prepareSong()
    }
    private func prepareSong(){
        
        if isSessionAvailable(){
            if player?.rate == 0 {
                player!.play()
                view?.playPauseBtn?.setImage(UIImage(named: "Pause.png"), for: UIControl.State.normal)
            } else {
                player!.pause()
                view?.playPauseBtn?.setImage(UIImage(named: "Play.png"), for: UIControl.State.normal)
                
            }
        } else {
        }
    }
    
    
    private func prepareSession(){
        guard let song = data[currentIndex].previewUrl else { return }
        let url = URL(string: song)
        let playerItem:AVPlayerItem = AVPlayerItem(url: url!)
        player = AVPlayer(playerItem: playerItem)
    }
    
    func stopMusic(){
        player?.pause()
    }
    
    func nextSongPressed() {
        player?.pause()
        nextSong(index: getNextIndex(index: currentIndex))
        
    }
    
    func previousSongPressed() {
        player?.pause()
        previousSong(index: getPreviousIndex(index: currentIndex))
    }
}

extension MusicDetailPresenter: MusicDetailInteractorToPresenterProtocol {
    func nextSong(index: Int) {
        currentIndex = index
        showInfo()
        prepareSession()
        prepareSong()
    }
    
    func previousSong(index: Int) {
        currentIndex = index
        showInfo()
        prepareSession()
        prepareSong()
    }
    
    private func getNextIndex(index: Int) -> Int {
        if index >= count-1 { return 0 } else { return index+1 }
    }
    private func getPreviousIndex(index: Int) -> Int {
        if index <= 0 { return count-1 } else { return index-1 }
    }
    
    func shareToSocial() {
        // First Option
        if(SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook)) {
            let controller = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            controller?.setInitialText("facebook_shared_text")
            let url = URL(string: data[currentIndex].artworkUrl100!)
            controller?.add(url)
            UIApplication.topViewController()?.present(controller!, animated: true, completion: nil)
            //Second Option
            //            let activity =  UIActivityViewController(activityItems: [data[currentIndex].artworkUrl100!], applicationActivities: nil)
            
            //            activity.popoverPresentationController?.sourceView = self.view as? UIView
            //            UIApplication.topViewController()?.present(activity, animated: true, completion: nil)
        }
        
    }
    
    private func displayImageCover(image: String?){
        guard let img = image else { return }
        let url = URL(string: img)
        let data = try? Data(contentsOf: url!)
        view?.coverImg.image = UIImage(data: data!)
    }
}
