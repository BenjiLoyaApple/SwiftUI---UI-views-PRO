//
//  BumbleProfileImageCell.swift
//  News
//
//  Created by Benji Loya on 06.04.2024.
//

import SwiftUI

struct BumbleProfileImageCell: View {
    
    var imageName: String = Constants.randomImage
    var percentageRemaining: Double = Double.random(in: 0...1)
    var hasNewMessage: Bool = true
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(.bumbleGray, lineWidth: 2)
            
            Circle()
                .trim(from: 0, to: percentageRemaining)
                .stroke(.bumbleYellow, lineWidth: 4)
                .rotationEffect(Angle(degrees: -90))
                .scaleEffect(x: -1, y: 1, anchor: .center)
            
            ImageLoaderView(urlString: imageName)
                .clipShape(Circle())
                .padding(5)
            
        }
        .frame(width: 75, height: 75)
        .overlay(
            ZStack {
                if hasNewMessage {
                    Circle()
                        .fill(.bumbleWhite)
                    
                    Circle()
                        .fill(.bumbleYellow)
                        .padding(3)
                }
            }
            .frame(width: 22, height: 22)
            
            , alignment: .bottomTrailing
        )
    }
}

#Preview {
    HStack {
        BumbleProfileImageCell()
        BumbleProfileImageCell(percentageRemaining: 1)
        BumbleProfileImageCell(percentageRemaining: 0)
        BumbleProfileImageCell(hasNewMessage: false)
    }
}
