//
//  CreateView.swift
//  ATKBank
//
//  Created by Mert ATK on 22.06.2023.
//

import SwiftUI
import Firebase

struct CreateView: View {
    @State private var eposta = ""
    @State private var password = ""
    @State private var showPassword = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                
                Color.green.edgesIgnoringSafeArea(.all)
                VStack{
                    Image(systemName: "lock.open")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 170, height: 100)
                        .foregroundColor(Color(.systemGray6))
                        .padding(60)
                        .shadow(color: .white, radius: 10, x: 1, y: 1)
                    Text("Hoşgeldiniz...")
                        .font(.system(size:30))
                        .bold()
                        .foregroundColor(.white)
                        .padding(.horizontal,-170)
                    Text("Hesap oluşturun")
                        .font(.footnote)
                        .foregroundColor(.white)
                        .padding(.horizontal,-170)
                    
                    TextField("Eposta", text: $eposta)
                        .modifier(TextFieldModifier())
                    
                    VStack {
                        ZStack{
                            
                            if showPassword{
                                TextField("Sifre", text: $password)
                                    .modifier(TextFieldModifier())
                            } else{
                                SecureField("Sifre", text: $password)
                                    .modifier(TextFieldModifier())
                            }
                            Button{
                                showPassword.toggle()
                            }label:{
                                Image(systemName: showPassword ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(.gray)
                            }.padding(.leading,300)
                        }
                    }.padding(.vertical,10)
                    
                    Button{
                        register()
                    }label:{
                        Text("Hesap Oluştur")
                            .padding(10)
                            .frame(width: 350, height: 60)
                            .background(.green)
                            .overlay(
                            RoundedRectangle(cornerRadius: 22)
                                .stroke(.white, lineWidth: 2))
                            .foregroundColor(.white)
                        
                    }.padding()
                    
                }
            }
        }
    }
    func register(){
        Auth.auth().createUser(withEmail: eposta, password: password) { result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
    
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        CreateView()
    }
}
