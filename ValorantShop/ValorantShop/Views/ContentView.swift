//
//  ContentView.swift
//  ValorantShop
//
//  Created by 김건우 on 2023/09/12.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - WRAPPER PROPERTIES
    
    @State private var selectedCustomTab: CustomTabType = .shop
    
    // MARK: - INTIALIZER
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    // MARK: - BODY
    
    var body: some View {
        // For Test
        if true {
            LoginView()
        } else {
            VStack {
                TabView(selection: $selectedCustomTab) {
                    ShopView()
                        .tag(CustomTabType.shop)
                    
                    CollectionView()
                        .tag(CustomTabType.collection)
                    
                    SettingsView()
                        .tag(CustomTabType.settings)
                }
                
                CustomTabView($selectedCustomTab)
            }
        }
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
