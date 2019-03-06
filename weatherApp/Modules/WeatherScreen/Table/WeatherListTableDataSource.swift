

import UIKit

final class WeatherListTableDataSource: NSObject, UITableViewDataSource {
    
    var data :[WeatherListResponse]?
    convenience init(data: [WeatherListResponse]) {
        self.init()
        self.data = data
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if let list = data?.count {
            return list
        } else {
            return 0
        }
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherListTableViewCell.cellType, for: indexPath) as? WeatherListTableViewCell
            else{ return UITableViewCell()}
        cell.displayCell(weather: data![indexPath.row])
        return cell
    }
    
    
    
}
