//
//  ResultView.swift
//  VitaMi
//
//  Created by Иван Маришин on 04.07.2021.
//

import SwiftUI

struct ResultView: View {
    
    @EnvironmentObject var user: User
        
    var body: some View {
        VStack {
            Button(action: {
                print(self.user.symptomsList)
            }, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            })
            
        }
        .onAppear(){
            
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}
