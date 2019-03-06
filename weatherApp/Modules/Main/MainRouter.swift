

import UIKit

class MainRouter: MainPresenterToRouterProtocol{

 
    class func createModule() -> UIViewController{
        
        let view: MainViewController = Storyboard.MainViewController.instantiateViewController()
        let presenter: MainViewToPresenterProtocol & MainInteractorToPresenterProtocol = MainPresenter()
        let interactor: MainPresenterToInteractorProtocol = MainInteractor()
        let router: MainPresenterToRouterProtocol = MainRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func navigateToNextScreen(origin: UIViewController){
        
        guard let navigationController = origin.navigationController as? NavigationBar else {return}
        navigationController.setViewControllers([WeatherListRouter.createModule()], animated: true)
    }
}
