
import SwiftUI

struct iPadView: View {
    var body: some View {
        NavigationView {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        .navigationViewStyle(.stack)
    }
}

struct iPadView_Previews: PreviewProvider {
    static var previews: some View {
        iPadView()
    }
}
