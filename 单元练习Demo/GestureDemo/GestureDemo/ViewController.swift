import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 创建按钮
        let button = UIButton(type: .system)
        button.setTitle("Tap Me", for: .normal)
        button.backgroundColor = .lightGray
        button.frame = CGRect(x: 100, y: 200, width: 200, height: 50)
        self.view.addSubview(button)
        
        // 添加按钮的触摸事件
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        // 创建并添加 UITapGestureRecognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(_:)))
        tapGesture.delegate = self // 设置代理
        button.addGestureRecognizer(tapGesture)
    }
    
    @objc func buttonTapped() {
        print("Button TouchUpInside tapped")
    }
    
    @objc func handleTapGesture(_ sender: UITapGestureRecognizer) {
        print("Tap Gesture Recognized")
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        // 继续传递响应事件给响应者
        gestureRecognizer.cancelsTouchesInView = false
        print("点击了")
        return true
    }

}
