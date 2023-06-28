//
//  SessionManager.swift
//  ATKBank
//
//  Created by Mert ATK on 23.06.2023.
//

import Foundation
import FirebaseAuth
import Combine

class SessionManager: ObservableObject {
    @Published var isLoggedIn: Bool = false
    
    func signOut(){
        do{
            try Auth.auth().signOut()
            isLoggedIn = false
        }catch{
            print("Çıkış hatası \(error.localizedDescription)")
        }
    }
}
