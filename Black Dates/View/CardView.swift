//
//  CardView.swift
//  Black Dating
//
//  Created by Albert Khurshudyan on 17.12.23.
//

import SwiftUI

struct CardView: View, Identifiable {
    var id = UUID()
    var blackDating: Destination
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(blackDating.image)
                .resizable()
                .cornerRadius(24)
                .scaledToFit()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, maxWidth: .infinity)
                .overlay(
                    VStack(alignment: .center, spacing: 12) {
                        Spacer()
                        HStack{
                            Text(blackDating.name)
                            Text(blackDating.surname)
                        }
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .shadow(radius: 1)
                        .padding(.horizontal, 18)
                        .padding(.vertical, 4)
                        .overlay(
                            Rectangle()
                                .fill(Color.white)
                                .frame(height: 1),
                            alignment: .bottom
                        )
                        HStack {
                            Text("\(blackDating.age)")
                                .foregroundColor(.black)
                                .font(.footnote)
                                .fontWeight(.bold)
                                .frame(minWidth: 85)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(
                                    Capsule().fill(Color.white)
                                )
                            Text(blackDating.place.uppercased())
                                .foregroundColor(.black)
                                .font(.footnote)
                                .fontWeight(.bold)
                                .frame(minWidth: 85)
                                .padding(.horizontal, 10)
                                .padding(.vertical, 5)
                                .background(
                                    Capsule().fill(Color.white)
                                )
                        }
                    }
                    .frame(minWidth: 280)
                    .padding(.bottom, 50)
                )
        }
    }
}

#Preview {
    CardView(blackDating: blackDatingData[0])
        .previewLayout(.fixed(width: 300, height: 300))
}
