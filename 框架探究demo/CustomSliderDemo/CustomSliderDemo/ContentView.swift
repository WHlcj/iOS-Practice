import SwiftUI

struct ContentView: View {

    @State private var number = 15.0

    var body: some View {
        VStack(spacing: 10) {
            Text("Number\n\(number)")
                .bold()
                .padding(.bottom, 20)
        
            Text("OS Slider")
            Slider(value: $number, in: 0...100, step: 0.02)
                .padding(.bottom, 20)
        
            Text("Custom Slider")

            StopSliderView(value: $number)
                .frame(width: 50, height: 300)
            
        }
        .padding(20)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
