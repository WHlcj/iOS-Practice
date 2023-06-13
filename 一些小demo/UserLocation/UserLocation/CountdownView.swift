import SwiftUI

struct CountdownView: View {
    
    @State private var count = 3
    @State private var countDownInfo = ""
    
    var body: some View {
        ZStack {
            Color.green.edgesIgnoringSafeArea(.all)
            Text(countDownInfo)
                .font(.system(size: 200, weight: .bold))
                .foregroundColor(.white)
                .scaleEffect(1.0 + CGFloat(count) * 0.2)
                .onAppear() {
                    Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                        countDownInfo = "\(count)"
                        if self.count >= 1 {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.1, blendDuration: 1)) {
                                self.count -= 1
                            }
                        } else {
                            countDownInfo = "GO!"
                            timer.invalidate()
                        }
                    }
                }
        }
    }
}

struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView()
    }
}
