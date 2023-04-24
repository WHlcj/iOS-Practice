//
//  ActionSheetcamp.swift
//  SwiftfulThinkingBootcamp
//
//  Created by Changjun Li on 2023/2/26.
//

import SwiftUI

struct ActionSheetcamp: View {
    
    @State var showActionSheet = false
    let title = "This is the title"
    
    var body: some View {
        Button("ActionSheetcamp") {
            showActionSheet.toggle()
        }
        .confirmationDialog(
            title,
            isPresented: $showActionSheet,
            titleVisibility: .visible,
            actions: {
                Button("Default") {
                    
                }
                
                Button("Empty Trash", role: .destructive) {
                    // Handle empty trash action.
                }
                
                Button("Cancel", role: .cancel) {
                    showActionSheet = false
                }
            },
            message: {
            Text("This is the message")
        })
    }
    
    func getActionSheet() -> ActionSheet {
        //return ActionSheet(title: Text("This is the massage"))
        
        let button1: ActionSheet.Button = .default(Text("Default"))
        let button2: ActionSheet.Button = .destructive(Text("Default"))
        let button3: ActionSheet.Button = .cancel(Text("Default"))
        
        return ActionSheet(
            title: Text("This is the message"),
            message: Text("This is the message"),
            buttons: [button1, button2, button3]
        )
    }
    
}

struct TestAction: View {
    
    @State var showActionSheet = false
    @State var actionSheetOption: ActionSheetOptions = .isOtherPost
    
    enum ActionSheetOptions {
        case isMyPost
        case isOtherPost
    }
    
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .frame(width: 60, height: 60)
                Text("@username")
                Spacer()
                Button(action: {
                    actionSheetOption = .isOtherPost
                    showActionSheet.toggle()
                }, label: {
                    Image(systemName: "ellipsis")
                })
                .tint(.primary)
            }
            
            .padding(.horizontal)
            
            Rectangle()
                .aspectRatio(1.0, contentMode: .fit)
        }
        .actionSheet(isPresented: $showActionSheet, content: getActionSheet)
    }
    
    func getActionSheet() -> ActionSheet {
//        let button1: ActionSheet.Button = .default(Text("Default"))
//        let button2: ActionSheet.Button = .destructive(Text("Destructive"))
//        let button3: ActionSheet.Button = .cancel(Text("Cancel"))
//
//        return ActionSheet(
//            title: Text("This is the title"),
//            message: Text("This is the message"),
//            buttons: [button1, button2, button3]
//        )
        
        let shareButton: ActionSheet.Button = .default(Text("Share")) {
            // add code to share post
        }
        let reportButton: ActionSheet.Button = .destructive(Text("Report")) {
            // add code to report post
        }
        let deleteButton: ActionSheet.Button = .destructive(Text("Delete"), action: {
            // add code to delete this post
        })
        let cancelButton: ActionSheet.Button = .cancel()
        let title = Text("What you like to do?")
        
        switch actionSheetOption {
            case .isOtherPost:
                return ActionSheet(
                    title: title,
                    message: nil,
                    buttons: [shareButton, reportButton, cancelButton])
        case .isMyPost:
            return ActionSheet(
                title: title,
                message: nil,
                buttons: [shareButton, deleteButton, cancelButton])
        }
        
    }
}

struct ActionSheetcamp_Previews: PreviewProvider {
    static var previews: some View {
        ActionSheetcamp()
        TestAction()
    }
}
