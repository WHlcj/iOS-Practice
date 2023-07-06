
import SwiftUI

struct HomeView: View {
    @Binding var path: NavigationPath
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 30) {
            Text("这是HomeView")
            Button {
                path.removeLast(1)
            } label: {
                Text("path.removeLast(1): Go back")
            }
            
            Button {
                print("离开前HomeView,path的数量是\(path.count)")
                dismiss()
            } label: {
                Text("dismiss: Go back")
            }
            
            NavigationLink(value: AppRouter.SettingView) {
                Text("NavigationLink: Go to SettingView")
            }

            NavigationLink(value: AppRouter.ProfileView) {
                Text("NavigationLink: Go to ProfileView")
            }
        }
        .onAppear {
            print("现在是HomeView,path的数量是\(path.count)")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        @State var path = NavigationPath()
        HomeView(path: $path)
    }
}
