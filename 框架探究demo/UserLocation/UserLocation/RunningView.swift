/*
  北京: latitude:39.916527,longitude:116.397128
 */

/*
 TO DO:
 1. UI美化工作
 */
import SwiftUI
import MapKit

struct RunningView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var vm = MKMapViewModel()

    var body: some View {
        ZStack {
            MapView(mapView: vm.mapView)
                .ignoresSafeArea()
                .onAppear {
                    vm.startRunning()
                }
            VStack {
                runningInfo
                Spacer()
                runningButton
            }
        }
    }
    
    var runningInfo: some View {
        HStack(alignment: .bottom) {
            VStack(spacing: 13) {
                Text(FormatDisplay.distance(vm.distance))
                    .font(.title)
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                Text("已跑公里")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            .frame(maxWidth: 100)
            Divider()
            infoCell(info: FormatDisplay.time(vm.seconds), title: "时长")
                .frame(width: 100)
            infoCell(info: FormatDisplay.speed(distance: vm.distance, seconds: vm.seconds), title: "配速")
            infoCell(info: "121", title: "步频")
        }
        .frame(height: 50)
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.horizontal)
        .padding(.bottom, 20)
        .background(
            Color.white
        )
    }
    
    func infoCell(info: String, title: String) -> some View {
        VStack(spacing: 13) {
            Text(info)
                .font(.title2)
                .fontWeight(.medium)
                .foregroundColor(.black)
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: 100)

    }
    
    var runningButton: some View {
        VStack {
            switch vm.currentState {
            case .Running:
                Button("暂停") {
                    vm.stopRunning()
                }
            case .Pause:
                HStack {
                    Button("继续") {
                        vm.startRunning()
                    }
                    Button("结束") {
                        vm.stopRunning()
                        dismiss()
                    }
                }
            case .Preparing:
                Text("isPrepared")
            case .Ending:
                Text("isEnded")
            }
        }
    }
    
}

struct RunningView_Previews: PreviewProvider {
    static var previews: some View {
        RunningView()
    }
}
