//
//  SetApp.swift
//  Set
//
//  Created by Changjun Li on 2022/12/18.
//

import SwiftUI

@main
struct SetApp: App {
    var body: some Scene {
        WindowGroup {
            SetGameView(game: SoloSetGame())
        }
    }
}
