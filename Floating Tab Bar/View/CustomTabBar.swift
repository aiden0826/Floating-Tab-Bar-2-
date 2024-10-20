//
//  CustomTabBar.swift
//  Floating Tab Bar
//
//  Created by Aiden Ruiz on 10/19/24.
//

import SwiftUI

struct CustomTabBar: View {
    var activeForegroundColor: Color = .white
    var activeBackgroundColor: Color = .blue
    @Binding var activeTab: TabModel
    var body: some View {
        HStack(spacing: 0){
            ForEach(TabModel.allCases, id: \.rawValue) {
                tab in
                Button{
                    activeTab = tab
                } label: {
                    HStack(spacing: 5){
                        Image(systemName: tab.rawValue)
                            .font(.title3)
                            .frame(width: 30 , height: 30)
                        
                        if activeTab == tab {
                            Text(tab.title)
                                .font(.caption)
                                .fontWeight(.semibold)
                                .lineLimit(1)
                        }
                    }
                    .foregroundStyle(activeTab == tab ? activeForegroundColor : .gray)
                    .padding(.vertical, 2)
                    .padding(.leading, 10)
                    .padding(.trailing, 15)
                    .contentShape(.rect)
                    .background{
                        if activeTab == tab {
                            Capsule()
                                .fill(activeBackgroundColor.gradient)
                        }
                    }
                }
                .buttonStyle(.plain)
            }
        }
    }
}

#Preview {
    ContentView()
}
