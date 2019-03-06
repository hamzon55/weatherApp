

import UIKit

class MainPresenter: MainViewToPresenterProtocol {
    func updateView() {
        interactor?.currentWeather()
    }
    
    
    var view: MainPresenterToViewProtocol?
    var interactor: MainPresenterToInteractorProtocol?
    var router: MainPresenterToRouterProtocol?
    private var data : CurrentWeatherResponse!

    func nextButtonPressed() {
        guard let vc = view as? UIViewController else { return }
        router?.navigateToNextScreen(origin: vc)
    }
}

extension MainPresenter: MainInteractorToPresenterProtocol {
    func fetchedWeatherDataSuccess(_ model: CurrentWeatherResponse?) {
        guard let result = model else { return }
        data = result
        view?.temp.text = String(data.main.temp)
    }
    
    func fetchedWeatherDataFailed(_ error: Error) {
        
    }
    
    
}
