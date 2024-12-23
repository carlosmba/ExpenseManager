//
//  LoginView.swift
//  ExpenseManager
//
//  Created by Carlos Mendoza on 15/07/24.
//

import SwiftUI

struct LoginView: View {
    @State private var viewModel : LoginViewModel = LoginViewModel(saveDefaultCategoriesUseCase: SaveDefaulValuesUseCaseImpl(categoryRepository: CategoryRepositoryImpl(localCategoryDataSource: LocalCategoryDataSourceImpl(localPersistence: SwiftDataContainer.shared), mapper: CategoryMapper())), errorMapper: ExpenseManagerPresentableErrorMapper())
    var body: some View {
        if viewModel.isPresented{
            HomeView()
                .transition(.move(edge: .leading))
                .animation(.easeInOut, value: UUID())
        }else{
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
                    
                    
                        
                    Spacer()
                    
                    HStack{
                        Text("¿No tienes una cuenta?")
                            .foregroundStyle(.white)
                        Text("Registrate")
                            .fontWeight(.bold)
                            .foregroundStyle(.red)
                    }
                    
                    Button(action: {
                        Task{
                            await viewModel.saveValuesDefault()
                            withAnimation{
                                self.viewModel.isPresented.toggle()
                            }
                        }
                        
                    }){
                        Text("Continuar sin cuenta")
                            .foregroundStyle(.white)
                            .padding(.top, 2)
                    }
                }
                .safeAreaPadding(.vertical, 50)
                .padding()
                
                if(viewModel.isLoading){
                    ZStack{
                        Color(.black)
                            .opacity(0.2)
                            .ignoresSafeArea()
                        ProgressView()
                            .scaleEffect(3)
                    }
                }
                
            }.background{
                Image("login_background")
                    .resizable()
                    .scaledToFill()
                    .background(.black)
                    .opacity(0.7)
                
                
                
            }
        }
        
        
        
            
    }
    
    
}

#Preview {
    LoginView()
}
