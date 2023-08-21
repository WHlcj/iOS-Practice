
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    // 是否结束输入数字字符
    private var isFinishedTypingNumber = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cannot convert display label text to a Double")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
        
    }
    
    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)

        if let calcMethod = sender.currentTitle {

            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
        }
    }

    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let newValue = sender.currentTitle {
            
            if isFinishedTypingNumber {
                displayLabel.text = newValue
                isFinishedTypingNumber = false
            } else {
                if newValue == "." {
  
                    let isInt = floor(displayValue) == displayValue
                    // 如果不是整数，则直接返回，不再增加小数点"."
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + newValue
            }
        }
    }

}

