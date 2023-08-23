
import SwiftUI

struct StopSliderView: View {
    
    @Binding var value: Double

    
    @State var lastCoordinateValue: CGFloat = 0.0
    
    var sliderRange: ClosedRange<Double> = 1...50
    
    var body: some View {
        GeometryReader { gr in
            let thumbSize = gr.size.width * 0.8
            let radius = gr.size.width * 0.5
            let minValue = gr.size.height * 0.015
            let maxValue = (gr.size.height * 0.98) - thumbSize
            
            let scaleFactor = (maxValue - minValue) / (sliderRange.upperBound - sliderRange.lowerBound)
            let lower = sliderRange.lowerBound
            let sliderVal = (self.value - lower) * scaleFactor + minValue
            
            ZStack {
                RoundedRectangle(cornerRadius: radius)
                    .fill(.ultraThinMaterial)

                VStack {
                        Circle()
                            .fill(.red)
                            .frame(width: thumbSize, height: thumbSize)
                        .offset(y: sliderVal)
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged { v in
                                    // 让滑条可以向前滑动
                                    if (abs(v.translation.height) < 0.1) {
                                        self.lastCoordinateValue = sliderVal
                                    }
                                    if v.translation.height > 0 {
                                        let nextCoordinateValue = min(maxValue, self.lastCoordinateValue + v.translation.height)
                                        value = ((nextCoordinateValue - minValue) / scaleFactor)  + lower
                                    // 下面的代码可以让滑条向后滑动
                                    } else {
                                        let nextCoordinateValue = max(minValue, self.lastCoordinateValue + v.translation.height)
                                        value = ((nextCoordinateValue - minValue) / scaleFactor) + lower
                                    }
                                }
                                
                        )
                    Spacer()
                }
            }
        }
    }
}

struct StopSliderView_Previews: PreviewProvider {
    static var previews: some View {
        @State var number = 1.0
        ZStack {
            //background
            Color.cyan
            
            VStack {
                Text("当前的值为: \(number)")
                    .font(.title)
                StopSliderView(value: $number)
                    .frame(width: 50, height: 300)
            }
        }
    }
}
