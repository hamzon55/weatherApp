

import Foundation
import UIKit

extension UIAlertController {
    func showInfoAlert(view: UIViewController? = UIApplication.topViewController(), title: String, message: String, finishAction: (()->Void)? = nil){
        guard let view = view else { return }
        self.title = title
        self.message = message
        self.addAction(UIAlertAction(title: "generic_ok".localized(), style: .default, handler: { _ in
            finishAction?()
        }))
        view.present(self, animated: true)
    }
    
    enum QuestionType {
        case destructive, normal
        var alertType: UIAlertAction.Style {
            switch self {
            case .destructive:
                return UIAlertAction.Style.destructive
            case .normal:
                return UIAlertAction.Style.default
            }
        }
    }
    
    func askQuestion(title: String, question: String, type: QuestionType = .destructive , completion: @escaping ()->Void){
        self.title = title
        self.message = question
        self.addAction(UIAlertAction(title: "generic_yes".localized(), style: type.alertType){ (_) in
            completion()
        })
        self.addAction(UIAlertAction(title: "generic_no".localized(), style: .cancel))
        UIApplication.topViewController()?.present(self, animated: true)
    }
    
    func askBetweenOptions(title:String, question: String, destructiveButtonTitle: String, saveButtonTitle: String, deleteDraft destructiveCompletion: @escaping ()->Void, saveDraft saveCompletion: @escaping ()->Void){
        self.title = title
        self.message = question
        self.addAction(UIAlertAction(title: destructiveButtonTitle, style: .destructive){ (_) in
            destructiveCompletion()
        })
        
        self.addAction(UIAlertAction(title: saveButtonTitle, style: .default){ (_) in
            saveCompletion()
        })
        
        self.addAction(UIAlertAction(title: "generic_cancel".localized(), style: .cancel))
        UIApplication.topViewController()?.present(self, animated: true)
    }
}

extension UIApplication {
    class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}
