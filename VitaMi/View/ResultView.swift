//
//  ResultView.swift
//  VitaMi
//
//  Created by Иван Маришин on 04.07.2021.
//

import SwiftUI

struct ResultView: View {
    
    @EnvironmentObject var user: User
    @State var elements: Array<String> = []
        
    var body: some View {
        VStack {
            Button(action: {
                print(elements)
            }, label: {
                /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
            })
            
        }
        .onAppear(){
            for symptom in Symtom.getSymptomsList() {
                if self.user.symptomsList.contains(symptom.enName) {
                    elements.append(contentsOf: symptom.elements)
                }
            }
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}
