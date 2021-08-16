//
//  ContentSymptomsView.swift
//  VitaMi
//
//  Created by Иван Маришин on 13.08.2021.
//

import SwiftUI

struct ContentSymptomsView: View {
    
    @EnvironmentObject var changer: ViewChanger
    @EnvironmentObject var user: User
    @State private var index = 0
    @State private var downloadAmount = 0.0
    @State private var showingAlert = false
    @State private var startTesting = false
    
    var body: some View {
        VStack {
            Text("Сhoose the symptoms that bother you regularly lately")
                .multilineTextAlignment(.center)
                .font(.system(size: 25, weight: .semibold, design: .rounded))
            
            ProgressView("Question \(index+1)/\(Symtom.getSymptomsList().count)", value: Float(index)+1, total: Float(Symtom.getSymptomsList().count))
                .padding()
            
            Spacer()
            
            Text(Symtom.getSymptomsList()[index].ruName)
                .font(.system(size: 20, weight: .semibold, design: .rounded))
            
            Spacer()
            
            HStack {
                CustomCircleButtonView(buttonTitle: "YES") {
                    if !startTesting {
                        showingAlert = true
                    }
                    else {
                        user.symptomsList.append(Symtom.getSymptomsList()[index].enName)
                        if index < Symtom.getSymptomsList().count-1 {
                            index += 1
                        }
                        else {
                            index = Symtom.getSymptomsList().count-1
                            changer.mainViewChanger = .resultTestingView
                        }
                    }
                }
                Spacer()
                CustomCircleButtonView(buttonTitle: "NO") {
                    if !startTesting {
                        showingAlert = true
                    }
                    else {
                        if index < Symtom.getSymptomsList().count-1 {
                            index += 1
                        }
                        else {
                            index = Symtom.getSymptomsList().count-1
                            changer.mainViewChanger = .resultTestingView
                        }
                    }
                }
            }
        }
        .padding(48)
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Start testing?"), message: Text("If you start the test the list of symptoms will clear"), primaryButton: .destructive(Text("Ok"), action: {
                user.symptomsList.removeAll()
                user.lowElementsList.removeAll()
                startTesting = true
            }), secondaryButton: .cancel())
        }
        .onAppear() {
            if user.symptomsList.isEmpty {
                startTesting = true
            }
            else { return }
        }
    }
}

struct ContentSymptomsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentSymptomsView()
            .environmentObject(User())
    }
}
