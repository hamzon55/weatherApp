

import UIKit

class MainViewController: UIViewController {
    
    var presenter: MainViewToPresenterProtocol?
    
    @IBOutlet weak var actualTemp: UILabel!
    @IBOutlet weak var temp: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var city: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.updateView()
        self.startButton.setTitle("mainbutton_title".localized(), for: .normal)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onStartButton(_ sender: Any) {
        presenter?.nextButtonPressed()
    }
    
}

extension MainViewController: MainPresenterToViewProtocol {

    
    
}
