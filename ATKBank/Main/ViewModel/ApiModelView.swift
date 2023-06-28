//
//  ApiModelView.swift
//  ATKBank
//
//  Created by Mert ATK on 27.06.2023.
//

import SwiftUI

struct ApiModelView: View {
    
    @State private var usdRate: Double = 0.0
    @State private var eurRate: Double = 0.0
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack {
                ZStack{
                    Rectangle()
                        .fill(Color(.systemGray5))
                        .frame(width: 220, height: 100)
                        .cornerRadius(22)
                    Image(systemName: "dollarsign")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 10)
                        .shadow(color: .green, radius: 3, x: 1, y: 3)
                        .opacity(0.3)
                        .foregroundColor(Color(.systemGreen))
                    Text("1 Dolar = \(1.0 / usdRate, specifier: "%.2f") TRY")
                }
                ZStack{
                    Rectangle()
                        .fill(Color(.systemGray5))
                        .frame(width: 220, height: 100)
                        .cornerRadius(22)
                    Image(systemName: "eurosign")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 75, height: 10)
                        .shadow(color: .green, radius: 3, x: 1, y: 3)
                        .opacity(0.3)
                        .foregroundColor(Color(.systemGreen))
                    Text("1 Euro = \(1.0 / eurRate, specifier: "%.2f") TRY")
                }
            }.padding(.horizontal,25)
            .onAppear {
                Api.api { result in
                    switch result {
                    case .success(let rates):
                        DispatchQueue.main.async {
                            if let usdRate = rates["USD"] {
                                self.usdRate = usdRate
                            }
                            if let eurRate = rates["EUR"] {
                                self.eurRate = eurRate
                            }
                        }
                    case .failure(let error):
                        print("Currency rates fetch error: \(error.localizedDescription)")
                    }
                }
            }
        }
    }
}

struct ApiModelView_Previews: PreviewProvider {
    static var previews: some View {
        ApiModelView()
    }
}
