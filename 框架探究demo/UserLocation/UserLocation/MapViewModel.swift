//
//  MapViewModel.swift
//  UserLocation
//
//  Created by Changjun Li on 2023/3/30.
//

import MapKit
import SwiftUI

enum MapDetails {
    static let startingLocation = CLLocationCoordinate2D(latitude: 39.916527, longitude: 116.397128)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.003, longitudeDelta: 0.003)
    static let defaultRegion = MKCoordinateRegion(
        center: MapDetails.startingLocation,
        span: MapDetails.defaultSpan)
}

class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    // 地图初始定位
    @Published var region =  MapDetails.defaultRegion

    /// The manager interfacing with Core Location.
    var locationManager: CLLocationManager?
    
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            //when CLLocation manager is created it fires delegate 'locationManagerDidChangeAuthorization' event.
            locationManager!.delegate = self

        } else {
            print("Show an alert letting them this ")
        }
    }
    
    // 检查与警告提醒
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else { return }
        
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location is restricted likely due to parental controls")
        case .denied:
            print("You haver denied this app location permission. Go into settings to change it")
        case .authorizedAlways, .authorizedWhenInUse:
            startRecordingLocation()
        @unknown default:
            break
        }
    }
    
    // 属于NSObject协议，在声明CLLocationManager()的时候默认调用该方法
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
    func startRecordingLocation() {
        region = MKCoordinateRegion(center: locationManager!.location!.coordinate, span: MapDetails.defaultSpan)
        /// 后台更新
        locationManager!.allowsBackgroundLocationUpdates = true
        //定位精度
        locationManager!.desiredAccuracy = kCLLocationAccuracyBest
        /// 活动模式
        locationManager!.activityType = .fitness
        /// 自动暂停定位更新
        locationManager!.pausesLocationUpdatesAutomatically = false
        /// 开始定位
        locationManager!.startUpdatingLocation()
    }
    
}
