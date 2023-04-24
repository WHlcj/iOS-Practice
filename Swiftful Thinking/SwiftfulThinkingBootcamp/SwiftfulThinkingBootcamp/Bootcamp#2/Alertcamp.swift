//
//  Alertcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/25.
//

import SwiftUI

struct Alertcamp: View {
    
    @State var showAlert = false
    @State var alertType: MyAlerts? = nil
//    @State var alertTitle = ""
//    @State var alertMessage = ""
    @State var backgroundColor = Color.yellow
    
    enum MyAlerts {
        case success
        case error
    }
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()
            
            VStack {
                Button("Button 1") {
                    alertType = .error
//                    alertTitle = "ERROR UPLOADING VIDEO"
//                    alertMessage = "The video could not be uploaded"
                    showAlert.toggle()
                }
                
                Button("Button 2") {
                    alertType = .success
                    showAlert.toggle()
                }
            }
            .alert("Title", isPresented: $showAlert, actions: {
                Text("你确定要退出吗？")
                Button(role: .destructive) {
                    
                } label: {
                    Text("退出登录")
                }
                Button(role: .cancel) {
                    
                } label: {
                    Text("确定2")
                }
            }, message: {
                Text("This is the message")
            })
//                .alert(isPresented: $showAlert, content: {
//                    getAlert()
//            })
        }
    }
    
    func getAlert() -> Alert {
        switch alertType {
        case .error:
            return Alert(title: Text("There was an error!"))
        case .success:
            return Alert(title: Text("This was a success!"), message: Text("this is the message"), dismissButton: .default(Text("OK"), action: {
                backgroundColor = .green
            }))
        default:
            return Alert(title: Text("ERROR"))
        }
        
//        Alert(
//            title: Text(alertTitle),
//            message: Text(alertMessage),
//            dismissButton: .default(Text("OK"))
//        )
        
//        Alert(
//            title: Text("通知"),
//            message: Text("你确定要退出登录吗？"),
//            primaryButton: .destructive(Text("Continue"), action: {
//                backgroundColor = .red
//            }),
//            secondaryButton: .cancel())
    }
}

struct Alertcamp_Previews: PreviewProvider {
    static var previews: some View {
        Alertcamp()
    }
}
