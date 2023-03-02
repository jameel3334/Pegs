//
//  LoginView.swift
//  Pegs
//
//  Created by Mohammed Jameeluddin on 3/2/23.
//

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var isLoggedIn = false
    
    var body: some View {
        VStack {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .padding()
            TextField("Username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            Button("Login") {
                // Perform login validation here
                self.isLoggedIn = true
            }
            .padding()
            .alert(isPresented: $isLoggedIn) {
                Alert(
                    title: Text("Login Successful"),
                    message: Text("You are now logged in!"),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
