
import SwiftUI

struct TextToImageView: View {
    
    @StateObject var vm = VoiceToImageManager()
    // 文字描述
    @State var text = ""
    
    var body: some View {
        VStack {
            
            TextField("请输入文字生成图片", text: $text)
                .padding()
                .background(.gray.opacity(0.3))
                .padding()
            Button {
                vm.performAskImage(text: text)
            } label: {
                Text("请求")
            }
            
            AsyncImage(url: URL(string: vm.img)) { image in
                image
                    .resizable()// 适应屏幕尺寸
                    .aspectRatio(1, contentMode: .fit)
            } placeholder: {
                Color.gray.opacity(0.3)
                    .overlay(ProgressView())
            }
            .frame(width: 400, height: 400)
            .cornerRadius(20)
            .overlay(RoundedRectangle(cornerRadius: 20).stroke(.purple, lineWidth: 1))
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TextToImageView()
    }
}
