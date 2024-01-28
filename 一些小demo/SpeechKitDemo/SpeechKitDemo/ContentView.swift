
import SwiftUI
import SwiftSpeech

struct ContentView: View {
    
    @State var text = "say somthing"
    @State var backgroundColor = Color.cyan
    
    var body: some View {
        ZStack {
            backgroundColor
            
            VStack(spacing: 50) {
                Text(text)
                    .font(.system(size: 25, weight: .bold, design: .default))
                
                SwiftSpeech.RecordButton()
                    .swiftSpeechToggleRecordingOnTap(locale: Locale(identifier: "zh-CN"))
                    .onRecognizeLatest(update: $text)
            }
        }
        .padding()
        .onAppear {
            SwiftSpeech.requestSpeechRecognitionAuthorization()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
