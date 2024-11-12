
import Foundation

struct FormatDisplay {
    static func distance(_ distance: Measurement<UnitLength>) -> String {
      let formatter = Int(distance.converted(to: .kilometers).value * 100)
      let string = String(format: "%.2f", Double(formatter) / 100)
        return string
    }
    static func time(_ seconds: Double) -> String {
      let formatter = DateComponentsFormatter()
      formatter.allowedUnits = [.hour, .minute, .second]
      formatter.unitsStyle = .positional
      formatter.zeroFormattingBehavior = .pad
      return formatter.string(from: seconds)!
    }
    // 跑步速度格式
    static func speed(distance: Measurement<UnitLength>, seconds: Double) -> String {
        let minutePerkm = distance.value == 0 ? 0 : (seconds / 60.0) / distance.converted(to: .kilometers).value
        let IntKm = Int(minutePerkm)
        let DoubleKm = Int((minutePerkm - Double(IntKm))*100)
        return "\(IntKm)'\(DoubleKm)''"
    }
}
