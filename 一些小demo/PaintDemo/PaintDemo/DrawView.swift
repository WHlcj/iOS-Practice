
import SwiftUI
import PencilKit

struct DrawView: UIViewRepresentable {
    // 传入画板
    @Binding var canvas: PKCanvasView
    // 切换画图工具和橡皮擦
    @Binding var isDrawing: Bool
    // 切换画图工具
    @Binding var type: PKInkingTool.InkType
    // 颜色选择
    @Binding var color: Color
    // 线条宽度
    @Binding var lineWidth: Double
    
    let eraser = PKEraserTool(.bitmap) // 橡皮擦
    
    var ink: PKInkingTool {
        PKInkingTool(type, color: UIColor(color), width: lineWidth)
    }
    
    /// Creates the view object and configures its initial state.
    func makeUIView(context: Context) -> PKCanvasView {
        canvas.drawingPolicy = .anyInput
        canvas.tool = isDrawing ? ink : eraser
        return canvas
    }
    
    /// Updates the state of the specified view with new information from SwiftUI.
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.tool = isDrawing ? ink : eraser
    }
    
}
