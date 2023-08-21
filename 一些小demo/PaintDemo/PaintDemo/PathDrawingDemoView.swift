
import SwiftUI

struct DrawingLine {
    var point = [CGPoint]()
    var lineWidth = 1.0
    var color = Color.green
}

struct PathDrawingDemoView: View {
    // 画画笔迹
    @State var lines: [DrawingLine] = []
    // 当前画画的线(用于返回上一步)
    @State var currentLine = DrawingLine()
    // 画笔的粗细
    @State var lineWidth = 1.0
    // 画笔的颜色
    @State var currentColor = Color.green
    
    var body: some View {
        VStack {
            Canvas { context, _ in
                for line in lines {
                    var path = Path()
                    path.addLines(line.point)
                    context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
                }
            }
           // .frame(height: 600)
            .gesture(
                DragGesture(minimumDistance: 0, coordinateSpace: .local)
                    .onChanged { value in
                        let newLocation = value.location
                        currentLine.point.append(newLocation)
                        lines.append(currentLine)
                    }
                    .onEnded { value in
                        lines.append(currentLine)
                        currentLine = DrawingLine(lineWidth: lineWidth, color: currentColor)
                    }
            )
            .background(Color.gray.opacity(0.4))
            buttons
        }
    }
}

// MARK: - 功能按钮

extension PathDrawingDemoView {
    /// 底部按钮区
    var buttons: some View {
        HStack {
            /// 线段粗细选择滑条
            Slider(value: $lineWidth, in: 1...30)
                .onChange(of: lineWidth) { newValue in
                    currentLine.lineWidth  = newValue
                }
            Divider()
                .frame(height: 15)
            // 颜色选择
            ColorPicker(selection: $currentColor) {}
                .frame(width: 30)
            .onChange(of: currentColor) { newValue in
                currentLine.color = newValue
            }
            Divider()
                .frame(height: 15)
            Button("保存") {
                let image = body.snapshot()
                UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                //self.currentLine = DrawingLine()
            }
            Divider()
                .frame(height: 15)
            Button("清空") {
                self.lines = []
            }
        }
        .padding(.horizontal)
    }
}

extension View {
    // 屏幕截图
    func snapshot() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view
        
        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear
        
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        
        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
            
        }
    }
}

struct PathDrawingDemoView_Previews: PreviewProvider {
    static var previews: some View {
        PathDrawingDemoView()
    }
}
