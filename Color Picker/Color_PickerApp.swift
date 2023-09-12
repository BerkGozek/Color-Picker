//
//  Color_PickerApp.swift
//  Color Picker
//
//  Created by Berk Gozek on 09/09/2023.
//

import SwiftUI

@main
struct Color_PickerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(width: 250, height: 400)
                
        }
        .windowResizability(.contentSize)
        .windowStyle(HiddenTitleBarWindowStyle()) // Set a specific window style
    }
}
