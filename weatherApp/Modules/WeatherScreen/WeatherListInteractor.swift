

import UIKit
import RxSwift

class WeatherListInteractor: WeatherListPresenterToInteractorProtocol{


    
  
    var presenter: WeatherListInteractorToPresenterProtocol?
    
    private let webService = WebService()
    private let disposeBag = DisposeBag()
    
    func WeatherList() {
        let list = webService.load(modelType: WeatherListResponse.self,from:
            .WeatherForecast(serviceType: .list(city: DynamicVariables.Networking.Url.city, country_code: DynamicVariables.Networking.Url.countyCode)))
        list.observeOn(MainScheduler.instance)
            .subscribe(onNext: { [weak self] (results) in
                results.validate {
                    self?.presenter?.fetchedWeatherListDataSuccess(results)
                }
                }, onError: { [weak self] (error) in
                    self?.presenter?.fetchedWeatherListDataFailed(error)
            }).disposed(by: disposeBag)
    }
    func search(withInfo: String) {
        
    }
    
    
}





