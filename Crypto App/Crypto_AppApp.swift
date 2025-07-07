//
//  Crypto_AppApp.swift
//  Crypto App
//
//  Created by Arman on 1/7/25.
//

import SwiftUI

@main
struct Crypto_AppApp: App {
    @StateObject private var vm = HomeViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
