//
//  LotusApp.swift
//  Lotus
//
//  Created by Kiara on 19.07.23.
//

import SwiftUI

@main
struct LotusApp: App {
    @ObservedObject var vm = RootScreenModel()
    
    var body: some Scene {
        WindowGroup {
            RootScreen()
                .environmentObject(vm)
        }
    }
}
