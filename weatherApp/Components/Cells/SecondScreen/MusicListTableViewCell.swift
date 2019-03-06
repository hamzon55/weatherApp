

import UIKit


class WeatherListTableViewCell : UITableViewCell {
    
    
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var cellView: UIView!

    @IBOutlet weak var albumTitle: UILabel!
    @IBOutlet weak var duration: UILabel!
    @IBOutlet weak var musicGenre: UILabel!
    @IBOutlet weak var imageSinger: UIImageView!
    @IBOutlet weak var priceSong: UILabel!
    @IBOutlet weak var titleSong: UILabel!
    @IBOutlet weak var artisteName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    static var cellType: String{
        return String(describing: self)
    }
    func displayCell(weather: WeatherResultsList){
        artisteName.text = weather.artistName
        albumTitle.text = weather.collectionName
        titleSong.text = weather.trackName
        priceSong.text = NSString(format: "$".appending("%.2f") as NSString, weather.trackPrice ?? "0") as String
        musicGenre.text = weather.primaryGenreName
        releaseDate.text = weather.releaseDate
        displayImage(image: weather.artworkUrl100)
        displayDuration(ms: weather.trackTimeMillis)
        

    }
    
    private func displayImage(image: String?){
        guard let img = image else { return }
        let url = URL(string: img)
        let data = try? Data(contentsOf: url!)
        imageSinger.image = UIImage(data: data!)
    }
    
    private func displayDuration(ms: Int?){
        guard let ms = ms else { return }
        duration.text = ms.msToSec.minuteSecondFormat
    }
}

