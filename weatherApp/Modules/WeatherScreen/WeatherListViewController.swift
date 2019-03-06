

import UIKit


class WeatherListViewController: UIViewController, UISearchBarDelegate {
    var presenter: WeatherListViewToPresenterProtocol?
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.updateView()
        
        var button = UIBarButtonItem(title: "YourTitle", style: UIBarButtonItem.Style.bordered, target: self, action: "goBack")
        self.navigationItem.backBarButtonItem = button
        
    }
    
    func goBack()
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension WeatherListViewController: WeatherListPresenterToViewProtocol {
 
}
