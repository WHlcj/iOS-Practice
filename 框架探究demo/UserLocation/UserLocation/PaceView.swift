import SwiftUI
import CoreMotion

struct PaceView: View {

    @State private var stepCount: Int = 0 // 步数
    
    @State private var lastUpdate: Date? = nil // 最后更新时间

    let motionManager = CMMotionManager()
    let pedometer = CMPedometer()

    var body: some View {
        VStack {
            Text("Step Count: \(stepCount)")
        }
        .onAppear {
            startPedometerUpdates()
        }
    }

    func startPedometerUpdates() { // 开始获取计步数据
        guard CMPedometer.isStepCountingAvailable() else { // 判断 CMPedometer 是否可用
            print("Pedometer data is not available on this device.")
            return
        }
        pedometer.startUpdates(from: Date(), withHandler: { pedometerData, error in // 开始获取计步数据
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
}

struct PaceView_Previews: PreviewProvider {
    static var previews: some View {
        PaceView()
    }
}
