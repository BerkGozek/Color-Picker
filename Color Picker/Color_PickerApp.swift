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
                .frame(width: 200, height: 500, alignment: .center)
                .fixedSize()
        }
        .windowStyle(HiddenTitleBarWindowStyle())
        .windowResizability(.contentSize)
    }
}
