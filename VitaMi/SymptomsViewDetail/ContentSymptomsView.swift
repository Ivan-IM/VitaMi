//
//  ContentSymptomsView.swift
//  VitaMi
//
//  Created by Иван Маришин on 13.08.2021.
//

import SwiftUI

struct ContentSymptomsView: View {
    
    @EnvironmentObject var changer: ViewChanger
    @EnvironmentObject var userManager: UserManager
    @State private var index = 0
    @State private var downloadAmount = 0.0
    @State private var showingAlert = false
    @State private var startTesting = false
    
    var body: some View {
        VStack {
            Text(NSLocalizedString("Choose symptoms that have been bothering you lately and are atypical for your usual condition.", comment: ""))
                .multilineTextAlignment(.center)
                .font(.system(size: 22, weight: .semibold, design: .rounded))
                .foregroundColor(Color("text"))
            
            ProgressView("Symptom \(index+1)/\(userManager.symptomsCD.count)", value: Float(index)+1, total: Float(userManager.symptomsCD.count))
                .foregroundColor(Color("text"))
                .padding()
            
            Spacer()
            
            Text(userManager.symptomsCD[index].ruName ?? "")
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .multilineTextAlignment(.center)
                .foregroundColor(Color("text"))
            
            Spacer()
            
            HStack {
                CustomCircleButtonView(buttonTitle: NSLocalizedString("YES", comment: "")) {
                    if !startTesting {
                        showingAlert = true
                    }
                    else {
                        userManager.symptomsList.append(userManager.symptomsCD[index].enName ?? "")
                        if index < userManager.symptomsCD.count-1 {
                            index += 1
                        }
                        else {
                            index = userManager.symptomsCD.count-1
                            changer.mainViewChanger = .resultTestingView
                        }
                    }
                }
                Spacer()
                CustomCircleButtonView(buttonTitle: NSLocalizedString("NO", comment: "")) {
                    if !startTesting {
                        showingAlert = true
                    }
                    else {
                        if index < userManager.symptomsCD.count-1 {
                            index += 1
                        }
                        else {
                            index = userManager.symptomsCD.count-1
                            changer.mainViewChanger = .resultTestingView
                        }
                    }
                }
            }
        }
        .padding(32)
        .alert(isPresented: $showingAlert) {
            Alert(title: Text(NSLocalizedString("Start testing?", comment: "")), message: Text(NSLocalizedString("If you start testing the symptom list is cleared.", comment: "")), primaryButton: .destructive(Text("OK"), action: {
                userManager.symptomsList.removeAll()
                userManager.lowElementsList.removeAll()
                startTesting = true
            }), secondaryButton: .cancel())
        }
        .onAppear() {
            if userManager.symptomsList.isEmpty {
                startTesting = true
            }
            else { return }
        }
    }
}

struct ContentSymptomsView_Previews: PreviewProvider {
    static var previews: some View {
        ContentSymptomsView()
            .environmentObject(UserManager())
    }
}
