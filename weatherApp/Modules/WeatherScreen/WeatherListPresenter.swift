
import UIKit


class WeatherListPresenter: WeatherListViewToPresenterProtocol {
    
    var view: WeatherListPresenterToViewProtocol?
    var interactor: WeatherListPresenterToInteractorProtocol?
    var router: WeatherListPresenterToRouterProtocol?
    
    private var data = SingletonWeather.sharedInstance.resultsArray
    private lazy var tableDelegate: WeatherListTableDelegate = {
        return WeatherListTableDelegate(actionDelegate: self )
    }()
    private var tableDataSource: WeatherListTableDataSource?

    func updateView() {
        showLoader()
        configTable()
        interactor?.WeatherList()
    }
    
    private func configTable() {
        view?.tableView.register(UINib(nibName: WeatherListTableViewCell.cellType, bundle: nil), forCellReuseIdentifier: WeatherListTableViewCell.cellType)
        view?.tableView.tableFooterView = UIView()
        view?.tableView.delegate = tableDelegate
        tableDataSource = WeatherListTableDataSource()
        view?.tableView.dataSource = tableDataSource
    }
}

extension WeatherListPresenter: WeatherListInteractorToPresenterProtocol {
    func fetchedWeatherListDataSuccess(_ model: WeatherListResponse) {
        guard let list = model.results else { return }
        data = list
        SingletonWeather.sharedInstance.resultsArray = list
        tableDataSource = WeatherListTableDataSource(data: list)
        view?.tableView.dataSource = tableDataSource
        view?.tableView.reloadData()
        hideLoader()
    }
    
    func fetchedWeatherListDataFailed(_ error: Error) {
        hideLoader()
    }
    
}
extension WeatherListPresenter : WeatherListTableActionDelegate{
}