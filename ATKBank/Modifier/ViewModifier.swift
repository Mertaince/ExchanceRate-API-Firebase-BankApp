//
//  ViewModifier.swift
//  ATKBank
//
//  Created by Mert ATK on 22.06.2023.
//

import SwiftUI


struct ButtonModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(width: 350, height: 50)
            .background(Color(.systemBlue))
            .cornerRadius(16)
            .foregroundColor(.white)
    }
}

struct TextFieldModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(18)
            .background(Color(.systemGray6))
            .cornerRadius(22)
            .padding(.horizontal,22)
            .shadow(color: .green, radius: 2, x: 1, y: 2)
    }
    
}

struct ButtonBorder: ViewModifier{
    func body(content: Content) -> some View {
        content
            .padding(10)
            .frame(width: 350, height: 60)
            .background(.green)
            .overlay(
            RoundedRectangle(cornerRadius: 22)
                .stroke(.white, lineWidth: 2))
            .foregroundColor(.white)
            
    }
}
