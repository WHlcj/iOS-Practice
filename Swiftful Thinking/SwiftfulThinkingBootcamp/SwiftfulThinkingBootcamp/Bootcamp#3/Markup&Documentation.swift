
import SwiftUI

struct Markup_Documentation: View {

    
    // MARK: Properties
    @State var data: [String] = [
        "Apple", "Orange", "Bananas"
    ]
    @State var showAlert = false
    
    
    // MARK: Body
    
    // ELEE - Working copy - things to do:
    /*
     1) Fix title
     2) Fix alert
     3) Fix something else
     */
    
    var body: some View {
        NavigationView { // START: NAV
            
            ZStack {
                // background
                Color.red.ignoresSafeArea()
                
                // foreground
                foregroundLayer
                .navigationTitle("Documentation")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Alert", action: {
                            showAlert.toggle()
                        })
                    }
                }
                .alert(isPresented: $showAlert) {
                    getAlert(text: "This is a alert!")
                }
            }
        } // END: NAV
    }
    
    /// This is the foreground layer that holds scrollView
    private var foregroundLayer: some View {
        ScrollView { // START: SCROLLV
            Text("Hello")
            ForEach(data, id: \.self) { name in
                Text(name)
                    .font(.headline)
            }
        } // END: SCROLLV
    }
    
    // MARK: Functions
    /// Gets an alert with a specified title.
    ///
    ///This function creates and returns an alert immediately. The alert will have a title based on the text parameter but it will NOT have a message.
    ///```
    ///getAlert(text:"Hi") -> Alert(title: Text("Hi"))
    ///```
    ///
    /// - Warning: There is no additional message in this Alert.
    /// - Parameter text: This is the title for the alert.
    /// - Returns: Returns an alert with a title.
    func getAlert(text: String) -> Alert {
        return Alert(title: Text(text))
    }
    
}

    // MARK: Preview
struct Markup_Documentation_Previews: PreviewProvider {
    static var previews: some View {
        Markup_Documentation()
    }
}
