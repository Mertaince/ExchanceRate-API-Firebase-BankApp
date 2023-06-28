//
//  ContentView.swift
//  ATKBank
//
//  Created by Mert ATK on 22.06.2023.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    @EnvironmentObject private var sessionManeger: SessionManager
    @State private var showinLoginView = false
    var body: some View {
        NavigationStack{
            
                HStack{
                    Spacer()
                    Button(action: {
                        sessionManeger.signOut()
                        showinLoginView = true
                    }, label: {
                        Image(systemName: "multiply.circle")
                        Text("Çıkış")
                    }).fullScreenCover(isPresented: $showinLoginView){
                        LoginView()
                    }
                    
                }.padding(.trailing,22)
            ScrollView{
                VStack{
                    Text("Hesaplarım")
                        .font(.system(size: 22))
                        .padding(.horizontal,-170)
                    HStack{
                        Rectangle()
                            .fill(.green)
                            .frame(width: 10, height: 100)
                        ZStack{
                            Rectangle()
                                .fill(Color(.systemGray5))
                                .frame(width: 320, height: 100)
                                .cornerRadius(22)
                            VStack{
                                HStack{
                                    Image(systemName: "creditcard")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 30, height: 30)
                                    VStack{
                                        Text("*** *** 1511")
                                            .padding()
                                        
                                        
                                    }
                                }
                                
                                
                                
                            }.padding(.leading,-120)
                        }
                    }
                    HStack{
                        NavigationLink{
                            MoneyView()
                        }label:{
                            Text("Bakiyem")
                                .padding(12)
                                .frame(width: 150, height: 50)
                                .background(Color(.systemGreen))
                                .foregroundColor(.white)
                                .cornerRadius(22)
                                .font(.system(size: 15))
                            
                        }
                        
                        NavigationLink{
                            MoneyView()
                        }label:{
                            Text("Hesap haraketleri")
                                .padding(12)
                                .frame(width: 150, height: 50)
                                .background(Color(.systemGreen))
                                .foregroundColor(.white)
                                .cornerRadius(22)
                                .font(.system(size: 15))
                        }
                        
                    }.padding(.horizontal,22)
                    
                    Text("Kartlarım")
                        .font(.system(size: 22))
                        .padding(.horizontal,-170)
                    HStack{
                        Rectangle()
                            .fill(.purple)
                            .frame(width: 10, height: 100)
                        ZStack{
                            Rectangle()
                                .fill(Color(.systemGray5))
                                .frame(width: 320, height: 100)
                                .cornerRadius(22)
                            VStack{
                                VStack{
                                    HStack{
                                        Image(systemName: "creditcard")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 30, height: 30)
                                        VStack(alignment: .leading){
                                            Text("Worldcard")
                                                .bold()
                                            Text("*** *** 1511")
                                        }.padding(.horizontal,12)
                                        
                                    }
                                }.padding(.leading,-120)
                                
                                HStack(alignment: .center){
                                    VStack{
                                        Text("Borçlarım")
                                            .font(.footnote)
                                        Text("0.00 TL")
                                            .font(.footnote)
                                    }
                                    
                                    Divider()
                                        .frame(height: 20)
                                        .padding(.horizontal,22)
                                    
                                    VStack{
                                        Text("Bakiye")
                                            .font(.footnote)
                                        Text("10.000.00 TL")
                                            .font(.footnote)
                                    }
                                }
                            }
                            
                        }
                    }
                    HStack{
                        Button{
                            
                        }label:{
                            Text("Bakiyem")
                                .padding(12)
                                .frame(width: 150, height: 50)
                                .background(Color(.systemGreen))
                                .foregroundColor(.white)
                                .cornerRadius(22)
                                .font(.system(size: 15))
                            
                        }
                        
                        Button{
                            
                        }label:{
                            Text("Hesap haraketleri")
                                .padding(12)
                                .frame(width: 150, height: 50)
                                .background(Color(.systemGreen))
                                .foregroundColor(.white)
                                .cornerRadius(22)
                                .font(.system(size: 15))
                        }
                        
                    }.padding(.horizontal,22)
                    VStack{
                        Text("Sanal Kartlarım")
                            .font(.system(size: 22))
                            .padding(.horizontal,-170)
                        HStack{
                            Rectangle()
                                .fill(.orange)
                                .frame(width: 10, height: 100)
                            ZStack{
                                Rectangle()
                                    .fill(Color(.systemGray5))
                                    .frame(width: 320, height: 100)
                                    .cornerRadius(22)
                                VStack{
                                    HStack{
                                        Image(systemName: "plus")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 30, height: 30)
                                            .foregroundColor(Color(.systemGray2))
                                    }
                                }
                            }
                            
                        }
                        Button{
                            
                        }label:{
                            Text("Oluştur")
                                .padding(12)
                                .frame(width: 290, height: 40)
                                .background(Color(.systemGreen))
                                .foregroundColor(.white)
                                .cornerRadius(22)
                                .font(.system(size: 15))
                        }
                        Text("Canlı Döviz Bilgileri")
                            .font(.system(size: 22))
                            .padding(.horizontal,-170)
                        ApiModelView()
                        
                    }
                    Spacer()
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
