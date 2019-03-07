

import UIKit

protocol MainPresenterToViewProtocol: class{
    var temp: UILabel! {get set}
    var actualTemp: UILabel! {get set}
    var city: UILabel! {get set}
    var startButton: UIButton! {get set}
}

protocol MainInteractorToPresenterProtocol: class{
    
    func fetchedWeatherDataSuccess(_ model: CurrentWeatherResponse?)
    func fetchedWeatherDataFailed(_ error: Error)
}

protocol MainPresenterToInteractorProtocol: class{
    var presenter: MainInteractorToPresenterProtocol? {get set}
    func currentWeather()

}

protocol MainViewToPresenterProtocol: class{
    var view: MainPresenterToViewProtocol? {get set}
    var interactor: MainPresenterToInteractorProtocol? {get set}
    var router: MainPresenterToRouterProtocol? {get set}
    func nextButtonPressed()
    func updateView()

}

protocol MainPresenterToRouterProtocol: class{
    static func createModule() -> UIViewController
    func navigateToNextScreen(origin: UIViewController)
}
