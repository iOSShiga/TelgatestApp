    //
    //  ContentView.swift
    //  TelgatestApp
    //
    //  Created by Suresh Shiga on 02/08/21.
    //

    import SwiftUI

    struct ContentView: View {
        
        @State var textFieldText:String = ""
        @State var presented:Bool = false
        
        var body: some View {
            
        VStack {
                
                VStack {
                    
                    ScreenDesignView(subHeadlineText: "some punchline", buttonTitleText: "get started", textFieldText: $textFieldText,buttonTapped: {
                        self.presented = true
                    }, showMe: false)
                    
                    Spacer()
                    
                    Text("Some footer info")
                    
                }.padding(.top, 40)
                    .padding(.bottom, 40)
            
        
            }.fullScreenCover(isPresented: $presented) {        } content: {
               ContentViewTwo()
            }


        }
    }

//MARK: content preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//MARK: reusable screen design

    struct ScreenDesignView: View {
        var screenWidth:CGFloat = UIScreen.main.bounds.width - 40;
         var subHeadlineText:String = ""
         var buttonTitleText: String = ""
         @Binding var textFieldText: String
         var buttonTapped:()->()
         @State var showMe:Bool = true
        
        
        var body: some View {
                VStack {
                    VStack(spacing:5.0) {
                        Text("logo")
                            .font(.system(size: 50.0))
                        Text(subHeadlineText)
                            .font(.system(size: 20.0))
                    }.padding(.bottom, 40)
                        VStack {
                            if(showMe) {
                                TextField("", text: $textFieldText)
                                    .frame(width: screenWidth, height: 50)
                                    .background(Color.gray)
                                    .cornerRadius(10.0)
                                    .padding(10)
                            }
                            
                            
                            Button (action:buttonTapped, label: {
                                Text(buttonTitleText)
                                    .foregroundColor(.white)
                                    .frame(width: screenWidth, height: 50)
                                        .background(Color.blue)
                                        .cornerRadius(10.0)
                            })
                        }
                }
        }
    }



    
