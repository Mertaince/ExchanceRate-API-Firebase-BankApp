//
//  MoneyView.swift
//  ATKBank
//
//  Created by Mert ATK on 22.06.2023.
//

import SwiftUI

struct MoneyView: View {
    var body: some View {
        VStack{
            ZStack{
                Rectangle()
                    .foregroundColor(.green)
                    .edgesIgnoringSafeArea(.vertical)
                    .frame(height: 300)
                VStack{
                    VStack{
                        Text("Kullanılabilir Bakiye")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .bold()
                        Text("10.000 TL")
                            .foregroundColor(.white)
                            .font(.system(size: 40))
                            .bold()
                        
                        Text("TR32 **** **** **** **** ****")
                            .foregroundColor(.white)
                    }.padding(.vertical,20)
                    HStack{
                        VStack{
                            ZStack {
                                Circle()
                                    .frame(width: 70, height: 70)
                                    .foregroundColor(.white)
                                    
                                Image(systemName: "arrowshape.turn.up.left")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .foregroundColor(Color(.systemGray))
                                    .frame(width: 20, height: 20)
                            }
                            Text("Para Gönder")
                                .font(.footnote)
                                .foregroundColor(Color(.systemGray6))
                        }
                        Spacer()
                        VStack{
                            ZStack {
                                Circle()
                                    .frame(width: 70, height: 70)
                                    .foregroundColor(.white)
                                Image(systemName: "qrcode.viewfinder")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .foregroundColor(Color(.systemGray))
                                    .frame(width: 25, height: 25)
                                
                            }
                            Text("Para Çek")
                                .font(.footnote)
                                .foregroundColor(Color(.systemGray6))
                        }
                        Spacer()
                        VStack{
                            ZStack {
                                Circle()
                                    .frame(width: 70, height: 70)
                                    .foregroundColor(.white)
                                Image(systemName: "calendar")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .foregroundColor(Color(.systemGray))
                                    .frame(width: 25, height: 25)
                            }
                            Text("Ödemelerim")
                                .font(.footnote)
                                .foregroundColor(Color(.systemGray6))
                        }
                    }.padding(.horizontal,20)
                    
                }
                
            }
            Text("Hesap Hareketleri")
                .font(.system(size:20))
                .font(.footnote)
                .foregroundColor(Color(.systemGray2))
                .padding(.horizontal,20)
                Divider()
                .frame(width:300)
            ScrollView{
                VStack{
                    HStack{
                        VStack{
                            Text("23")
                            Text("Haziran")
                        }.font(.system(size:22))
                            .foregroundColor(Color(.systemGray2))
                            .bold()
                        Spacer()
                        VStack(alignment: .leading){
                            Text("Harcama")
                            Text("Mert ATK Fast Food ")
                        }.foregroundColor(Color(.systemGray))
                        Spacer()
                        VStack(alignment: .trailing){
                            Text("-100 TL")
                                .bold()
                                .foregroundColor(.red)
                                .font(.system(size:22))
                            Text("Dekont")
                                .foregroundColor(Color(.systemBlue))
                        }
                    }
                }.padding(.horizontal,10)
                Divider()
                VStack{
                    HStack{
                        VStack{
                            Text("22")
                            Text("Haziran")
                        }.font(.system(size:22))
                            .foregroundColor(Color(.systemGray2))
                            .bold()
                        Spacer()
                        VStack(alignment: .leading){
                            Text("Harcama")
                            Text("Mert ATK Fast Food ")
                        }.foregroundColor(Color(.systemGray))
                        Spacer()
                        VStack(alignment: .trailing){
                            Text("-250 TL")
                                .bold()
                                .foregroundColor(.red)
                                .font(.system(size:22))
                            Text("Dekont")
                                .foregroundColor(Color(.systemBlue))
                        }
                    }
                }.padding(.horizontal,10)
                Divider()
                VStack{
                    HStack{
                        VStack{
                            Text("21")
                            Text("Haziran")
                        }.font(.system(size:22))
                            .foregroundColor(Color(.systemGray2))
                            .bold()
                        Spacer()
                        VStack(alignment: .leading){
                            Text("İade")
                            Text("Mert ATK Fast Food ")
                        }.foregroundColor(Color(.systemGray))
                        Spacer()
                        VStack(alignment: .trailing){
                            Text("150 TL")
                                .bold()
                                .foregroundColor(.green)
                                .font(.system(size:22))
                            Text("Dekont")
                                .foregroundColor(Color(.systemBlue))
                        }
                    }
                }.padding(.horizontal,10)
                Divider()
                VStack{
                    HStack{
                        VStack{
                            Text("20")
                            Text("Haziran")
                        }.font(.system(size:22))
                            .foregroundColor(Color(.systemGray2))
                            .bold()
                        Spacer()
                        VStack(alignment: .leading){
                            Text("Para Transfer")
                            Text("Mert ATK Fast Food ")
                        }.foregroundColor(Color(.systemGray))
                        Spacer()
                        VStack(alignment: .trailing){
                            Text("+980 TL")
                                .bold()
                                .foregroundColor(.green)
                                .font(.system(size:22))
                            Text("Dekont")
                                .foregroundColor(Color(.systemBlue))
                        }
                    }
                }.padding(.horizontal,10)
                Divider()
                VStack{
                    HStack{
                        VStack{
                            Text("19")
                            Text("Haziran")
                        }.font(.system(size:22))
                            .foregroundColor(Color(.systemGray2))
                            .bold()
                        Spacer()
                        VStack(alignment: .leading){
                            Text("Harcama")
                            Text("Mert ATK Fast Food ")
                        }.foregroundColor(Color(.systemGray))
                        Spacer()
                        VStack(alignment: .trailing){
                            Text("-100 TL")
                                .bold()
                                .foregroundColor(.red)
                                .font(.system(size:22))
                            Text("Dekont")
                                .foregroundColor(Color(.systemBlue))
                        }
                    }
                }.padding(.horizontal,10)
                Divider()
                
                
            }
            
        }
        
        
    }
}

struct MoneyView_Previews: PreviewProvider {
    static var previews: some View {
        MoneyView()
    }
}
