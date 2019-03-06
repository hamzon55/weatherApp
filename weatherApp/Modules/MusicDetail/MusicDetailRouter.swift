

import UIKit

class MusicDetailRouter: MusicDetailPresenterToRouterProtocol{
  
    class func createModule(data: MusicResultsList, index: Int) -> UIViewController{
        let view = MusicDetailViewController()
        let presenter: MusicDetailViewToPresenterProtocol & MusicDetailInteractorToPresenterProtocol = MusicDetailPresenter()
        let interactor: MusicDetailPresenterToInteractorProtocol = MusicDetailInteractor()
        let router: MusicDetailPresenterToRouterProtocol = MusicDetailRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        presenter.index = index
        return view
    }
    

}
