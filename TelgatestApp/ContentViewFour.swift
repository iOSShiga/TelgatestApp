//
//  ContentViewFour.swift
//  TelgatestApp
//
//  Created by Suresh Shiga on 02/08/21.
//

import SwiftUI

struct ContentViewFour: View {
    
    @State var textFieldText:String = ""
    @State var presented:Bool = false
    
    var body: some View {
        VStack {
            VStack {
                ScreenDesignView(subHeadlineText: "thank you for joining us!", buttonTitleText: "share with frieds!", textFieldText: $textFieldText,buttonTapped: {
                    self.presented = true
                }, showMe: false)
                   
                //Spacer()
                //Text(textFieldText)
                //Text("Some footer info")
            }.padding(.top, 40)
                .padding(.bottom, 40)
        
    
        }.sheet(isPresented: $presented) {
            print("Dismiss")
        } content: {
            ActivityViewController(activityItems: ["thank you for joining us!!!!"])
        }

        
    }
    
    
}

struct ContentViewFour_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewFour()
    }
}


//MARK: Added UIActivityViewController from UIKit


struct ActivityViewController: UIViewControllerRepresentable {

    var activityItems: [Any]
    var applicationActivities: [UIActivity]? = nil

    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityViewController>) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        return controller
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityViewController>) {}

}

