import Foundation
import CoreMotion
import MapKit

/*
 TO DO:
 1. 获取步频信息
 */

//MARK: - 状态机
enum RunningState:Int {
    case Preparing = 1
    case Running = 2
    case Pause = 3
    case Ending = 4
}

class MKMapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate, MKMapViewDelegate {
    // 存储用户位置
    @Published var locations: [CLLocationCoordinate2D] = []
    private var pre_location: CLLocation?
    // 跑步信息
    @Published private(set) var distance = Measurement(value: 0, unit: UnitLength.meters)
    @Published private(set) var speed = 0.0
    @Published private(set) var pace = 0
    private var timer: Timer?
    @Published private(set) var seconds = 0.0
    @Published var currentState = RunningState.Running
    
    // 地图和定位管理器
    var mapView = MKMapView()
    var locationManager = CLLocationManager()
    
    func startTimer() {
        timer = Timer(timeInterval: 1, repeats: true) { _ in
            self.seconds += 1
        }
        RunLoop.current.add(timer!, forMode: .default)
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    override init() {
        super.init()
        // 设置定位管理器的代理为自身
        locationManager.delegate = self
        // 设置地图的代理为自身
        mapView.delegate = self
        // 请求用户授权
        locationManager.requestWhenInUseAuthorization()
        locationManager.allowsBackgroundLocationUpdates = true
        //自动暂停定位更新
        locationManager.pausesLocationUpdatesAutomatically = false
        //活动模式 健身
        locationManager.activityType = .fitness
        //定位精度
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        // 开始更新用户位置
        locationManager.startUpdatingLocation()
        // 启动设备方向更新（可显示指针）
        locationManager.startUpdatingHeading()
    }
    
    func startRunning() {
        // 开始计时
        startTimer()
        // 开始计步
        startPedometerUpdates()
        // 修改运动状态
        currentState = .Running
    }
    
    func stopRunning() {
        // 停止计时
        stopTimer()
        // 修改运动状态
        if currentState == .Running{
            currentState = .Pause
        } else if currentState == .Pause {
            currentState = .Ending
            // 停止运动更新
            locationManager.stopUpdatingLocation()
            // 停止计步
            pedometer.stopUpdates()
        }
    }
    
    // CLLocationManagerDelegate 协议方法，当定位管理器更新位置时调用
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        // 移动地图中心到用户位置
        let span = MKCoordinateSpan(latitudeDelta: 0.006, longitudeDelta: 0.006)
        let region = MKCoordinateRegion(center: location.coordinate, span: span)
        mapView.setRegion(region, animated: true)

        // 防止数组过大，占用内存过大，引发崩溃
        if self.locations.count > 50 {
            self.locations = []
        }
        // 计算距离
        if currentState == .Running { // 必须是跑步状态才增加distance
            for newLocation in locations {
                let howRecent = newLocation.timestamp.timeIntervalSinceNow
                guard newLocation.horizontalAccuracy < 20 && abs(howRecent) < 10 else{
                    continue }
                
                if let lastLocation = pre_location {
                    let delta = newLocation.distance(from: lastLocation)
                    distance = distance + Measurement(value: delta, unit: UnitLength.meters)
                }
                pre_location = newLocation
            }
        } else {
            self.locations = []
            pre_location = nil
        }
//        print("manager的current地址为：\(withUnsafePointer(to: currentState) { $0 })")
        // 记录用户位置并绘制路径
        self.locations.append(location.coordinate)
        let polyline = MKPolyline(coordinates: self.locations, count: self.locations.count)
        mapView.addOverlay(polyline)
    }
    
    // MKMapViewDelegate 协议方法，当地图需要渲染覆盖层时调用
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let polyline = overlay as? MKPolyline {
            // 渲染路径覆盖层
            let renderer = MKPolylineRenderer(polyline: polyline)
            if currentState == .Running { // 正在跑步时路径为绿色，否则为灰色
                renderer.strokeColor = .systemGreen
            } else {
                renderer.strokeColor = .systemGray
            }
            renderer.lineWidth = 8
//            print("mapView的current地址为：\(withUnsafePointer(to: currentState) { $0 })")
            return renderer
        }
        // 如果不是路径覆盖层则返回默认的渲染器
        return MKOverlayRenderer()
    }
    
    // MARK: 计算步频
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

}
