

import UIKit


class WeatherListViewController: UIViewController, UISearchBarDelegate {
    
    var presenter: WeatherListViewToPresenterProtocol?
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.updateView()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension WeatherListViewController: WeatherListPresenterToViewProtocol {
 
}
