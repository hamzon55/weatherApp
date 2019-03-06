

import UIKit
import RxSwift

class WeatherListInteractor: WeatherListPresenterToInteractorProtocol{
  
    var presenter: WeatherListInteractorToPresenterProtocol?
    
    private let webService = WebService()
    private let disposeBag = DisposeBag()
    
    func WeatherList() {
//        let list = webService.load(modelType: WeatherListResponse.self, from: .weather(serviceType: .list(term: DynamicVariables.Networking.Url.item_search)))
//            list.observeOn(MainScheduler.instance)
//            .subscribe(onNext: { [weak self] (results) in
//                results.validate {
//                    self?.presenter?.fetchedWeatherListDataSuccess(results)
//                }
//                }, onError: { [weak self] (error) in
//                    self?.presenter?.fetchedWeatherListDataFailed(error)
//            }).disposed(by: disposeBag)
    }
    
    func search(withInfo: String) {
        let item = translateSearch(item: withInfo)
        DynamicVariables.Networking.Url.item_search = item
        WeatherList()
    }
    
    private func translateSearch(item: String) -> String {
        if item.contains(" "){
            return item.replacingOccurrences(of: " ", with: "+")
        } else {
            return item
        }
    }
}

