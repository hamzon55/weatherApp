

import UIKit


class WeatherListTableViewCell : UITableViewCell {
    
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var foreCastlbl: UILabel!
    @IBOutlet weak var cellView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static var cellType: String{
        return String(describing: self)
    }
    func displayCell(weather: MainClass){
        tempLbl.text =  "temperature_label".localized()
        foreCastlbl.text = String(weather.temp)
    }
    }

