//
//  FooterView.swift
//  Black Dates
//
//  Created by Albert Khurshudyan on 17.12.23.
//

import SwiftUI

struct FooterView: View {
    @Binding var showBookingAlert: Bool
    let haptics = UINotificationFeedbackGenerator()
    
    var body: some View {
        HStack{
            Button(action: {
                print("Dislike")
            }) {
                Image(systemName: "xmark.circle")
                    .font(.system(size: 42, weight: .light))
            }
            .accentColor(Color.primary)
        
        Spacer()
        
            Button(action: {
                self.haptics.notificationOccurred(.success)
                self.showBookingAlert.toggle()
            },
               label: {
                Text("Profile Info".uppercased())
                    .font(.system(.subheadline, design: .rounded))
                    .fontWeight(.heavy)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .accentColor(Color.pink)
                    .background(
                        Capsule().stroke(Color.pink, lineWidth: 2)
                        )
            })
        
        Spacer()
        
        Button(action: {
            print("Like")
        }) {
            Image(systemName: "heart.circle")
                .font(.system(size: 42, weight: .light))
        }
        .accentColor(Color.primary)
        }
        .padding()
    }
}

#Preview {
    FooterView(showBookingAlert: .constant(false))
}
