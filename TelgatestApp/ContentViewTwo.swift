    //
    //  ContentViewTwo.swift
    //  TelgatestApp
    //
    //  Created by Suresh Shiga on 02/08/21.
    //

    import SwiftUI

    struct ContentViewTwo: View {
        
        @State var nameText:String = ""
        @State var presented:Bool = false
        @State var showAlert:Bool = false
        
        var body: some View {
            VStack {
                VStack {
                    ScreenDesignView(subHeadlineText: "what's your name?", buttonTitleText: "continue", textFieldText: $nameText,buttonTapped: {
                        if (self.nameText.isEmpty) {
                            self.showAlert = true
                        } else {
                        self.presented = true
                        }
                    }, showMe: true).alert(isPresented: $showAlert) {
                        Alert(title: Text("Alert"), message: Text("please enter valid name"), dismissButton: .cancel())
                    }
                    Spacer()
                    //Text(nameText)
                    Text("Some footer info " + nameText)
                }.padding(.top, 40)
                    .padding(.bottom, 40)
            
        
            }.fullScreenCover(isPresented: $presented) {} content: {
            ContentViewThree(nameText: nameText)
            }

        }
    }

    struct ContentViewTwo_Previews: PreviewProvider {
        static var previews: some View {
            ContentViewTwo()
        }
    }




