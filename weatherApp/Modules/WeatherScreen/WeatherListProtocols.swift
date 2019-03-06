

import UIKit


protocol WeatherListPresenterToViewProtocol: class{
    var tableView: UITableView!  { get set }
}

protocol WeatherListInteractorToPresenterProtocol: class{
    func fetchedWeatherListDataSuccess(_ model: WeatherListResponse?)
    func fetchedWeatherListDataFailed(_ error: Error)

}

protocol WeatherListPresenterToInteractorProtocol: class{
    var presenter: WeatherListInteractorToPresenterProtocol? {get set}
    func WeatherList()
    func search(withInfo: String)
}

protocol WeatherListViewToPresenterProtocol: class{
    var view: WeatherListPresenterToViewProtocol? {get set}
    var interactor: WeatherListPresenterToInteractorProtocol? {get set}
    var router: WeatherListPresenterToRouterProtocol? {get set}
    func updateView()
}

protocol WeatherListPresenterToRouterProtocol: class{
    static func createModule() -> UIViewController
    }
