//: A UIKit based Playground for presenting user interface
  
import UIKit
import Combine
import PlaygroundSupport

class MyViewController : UIViewController {
    
    let label = UILabel()
    
    let timer = Timer.publish(every: 1, on: .main, in: .default)
    var cancellable: AnyCancellable?
    
    @Published var time: String = "52"
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "da"
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
        
        cancellable = timer
            .autoconnect()
            .map { $0.description }
            .assign(to: \.time, on: self)
        
        $time
            .map { $0.description }
            .assign(to: \.text, on: label)
//        timer
//            .map { $0.description }
//            .assign(to: \.text, on: label)
//        $time
//            .map { $0 }
//            .assign(to: \.text, on: label)
    }
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
