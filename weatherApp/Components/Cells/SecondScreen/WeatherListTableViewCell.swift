

import UIKit


class WeatherListTableViewCell : UITableViewCell {
    
    
    @IBOutlet weak var foreCastlbl: UILabel!
    @IBOutlet weak var dayLbl: UILabel!
    @IBOutlet weak var cellView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static var cellType: String{
        return String(describing: self)
    }
    func displayCell(weather: MainClass){
        foreCastlbl.text = String(weather.temp)
    }
    }

