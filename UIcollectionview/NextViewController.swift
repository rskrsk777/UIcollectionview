

import UIKit

final class NextViewController: UIViewController {
    
    var fruitLabel: UILabel!
    var fruitName: String = ""
    
    init(value: String) {
        self.fruitName = value
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("fatalError")
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        let fruitLabel = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        fruitLabel.text = fruitName
        fruitLabel.font = UIFont.systemFont(ofSize: 50)
        fruitLabel.textAlignment = NSTextAlignment.center
        fruitLabel.adjustsFontSizeToFitWidth = true
        fruitLabel.backgroundColor = .yellow
        fruitLabel.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(NextViewController.tapLabel(_:)))
        fruitLabel.addGestureRecognizer(gesture)
        print("addGesture")
        view.addSubview(fruitLabel)

    }
    
    @objc func tapLabel(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
}
