

import UIKit


protocol WeatherListTableActionDelegate: class {
}
final class WeatherListTableDelegate: NSObject, UITableViewDelegate {
    
    weak var delegate: WeatherListTableActionDelegate?
    
    init(actionDelegate: WeatherListTableActionDelegate) {
        super.init()
        self.delegate = actionDelegate
    }
    
}

