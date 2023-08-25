
import SwiftUI

struct PathDrawingDemo: View {
    // 画画笔迹
    @State var lines: [DrawingLine] = []
    // 当前画画的线(用于返回上一步)
    @State var currentLine = DrawingLine()
    // 画笔的粗细
    @State var lineWidth = 1.0
    // 画笔的颜色
    @State var currentColor = Color.green
    // pathes依次记录每一步画画起点和终点的位置，目的是实现画画回退
    @State var pathes: [Int] = []
    // 画画起点和终点路径标记
    @State var startIndex = 0
    @State var endIndex = 0
    @State var startAddLine = false
    
    var body: some View {
        VStack {
            topBar
            drawingBoard
            bottomBar
        }
    }
}

// MARK: - Compinents

extension PathDrawingDemo {
    /// 顶部按钮区
    var topBar: some View {
        HStack {
            // 清空画板
            Button("清空") { self.lines = [] }
            // 保存图片到相册
            Button { drawingBoard.snapshot() } label: {
                Image(systemName: "square.and.arrow.down.fill")
            }
            Spacer()
            // 清除最后一次笔迹
            Button {
                removeLastPath()
            } label: {
                Image(systemName: "arrow.counterclockwise")
            }
        }
        .padding(.horizontal, 40)
    }
    /// 画板
    var drawingBoard: some View {
        Canvas { context, _ in
            for line in lines {
                var path = Path()
                path.addLines(line.point)
                context.stroke(path, with: .color(line.color), lineWidth: line.lineWidth)
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 4/5)
        .gesture(
            DragGesture(minimumDistance: 0, coordinateSpace: .local)
                .onChanged { value in
                    let newLocation = value.location
                    // 开始画画时，记录起点位置index
                    if !startAddLine {
                        startIndex = lines.endIndex
                        pathes.append(startIndex)
                        startAddLine = true
                    } else {
                        currentLine.point.append(newLocation)
                        lines.append(currentLine)
                    }
                }
                .onEnded { value in
                    lines.append(currentLine)
                    currentLine = DrawingLine(lineWidth: lineWidth, color: currentColor)
                    // 结束画画时，记录终点位置index
                    endIndex = lines.endIndex
                    pathes.append(endIndex)
                    startAddLine = false
                }
        )
    }
    /// 底部按钮区
    var bottomBar: some View {
        HStack {
            // 线段粗细选择滑条
            Slider(value: $lineWidth, in: 1...30)
                .onChange(of: lineWidth) { newValue in
                    currentLine.lineWidth  = newValue
                }
            Divider().frame(height: 15)
            // 颜色选择
            ColorPicker(selection: $currentColor) {}
                .frame(width: 80)
                .onChange(of: currentColor) { newValue in
                    currentLine.color = newValue
                }
        }
        .padding(.horizontal, 40)
    }
}

// MARK: - Functions

extension PathDrawingDemo {
    /// 清除最后一次画笔的笔迹
    private func removeLastPath() {
        if !pathes.isEmpty {
            let startIndex = pathes[pathes.count - 2] + 1
            let endIndex = pathes[pathes.count - 1]
            lines.removeLast(endIndex-startIndex)
            pathes.removeLast(2)
        }
    }
}

extension View {
    /// 画板截图，保存至手机相册
    func snapshot() {
        let controller = UIHostingController(rootView: self)
        let view = controller.view
        
        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear
        
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        
        let image = renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
}

struct PathDrawingDemo_Previews: PreviewProvider {
    static var previews: some View {
        PathDrawingDemo()
    }
}
