

import UIKit

class MainPresenter: MainViewToPresenterProtocol {
    
    var view: MainPresenterToViewProtocol?
    var interactor: MainPresenterToInteractorProtocol?
    var router: MainPresenterToRouterProtocol?
    
    func nextButtonPressed() {
        guard let vc = view as? UIViewController else { return }
        router?.navigateToNextScreen(origin: vc)
    }
}

extension MainPresenter: MainInteractorToPresenterProtocol {
    
}
