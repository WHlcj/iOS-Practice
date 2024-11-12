import UIKit
import Photos
import CoreLocation
import MapKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var mapView: MKMapView!
    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapView()
        setupLocationManager()
        setupSelectPhotoButton()
        if CLLocationManager.authorizationStatus() == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func setupMapView() {
        mapView = MKMapView(frame: view.bounds)
        view.addSubview(mapView)
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.showsUserTrackingButton = true
    }

    func setupLocationManager() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        print("开始上传")
        locationManager.startUpdatingHeading() // 启动方向更新
    }
    
    // 检查授权状态
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            print("已授权使用位置信息")
            locationManager.startUpdatingLocation()
        case .denied:
            print("用户拒绝了位置授权")
        case .notDetermined:
            print("尚未请求位置授权")
        case .restricted:
            print("访问受限，无法获取位置信息")
        @unknown default:
            print("未知授权状态")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            print("没有获取到位置信息")
            return
        }
        print("位置信息更新为: \(location.coordinate.latitude), \(location.coordinate.longitude)")
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        print("地图信息更新为: \(userLocation.coordinate.latitude), \(userLocation.coordinate.longitude)")
        // 移动地图中心到用户位置
        let span = MKCoordinateSpan(latitudeDelta: 0.006, longitudeDelta: 0.006)
        let region = MKCoordinateRegion(center: userLocation.coordinate, span: span)
        self.mapView.setUserTrackingMode(.follow, animated: true)
//        self.mapView.map.setRegion(region, animated: true)
    }
    
    // 设置按钮
    func setupSelectPhotoButton() {
        let selectPhotoButton = UIButton(type: .system)
        selectPhotoButton.setTitle("选择照片", for: .normal)
        selectPhotoButton.addTarget(self, action: #selector(openPhotoLibrary), for: .touchUpInside)
        selectPhotoButton.frame = CGRect(x: 20, y: 50, width: 100, height: 40)
        view.addSubview(selectPhotoButton)
    }
    
    // 打开相册
    @objc func openPhotoLibrary() {
        guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else { return }
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    
    // 处理选中的照片
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        dismiss(animated: true, completion: nil)
        
        if let asset = info[.phAsset] as? PHAsset {
            extractPhotoCoordinates(from: asset)
        } else if let assetURL = info[.referenceURL] as? URL {
            let fetchResult = PHAsset.fetchAssets(withALAssetURLs: [assetURL], options: nil)
            if let asset = fetchResult.firstObject {
                extractPhotoCoordinates(from: asset)
            } else {
                print("未能找到照片的 PHAsset")
            }
        } else {
            print("未能获取到照片资源")
        }
    }
    
    // 提取照片中的经纬度信息
    func extractPhotoCoordinates(from asset: PHAsset) {
        guard let location = asset.location else {
            print("照片没有位置信息")
            return
        }
        
        let coordinate = location.coordinate
        print("照片中的经纬度: \(coordinate.latitude), \(coordinate.longitude)")
    }
}
