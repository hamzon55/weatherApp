

import UIKit

protocol MusicDetailPresenterToViewProtocol: class{
    var playPauseBtn: UIButton! { get set }
    var coverImg: UIImageView! { get set }
    var artisteName: UILabel! { get set }
    var trackName: UILabel! { get set }
    var sharedBtn: UIButton! {get set}
}

protocol MusicDetailInteractorToPresenterProtocol: class{
}

protocol MusicDetailPresenterToInteractorProtocol: class{
    var presenter: MusicDetailInteractorToPresenterProtocol? {get set}

}

protocol MusicDetailViewToPresenterProtocol: class{
    var view: MusicDetailPresenterToViewProtocol? {get set}
    var interactor: MusicDetailPresenterToInteractorProtocol? {get set}
    var router: MusicDetailPresenterToRouterProtocol? {get set}
    func updateView()
    func shareToSocial()
    func stopMusic()
    func playPausePressed()
    var index: Int { get set }
    func nextSongPressed()
    func previousSongPressed()

}

protocol MusicDetailPresenterToRouterProtocol: class{
    static func createModule(data: MusicResultsList, index: Int) -> UIViewController
}
