

import UIKit
import RxSwift

class MusicDetailInteractor: MusicDetailPresenterToInteractorProtocol{

    var presenter: MusicDetailInteractorToPresenterProtocol?
    
    var artistName: String?
    var trackName: String?
    var artworkUrl100: String?
    var previewUrl: String?
   

}
