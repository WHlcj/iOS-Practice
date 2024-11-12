
import SwiftUI

struct ContentView: View {
    @State var view: AppRouter
    @Binding var path: NavigationPath
    
    var body: some View {
        switch view {
        case .LoginView:
            LoginView(path: path)
        case .HomeView:
            HomeView(path: $path)
        case .SettingView:
            SettingView(path: $path)
        case .ProfileView:
            ProfileView(path: $path)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        @State var path = NavigationPath()
        @State var view = AppRouter.LoginView
        ContentView(view: view, path: $path)
    }
}
