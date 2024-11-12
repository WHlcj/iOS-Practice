
import SwiftUI

struct SettingView: View {
    @Binding var path: NavigationPath
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 30) {
            Text("这是设置页面")
            Button {
                path.removeLast(1)
            } label: {
                Text("path.remove: Go back")
            }
            Button {
                dismiss()
            } label: {
                Text("dismiss: Go back")
            }

            Button {
                path.removeLast(path.count)
            } label: {
                Text("Go to root")
            }

        }
        .onAppear {
            print("现在是SettingView,path的数量是\(path.count)")
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        @State var path = NavigationPath()
        SettingView(path: $path)
    }
}
