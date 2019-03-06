
import UIKit

class WeatherListRouter: WeatherListPresenterToRouterProtocol{
   
    class func createModule() -> UIViewController{
        
        let view = WeatherListViewController()
        let presenter: WeatherListViewToPresenterProtocol & WeatherListInteractorToPresenterProtocol = WeatherListPresenter()
        let interactor: WeatherListPresenterToInteractorProtocol = WeatherListInteractor()
        let router: WeatherListPresenterToRouterProtocol = WeatherListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }

}
