//
//  LoginView.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 15/07/24.
//

import SwiftUI

struct LoginView: View {
    @State private var viewModel : LoginViewModel = LoginViewModel()
    var body: some View {
        NavigationStack {
            ZStack{
                VStack{
                    Image("icon_main")
                        .resizable()
                        .frame(width: 120, height: 120)
                    Text("Gestor de Gastos")
                        .font(.custom("RobotoCondensed-Bold", size: 35))
                        .fontWeight(.heavy)
                        .foregroundStyle(.white)
                        .padding(.bottom, 50)
                    
                    VStack{
                        
                        CustomTextField(imageSystemName: "envelope.circle",label: "Email", value: $viewModel.email)
                        
                        Divider()
                            .background(.white)
                        HStack {
                            Image(systemName: "lock.circle")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundStyle(.white)
                            SecureField(text: $viewModel.password){
                                Text("Password")
                                    .foregroundStyle(.white)
                                    .bold()
                                
                            }
                            .font(.title2)
                            .foregroundStyle(.white)
                        }
                        
                        
                            
                            
                    }
                    .padding()
                    .background(.black.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    
                    Button(action: {
                        viewModel.isPresented.toggle()
                    }, label: {
                        Text("Login")
                            .fontWeight(.heavy)
                            .font(.title3)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundStyle(.white)
                            .background(.red)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                    })
                    .padding(.top, 20)
                    .navigationDestination(isPresented: $viewModel.isPresented, destination: {
                        HomeView()
                    })
                    
                    
                        
                    Spacer()
                    
                    HStack{
                        Text("¿No tienes una cuenta?")
                            .foregroundStyle(.white)
                        Text("Registrate")
                            .fontWeight(.bold)
                            .foregroundStyle(.red)
                    }
                    
                    Text("Continuar sin cuenta")
                        .foregroundStyle(.white)
                        .padding(.top, 2)
                }
                .safeAreaPadding(.vertical, 50)
                .padding()
                
            }.background{
                Image("login_background")
                    .resizable()
                    .scaledToFill()
                    .background(.black)
                    .opacity(0.7)
                    
                    
        }.ignoresSafeArea()
        }
            
    }
}

#Preview {
    LoginView()
}
