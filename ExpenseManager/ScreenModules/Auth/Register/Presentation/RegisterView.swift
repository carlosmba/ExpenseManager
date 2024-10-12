//
//  RegisterView.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 17/07/24.
//

import SwiftUI

struct RegisterView: View {
    @State var vm : RegisterViewModel = RegisterViewModel()
    
    var body: some View {
        ZStack{
            VStack{
                Image("icon_main")
                    .resizable()
                    .frame(width: 120, height: 120)
                Text("Registro")
                    .font(.custom("RobotoCondensed-Bold", size: 35))
                    .fontWeight(.heavy)
                    .foregroundStyle(.white)
                    .padding(.bottom, 50)
                VStack{
                    
                    CustomTextField(imageSystemName: "person.circle",label: "Nombre", value: $vm.name)
                    Divider()
                        .background(.white)
                    
                    CustomTextField(imageSystemName: "phone.circle",label: "Telefono", value: $vm.phone)
                    Divider()
                        .background(.white)
                    
                    CustomTextField(imageSystemName: "envelope.circle",label: "Email", value: $vm.email)
                    
                    Divider()
                        .background(.white)
                    CustomSecureTextField(imageSystemName: "lock.circle", label: "Password", value: $vm.password)
                    
                    
                    
                        
                        
                }
                .padding()
                .background(.black.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 5))
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Sign Up")
                        .fontWeight(.heavy)
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundStyle(.white)
                        .background(.red)
                        .clipShape(RoundedRectangle(cornerRadius: 5))
                })
                .padding(.top, 20)
                Spacer()
            }.safeAreaPadding(.vertical, 50)
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

#Preview {
    RegisterView()
}
