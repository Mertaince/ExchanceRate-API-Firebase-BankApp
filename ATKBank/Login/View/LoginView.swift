//
//  LoginView.swift
//  ATKBank
//
//  Created by Mert ATK on 22.06.2023.
//



import SwiftUI
import Firebase

struct LoginView: View {
    @State private var eposta = ""
    @State private var password = ""
    @State private var showPassword = false
    @State var StatusMassage = ""
    @State var userIsLoggedIn = false
    
    var body: some View {
        if userIsLoggedIn {
            ContentView()
        }else{
            content
        }
    }
    
    var content: some View {
        NavigationStack{
            VStack{
                
                ZStack{
                    VStack{
                        ZStack{
                            Rectangle()
                                .frame(width: 150,height: 100)
                                .foregroundColor(.white)
                            
                            Image("logo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150, height: 150)
                            
                        }
                        Spacer()
                    }
                    
                    VStack{
                        Spacer()
                        ZStack{
                            Rectangle()
                                .frame(width: 360,height: 350)
                                .foregroundColor(.white)
                            VStack{
                                Text("Hoşgeldiniz...")
                                    .font(.system(size:30))
                                    .bold()
                                    .foregroundColor(Color(.systemGreen))
                                    .padding(.horizontal,-170)
                                Text("Giriş yapın")
                                    .font(.footnote)
                                    .foregroundColor(Color(.systemGray))
                                    .padding(.horizontal,-170)
                                
                                ZStack{
                                    TextField("Eposta", text: $eposta)
                                        .font(.subheadline)
                                        .padding(18)
                                        .background(Color(.systemGray6))
                                        .cornerRadius(22)
                                        .padding(.horizontal,22)
                                        .shadow(color: .green, radius: 2, x: 1, y: 2)
                                    Image(systemName: "lock")
                                        .foregroundColor(Color(.gray))
                                        .padding(.leading,300)
                                }
                                
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
                                    login()
                                }label:{
                                    Text("Giriş Yap")
                                        .padding()
                                        .frame(width: 350, height: 50)
                                        .background(Color(.systemGreen))
                                        .cornerRadius(22)
                                        .foregroundColor(.white)
                                        .shadow(color: .green, radius: 5, x: 1, y: 2)
                                    
                                }.padding()
                                Text(self.StatusMassage)
                                    .foregroundColor(.red)
                                    .font(.footnote)
                                NavigationLink{
                                    CreateView()
                                }label:{
                                    Text("Hesap Oluştur")
                                        .foregroundColor(.green)
                                        .padding(2)
                                }
                            }
                        }
                        Spacer()
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack{
                                VStack{
                                    ZStack{
                                        
                                        Circle()
                                            .foregroundColor(Color(.systemGray5))
                                            .padding(.horizontal,22)
                                            .frame(width: 120, height: 95)
                                            .shadow(color: .green, radius: 2, x: 1, y: 3)
                                        Image(systemName: "gift")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 30, height: 30)
                                            .foregroundColor(Color(.systemGray2))
                                            .shadow(color: .white, radius: 2, x: 1, y: 3)
                                    }
                                    Text("Kampanyalar")
                                        .font(.footnote)
                                }
                                VStack{
                                    ZStack{
                                        
                                        Circle()
                                            .foregroundColor(Color(.systemGreen))
                                            .padding(.horizontal,2)
                                            .frame(width: 120, height: 95)
                                            .shadow(color: .gray, radius: 3, x: 1, y: 3)
                                        Image("logo")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 80, height: 50)
                                            .foregroundColor(Color(.systemGray2))
                                            .shadow(color: .white, radius: 2, x: 1, y: 3)
                                    }
                                    Text("Hızlı Menü")
                                        .font(.footnote)
                                        .foregroundColor(Color(.systemGreen))
                                }
                                
                                VStack{
                                    ZStack{
                                        
                                        Circle()
                                            .padding(.horizontal,22)
                                            .foregroundColor(Color(.systemGray5))
                                            .frame(width: 120, height: 95)
                                            .shadow(color: .green, radius: 2, x: 1, y: 3)
                                        Image(systemName: "location.magnifyingglass")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 30, height: 30)
                                            .foregroundColor(Color(.systemGray2))
                                            .shadow(color: .white, radius: 2, x: 1, y: 3)
                                    }
                                    Text("Şubelerimiz")
                                        .font(.footnote)
                                }
                                
                            }
                            
                        }.padding(.horizontal,3)
                        
                    }.onAppear{
                        Auth.auth().addStateDidChangeListener { auth, user in
                            if user != nil{
                                userIsLoggedIn.toggle()
                            }
                        }
                    }
                    
                }
            }
                
            }
        }
        func login(){
            Auth.auth().signIn(withEmail: eposta, password: password) { result, error in
                if error != nil{
                    print(error!.localizedDescription)
                    self.StatusMassage = "Eposta veya şifreniz hatalı tekrar deneyiniz."
                }
            }
        }
    
}
    
    


struct AnimatedBackground: View{
    
    @State var animateGradient = false
    
    var body: some View {
        LinearGradient(colors: [.purple, .yellow], startPoint: .topLeading, endPoint: .bottomTrailing)
            .hueRotation(.degrees(animateGradient ? 45 : 0))
            .ignoresSafeArea()
            .onAppear {
                withAnimation(.easeInOut(duration: 5.0).repeatForever(autoreverses: true)) {
                    animateGradient.toggle()
                }
            }
        
    }
    
}
    

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
