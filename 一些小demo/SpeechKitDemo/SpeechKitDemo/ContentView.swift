
import SwiftUI
import SwiftSpeech

struct ContentView: View {
    
    var locale = Locale(identifier: "zh-CN")
    
    @State var text = "say somthing"
    
    var body: some View {
        VStack(spacing: 50) {
            Text(text)
                .font(.system(size: 25, weight: .bold, design: .default))
            SwiftSpeech.RecordButton()
                .swiftSpeechToggleRecordingOnTap(locale: locale)
                .onRecognizeLatest(update: $text)
        }
        .padding()
        .onAppear {
            SwiftSpeech.requestSpeechRecognitionAuthorization()
            print(locale)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
