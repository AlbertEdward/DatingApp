//
//  HeaderView.swift
//  Black Dating
//
//  Created by Albert Khurshudyan on 17.12.23.
//

import SwiftUI

struct HeaderView: View {
    @Binding var showGuideView: Bool
    @Binding var showInfoView: Bool
    
    var body: some View {
        HStack{
            Button(action: {
                self.showInfoView.toggle()
            }) {
                Image(systemName: "info.circle")
                    .font(.system(size: 24, weight: .regular))
            }
            .accentColor(Color.primary)
            .sheet(isPresented: $showInfoView, content: {
                InfoView()
            })
        
        Spacer()
        
        Image("black_dates_small_logo")
                .resizable()
                .scaledToFit()
                .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            
        Spacer()
        
        Button(action: {
            self.showGuideView.toggle()
        }) {
            Image(systemName: "questionmark.circle")
                .font(.system(size: 24, weight: .regular))
        }
        .accentColor(Color.primary)
        .sheet(isPresented: $showGuideView, content: {
            GuideView()
        })
        }
        .padding()
    }
}

#Preview {
    HeaderView(showGuideView: .constant(false), showInfoView: .constant(false))
}
