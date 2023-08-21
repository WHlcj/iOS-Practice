
import SwiftUI
import PencilKit

struct PencilKitDemoView: View {
    // 画板
    @State var canvas = PKCanvasView()
    // 默认能够画画
    @State var isDrawing = true
    // 选择的颜色
    @State var currentColor = Color.green
    // 跳出选色器
    @State var shouldShowAlert = false
    // 画笔类型
    @State var tool = PKInkingTool.InkType.pen
    // 线条宽度
    @State var lineWidth = 1.0
    
    var body: some View {
        NavigationStack {
            customTopBar
            DrawView(canvas: $canvas, isDrawing: $isDrawing, type: $tool, color: $currentColor, lineWidth: $lineWidth)
            custiomBottomBar
        }
    }
    
    private func saveImage() {
        UIImageWriteToSavedPhotosAlbum(self.canvas.drawing.image(from: canvas.bounds, scale: 1), nil, nil, nil)
    }
}

// MARK: - 功能按钮

extension PencilKitDemoView {
    /// 顶部功能栏
    var customTopBar: some View {
        HStack {
            // 清空按钮
            DrawingToolButton(title: "清空") {
                canvas.drawing = PKDrawing()
            }
            // 保存按钮
            DrawingToolButton(icon: "square.and.arrow.down.fill") {
                saveImage()
            }
            Spacer()
            // 切换橡皮擦按钮
            DrawingToolButton(icon: "eraser") {
                isDrawing = false
            }
            functionMenu
        }
        .padding(.horizontal)
    }
    /// 功能菜单
    var functionMenu: some View {
        Menu {
            // 切换画图工具到铅笔
            DrawingToolButton(title: "铅笔", icon: "pencil") {
                tool = .pencil
                isDrawing = true
            }
            // 切换画图工具到钢笔
            DrawingToolButton(title: "钢笔", icon: "pencil.tip") {
                tool = .pen
                isDrawing = true
            }
            // 切换画图工具到标记笔
            DrawingToolButton(title: "标记笔", icon: "pencil.tip.crop.circle") {
                tool = .marker
                isDrawing = true
            }
        } label: { // Menu的label
            Image(systemName: "ellipsis")
                .rotationEffect(.degrees(90))
        }
    }
    
    struct DrawingToolButton: View {
        
        var title: String = ""
        var icon: String = ""
        let active: () -> Void
        
        var body: some View {
            Button {
                active()
            } label: {
                Label{Text(title)} icon: { Image(systemName: icon)}
            }
        }
    }
    /// 底部功能栏
    var custiomBottomBar: some View {
        HStack {
            Spacer()
            Text("线条粗细:")
            Slider(value: $lineWidth, in: 1...50)
            ColorPicker(selection: $currentColor, label: {})
                .frame(width: 50)
        }
        .padding(.horizontal)
    }
}

struct PencilKitDemoView_Previews: PreviewProvider {
    static var previews: some View {
        PencilKitDemoView()
    }
}
