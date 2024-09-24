//
//  LoginScreen.swift
//  smart_stocker
//
//  Created by Fabio A Soares on 22/09/24.
//

import SwiftUI
import FirebaseAuth

struct LoginScreen: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn: Bool = false

    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color.login.ignoresSafeArea()
                
                VStack {
                    Image("login_image")
                        .resizable()
                        .frame(width: 300, height: 300)
                        .ignoresSafeArea()
                    
                    VStack {
                        Text("SmartStocker")
                            .bold()
                            .foregroundColor(.login)
                            .font(.system(size: 25))
                            .padding(.bottom, 20)

                        VStack(alignment: .leading) {
                            Text("E-mail")
                                .font(.system(size: 14))
                                .padding(.leading, 6)

                            TextField("email@example.com", text: $username)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                                .frame(maxWidth: .infinity)
                        }

                        VStack(alignment: .leading) {
                            Text("Senha")
                                .font(.system(size: 14))
                                .padding(.leading, 6)

                            SecureField("Insira sua senha", text: $password)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                                .frame(maxWidth: .infinity)

                            VStack {
                                Button {
                                    login()
                                } label: {
                                    Text("Entrar")
                                        .foregroundColor(.white)
                                        .bold()
                                }
                            }
                            .frame(maxWidth: .infinity)
                            .padding(10)
                            .background(Color.login)
                            .cornerRadius(10)
                            .padding(.bottom, 20)

                            HStack {
                                Text("Ainda não possui conta? ")
                                    .foregroundColor(.brown)
                                NavigationLink(destination: RegisterScreen()) {
                                    Text("Registre-se")
                                        .foregroundColor(.brown)
                                        .underline()
                                }
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(30)
                    .background(Color.white)
                    .cornerRadius(10)
                }
                .padding([.leading, .trailing], 30)
            }
            .navigationDestination(isPresented: $isLoggedIn) {
                HomeScreen()
            }
        }
    }

    func login() {
        Auth.auth().signIn(withEmail: username, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                isLoggedIn = true
            }
        }
    }
}

#Preview {
    LoginScreen()
}
