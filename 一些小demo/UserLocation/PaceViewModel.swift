
import Foundation
import CoreMotion

class PaceViewModel: ObservableObject {
    
    private var stepCount = 0
    private var startTime = Date()
    private var lastUpdate: Date? = nil
    private let pedometer = CMPedometer()
    
    func startPedometerUpdates() {
        self.startTime = Date()
        guard CMPedometer.isStepCountingAvailable() else { // 判断 CMPedometer 是否可用
            print("Pedometer data is not available on this device.")
            return
        }
        self.pedometer.startUpdates(from: startTime, withHandler: { pedometerData, error in
            if let data = pedometerData { // 判断获取数据是否成功
                self.stepCount = data.numberOfSteps.intValue // 更新步数
                if let lastUpdate = self.lastUpdate { // 获取最后更新时间
                    let interval = data.endDate.timeIntervalSince(lastUpdate) // 计算时间间隔
                    let stepFrequency = Int(Double(data.numberOfSteps.intValue) / interval) // 计算步频
                    print("Step Frequency: \(stepFrequency) steps per second") // 打印步频
                }
                self.lastUpdate = data.endDate // 更新最后更新时间
            }
            if let error = error { // 判断是否有错误
                print("Error getting pedometer data: \(error.localizedDescription)") // 打印错误信息
            }
        })
    }
    
    func stopPedoteterUpdates() {
        pedometer.stopUpdates()
    }
    
}
