
import SwiftUI

struct LoginView: View {
    @State var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack(spacing: 30) {
                Text("这是LoginView!")
                NavigationLink(value: AppRouter.HomeView) { Text("Go to HomeView") }
                Button {
                    path.append(AppRouter.HomeView)
                    path.append(AppRouter.SettingView)
                } label: {
                    Text("Go to SettingView")
                }
            }
            .navigationDestination(for: AppRouter.self) { page in
                ContentView(view: page, path: $path)
            }
            .onAppear {
                print("现在是LoginView,path的数量是\(path.count)")
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    print("1秒后LoginView,path的数量是\(path.count)")
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
