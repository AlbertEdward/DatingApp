//
//  InfoView.swift
//  Black Dates
//
//  Created by Albert Khurshudyan on 20.12.23.
//

import SwiftUI

struct InfoView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20) {
                HeaderComponent()
                
                Spacer(minLength: 20)
                
                Text("App Info")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                AppInfoView()
                
                Text("Terms of Service")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                CreditsView()
                
                Spacer()
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    Text("Continue".uppercased())
                        .modifier(ButtonModifier())
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.top, 15)
            .padding(.bottom, 25)
            .padding(.horizontal, 25)
        }
    }
}

#Preview {
    InfoView()
}

struct AppInfoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            RowAppInfoView(itemOne: "Application", itemTwo: "Black Dates")
            RowAppInfoView(itemOne: "Compatibility", itemTwo: "Iphone and Ipad")
            RowAppInfoView(itemOne: "Developer", itemTwo: "Albert Khurshduyan")
            RowAppInfoView(itemOne: "Designer", itemTwo: "Albert Khurshudyan")
            RowAppInfoView(itemOne: "Website", itemTwo: "www.blackdates.com")
            RowAppInfoView(itemOne: "Version", itemTwo: "1.0.0")
        }
    }
}

struct RowAppInfoView: View {
        var itemOne: String
        var itemTwo: String
    
    var body: some View {
        VStack {
            HStack {
                Text(itemOne).foregroundStyle(Color.gray)
                Spacer()
                Text(itemTwo)
            }
            Divider()
        }
    }
}

struct CreditsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("1. Acceptance of Terms")
                .fontWeight(.black)
                .foregroundStyle(Color.gray)
            Text("By accessing or using Black Dates ('the App'), you agree to comply with and be bound by these Terms of Service ('Terms'). If you do not agree with these Terms, please do not use the App.").foregroundStyle(Color.gray)
            
            Divider()
            
            Text("2. User Eligibility")
                .fontWeight(.black)
                .foregroundStyle(Color.gray)
            Text("You must be at least 18 years old to use the App. By using the App, you represent and warrant that you are at least 18 years old.").foregroundStyle(Color.gray)
            
            Divider()
            
            Text("3. User Accounts")
                .fontWeight(.black)
                .foregroundStyle(Color.gray)
            Text("Registration:\nTo use certain features of the App, you must register for an account. You agree to provide accurate, current, and complete information during the registration process.\n\nAccount Security:\nYou are responsible for maintaining the confidentiality of your account credentials and are fully responsible for all activities that occur under your account.").foregroundStyle(Color.gray)
            
            Divider()
        }
    }
}
