//
//  Todo.swift
//  MSG_toyproject
//
//  Created by 이승화 on 2023/07/24.
//

import SwiftUI

struct Todo: View {
    var body: some View {
        VStack {
            HStack {
                Group {
                    Text("To")
                        .rotationEffect(.degrees(10))
                        .padding(.leading,20)
                    Text("do!")
                        .rotationEffect(.degrees(-10))
                }
                .font(.system(size: 30, weight: .black))
                .foregroundColor(Color("todo color"))
                .shadow(color: .green, radius: 20)
                
                Spacer()
            }
            Spacer()
        }
    }
}

struct Todo_Previews: PreviewProvider {
    static var previews: some View {
        Todo()
    }
}
