//
//  FloatingMenuView.swift
//  FloatingMenu
//
//  Created by 王干 on 2024/2/6.
//

import SwiftUI

struct FloatingMenuView: View {
    
    let primaryItem: FloatingMenuItem
    let secondaryItem: [FloatingMenuItem]
    let none: () -> Void = {}
    
    let size: CGFloat = 70
    var cornerRadius: CGFloat = 35
    @State var isExpanded = false
    
    var body: some View {
        VStack {
            if isExpanded {
                ForEach(secondaryItem) { item in
                    Button(action: item.action ?? self.none, label: {
                        HStack {
                            Image(systemName: item.image)
                            Text(item.label)
                        }
                        .font(.body)
                        .foregroundColor(.white)
                    })
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
            }
            
            Button(action: {
                withAnimation(.spring()) {
                    isExpanded.toggle()
                }
                self.primaryItem.action?()
            }, label: {
                Image(systemName: primaryItem.image)
                    .font(.title)
                    .bold()
                    .foregroundColor(.white)
                    .rotationEffect(self.isExpanded ? .degrees(135) : .degrees(0))
            })
            .frame(width: size, height: size)
        }
        .padding(.top, isExpanded ? 10 : 0)
        .background(Color(#colorLiteral(red: 0.0, green: 0.18, blue: 0.65, alpha: 1)))
        .cornerRadius(isExpanded ? 20 : self.cornerRadius)
        .shadow(color: .black.opacity(0.17), radius: 3, x: 2, y: 2)
    }
}

struct FloatingMenuItem: Identifiable {
    let id = UUID()
    let image: String
    let label: String
    private(set) var action: (() -> Void)? = nil
}
