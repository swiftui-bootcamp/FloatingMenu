//
//  ContentView.swift
//  FloatingMenu
//
//  Created by 王干 on 2024/2/6.
//

import SwiftUI

struct ContentView: View {
    @State var text = "None"
    
    var body: some View {
        VStack {
            Spacer()
            Text("\(self.text) pressed")
                .font(.title)
            
            HStack {
                Spacer()
                FloatingMenuView(
                    primaryItem: FloatingMenuItem(image: "plus", label: ""),
                    secondaryItem: [
                        FloatingMenuItem(image: "person", label: "个人中心") {
                            withAnimation() {
                                self.text = "个人中心"
                            }
                        },
                        
                        FloatingMenuItem(image: "star", label: "我的收藏") {
                            withAnimation() {
                                self.text = "我的收藏"
                            }
                        },
                        
                        FloatingMenuItem(image: "lasso.badge.sparkles", label: "推荐星球") {
                            withAnimation() {
                                self.text = "推荐星球"
                            }
                        }
                    ])
            }
            .padding(.trailing, 30)
            .padding(.bottom, 80)
        }
    }
}

#Preview {
    ContentView()
}
