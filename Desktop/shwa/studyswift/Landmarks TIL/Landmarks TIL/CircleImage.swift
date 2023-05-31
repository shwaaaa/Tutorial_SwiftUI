//
//  CircleImage.swift
//  Landmarks TIL
//
//  Created by 이승화 on 2023/05/31.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("Turtle Rock")
            .clipShape(Circle())
            .overlay {
                Circle() .stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
