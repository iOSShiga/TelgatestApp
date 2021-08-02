//
//  ContentViewThree.swift
//  TelgatestApp
//
//  Created by Suresh Shiga on 02/08/21.
//

import SwiftUI

struct ContentViewThree: View {
    
    @State var emailTex:String = ""
    @State var presented:Bool = false
    @State var showAlert:Bool = false
    var nameText:String
    
    
    var body: some View {
        VStack {
            VStack {
                ScreenDesignView(subHeadlineText: "what's your email address?", buttonTitleText: "continue", textFieldText: $emailTex,buttonTapped: {
                    if self.emailTex.isEmpty {
                        self.showAlert = true
                    } else {
                    self.presented = true
                    }
                }, showMe: true).alert(isPresented: $showAlert) {
                        Alert(title: Text("Alert"), message: Text("please enter valid emailaddress"), dismissButton: .cancel())
                }
                Spacer()
                //Text(emailTex)
                Text("Some footer info " + self.emailTex)
            }.padding(.top, 40)
                .padding(.bottom, 40)
        
    
        }.fullScreenCover(isPresented: $presented) {} content: {
            
            // call API here...
            //self.postDataToWebservice()
           ContentViewFour()
        }
    }
    
    func postDataToWebservice()  {
        Webservice.postUserData(username: self.nameText, emailaddress: self.emailTex) { result in
            
            switch result {
            
        case .success(let userdata):
                print(userdata)
            
        case .failure( let errorMessage):
            switch errorMessage {
            case .inValidUrl:
                print("invalidURL")
            case .unableToComplete:
                print("unableToComplete")
            case .invalidResponse:
                print("invalidResponse")
            case .invalidData:
                print("invalidData")
            case .invalidModal:
                print("invalidModal")
            }
            
        }
    }
    }
}

struct ContentViewThree_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewThree(nameText: "")
    }
}
