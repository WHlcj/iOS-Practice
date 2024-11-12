
import Foundation

// 画图请求
struct ImageRequestData: Decodable {
    let data: TaskId
}

struct TaskId: Decodable {
    let taskId: Int
}


// 返回图片请求
struct BackImage: Decodable {
    let data: ImageUrl
}

struct ImageUrl: Decodable {
    let img: String
}
