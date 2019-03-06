

import UIKit

protocol MainPresenterToViewProtocol: class{
}

protocol MainInteractorToPresenterProtocol: class{
    
}

protocol MainPresenterToInteractorProtocol: class{
    var presenter: MainInteractorToPresenterProtocol? {get set}
}

protocol MainViewToPresenterProtocol: class{
    var view: MainPresenterToViewProtocol? {get set}
    var interactor: MainPresenterToInteractorProtocol? {get set}
    var router: MainPresenterToRouterProtocol? {get set}
    func nextButtonPressed()
}

protocol MainPresenterToRouterProtocol: class{
    static func createModule() -> UIViewController
    func navigateToNextScreen(origin: UIViewController)
}
