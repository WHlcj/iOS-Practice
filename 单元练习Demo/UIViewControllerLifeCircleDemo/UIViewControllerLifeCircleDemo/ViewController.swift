import UIKit

class ViewController: UIViewController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        print("0-0 init(nibName:) - 非storyBoard(xib或非xib)都走这个方法")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("0-1. init(coder:) - 连接了串联图storyBoard的初始化方法")
    }

    override func loadView() {
        super.loadView()
        print("2. loadView - 视图控制器加载视图")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("3. viewDidLoad - 视图加载完成")
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("4. viewWillAppear - 视图即将出现")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        print("5. viewWillLayoutSubviews - 视图即将布局子视图")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        print("6. viewDidLayoutSubviews - 视图布局子视图完成")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("7. viewDidAppear - 视图已出现")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("8. viewWillDisappear - 视图即将消失")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("9. viewDidDisappear - 视图已消失")
    }
    
    deinit {
        print("10. deinit - 视图控制器已被释放")
    }
}
