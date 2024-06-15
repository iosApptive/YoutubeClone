//
//  TabBarView.swift
//  YoutubeClone
//
//  Created by Mac on 6/15/24.
//

import SwiftUI


enum Tab:String,CaseIterable {
    case home, shorts, account
    
    var item:String {
        switch self {
        case .home:
            return "house"
        case .shorts:
            return "capsule.portrait"
        case .account:
            return "person"
        }
    }
}


struct TabBarView: View {
    @Binding var selection:Tab
    
    var body: some View {
        HStack {
            ForEach(Tab.allCases,id:\.self) { tab in
                VStack {
                    Image(systemName: tab.item)
                    Text(tab.rawValue.capitalized)
                }
                .frame(height:80)
                .frame(maxWidth:.infinity)
                .foregroundColor(handleForgroundColor(for:tab))
                .background(handleBgForgroundColor(for: tab))
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.gray,lineWidth: 1)
                )
                .cornerRadius(16)
                .clipped()
                .onTapGesture {
                    selection = tab
                }
                
            }
        }
        .padding(.horizontal)
    }
    
    func handleForgroundColor(for tab:Tab) -> Color {
        selection == tab ? .white : .gray
    }
    
    func handleBgForgroundColor(for tab:Tab) -> Color {
        selection == tab ? .accentColor : .black
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(selection: .constant(.home))
    }
}
