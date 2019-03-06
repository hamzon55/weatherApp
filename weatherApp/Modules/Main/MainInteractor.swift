


import UIKit
import RxSwift

class MainInteractor: MainPresenterToInteractorProtocol {
    var presenter: MainInteractorToPresenterProtocol?
    
    private let webService = WebService()
    private let disposeBag = DisposeBag()
    
    func currentWeather() {
        let list = webService.load(modelType: CurrentWeatherResponse.self,from:
            .WeatherCurrent(serviceType: .current(city: DynamicVariables.Networking.Url.item_search)))
        list.observeOn(MainScheduler.instance)
        .subscribe(onNext: { [weak self] (results) in
            results.validate {
                self?.presenter?.fetchedWeatherDataSuccess(results)
            }
            }, onError: { [weak self] (error) in
                self?.presenter?.fetchedWeatherDataFailed(error)
        }).disposed(by: disposeBag)
    }
}
