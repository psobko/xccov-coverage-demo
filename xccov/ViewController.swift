import UIKit

extension UIViewController {
    
    func preloadView() {
        let _ = view
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        layoutLetters()
    }
    
    func layoutLetters() {
        let letters = ["x","c","c","o","v"]
        let size = CGSize(width: view.frame.size.width/CGFloat(letters.count),
                          height: view.frame.size.height)
        
        for (index, letter) in letters.enumerated() {
            let rect = CGRect(origin: CGPoint(x:size.width * CGFloat(index), y:0.0), size: size)
            let label = UILabel.init(frame: rect)
            label.text = letter
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 22)
            view.addSubview(label)
        }
    }

    func neverCalledMethod() {
        for subview in view.subviews {
            subview.removeFromSuperview()
        }
    }
}

