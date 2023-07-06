
import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Whlcj")
                    .font(.custom("AnnieUseYourTelescope-Regular", size: 40))
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}








// AnnieUseYourTelescope-Regular
// Pacifico-Regular


//.previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro"))
//.previewLayout(.sizeThatFits)
