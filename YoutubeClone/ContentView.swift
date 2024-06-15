//
//  ContentView.swift
//  YoutubeClone
//
//  Created by Mac on 6/15/24.
//

import SwiftUI

struct ContentView: View {
    @State private var selection:Tab = .home
    var body: some View {
        ZStack(alignment:.bottom) {
            TabView(selection:$selection) {
                HomeView()
                    .tag(Tab.home)
                ShortsView()
                    .tag(Tab.shorts)
                ProfileView()
                    .tag(Tab.account)
            }
            TabBarView(selection:$selection)
        }
    }
    
    init() {
        UITabBar.appearance().isHidden = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
