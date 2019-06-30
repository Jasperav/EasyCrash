import UIKit

class ViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (_) in
            let someInitializable: UIViewControllerInitializable.Type = SomeViewController.self
            
            self.present(someInitializable.init(), animated: true, completion: nil)
        }
    }

}

protocol Initializable {
    init()
}

protocol UIViewControllerInitializable: Initializable, UIViewController {}

class BaseTableViewController: UITableViewController {
    let a: Int
    
    init(a: Int) {
        self.a = a
        
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

final class SomeViewController: BaseTableViewController, UIViewControllerInitializable {
    init() {
        print("init")
        
        super.init(a: 10)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
