import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {

    var mapView = MKMapView()
    
    func makeUIView(context: Context) -> MKMapView {
        let region = MapDetails.defaultRegion
        mapView.setRegion(region, animated: true)
        mapView.showsUserLocation = true
        mapView.showsCompass = true
       // mapView.delegate = context.coordinator
        return mapView
    }
    
    // 在updateUIView方法中更新地图视图
    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.showsUserLocation = true
    }
    
//    func makeCoordinator() -> MKMapViewModel {
//        MKMapViewModel()
//    }
}
