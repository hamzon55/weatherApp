

import UIKit


class WeatherListTableViewCell : UITableViewCell {
    
    
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var titleSong: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static var cellType: String{
        return String(describing: self)
    }
    func displayCell(weather: WeatherListResponse){
        titleSong.text = weather.city.country
//        albumTitle.text = weather.collectionName
//        titleSong.text = weather.trackName
//        priceSong.text = NSString(format: "$".appending("%.2f") as NSString, weather.trackPrice ?? "0") as String
//        musicGenre.text = weather.primaryGenreName
//        releaseDate.text = weather.releaseDate
//        displayImage(image: weather.artworkUrl100)
//        displayDuration(ms: weather.trackTimeMillis)
//

    }
    }

