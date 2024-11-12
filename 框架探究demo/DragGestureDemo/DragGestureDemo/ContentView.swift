
import SwiftUI

struct ContentView: View {
    
    @State var offset: CGSize = .zero //表示视图被拖动的距离
    
    var body: some View {
        let dragGesture = DragGesture() //初始化一个拖动手势，该手势一旦识别到手指拖动的触摸事件，就会调用手势的状态变化事件
            .onChanged { (value) in
                print(value.startLocation, value.location, value.translation)
                self.offset = value.translation
            }
            .onEnded { (value) in
                if(abs(value.translation.width) >= 40 || abs(value.translation.height + 260) >= 40){ //如果被拖动的视图，距离目标视图的位置较远，则返回原来的位置
                    self.offset = .zero
                }
                else{ //如果被拖动的视图，距离目标视图的位置较近，则将被拖动的视图，放置在目标视图的位置
                    self.offset = CGSize(width: 0, height: -260)
                }
            }
        
        return VStack{
            Circle()
                .fill(Color.black)
                .opacity(0.1)
                .frame(width: 200, height: 200)
                .offset(CGSize(width: 0, height: -50))
            
            Circle()
                .fill(Color.orange)
                .frame(width: 200, height: 200)
                .offset(offset)
                .gesture(dragGesture)
                .animation(.spring(), value: offset)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
