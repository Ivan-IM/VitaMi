//
//  AnalysisView.swift
//  VitaMi
//
//  Created by Иван Маришин on 10.10.2021.
//

import SwiftUI

struct AnalysisView: View {
    
    @EnvironmentObject var changer: ViewChanger
    @EnvironmentObject var userManager: UserManager
    @State private var showingClearAlert = false
    @State private var showingUpdateAlert: Bool = false
    @State private var showingResultAlert: Bool = false
    
    private let width = UIScreen.main.bounds.size.width
    private let height = UIScreen.main.bounds.size.height
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 16).stroke(Color.gray.opacity(0.5))
                    .frame(height: 50)
                Text(NSLocalizedString("The result of laboratory analysis", comment: ""))
                    .multilineTextAlignment(.center)
                    .font(.system(size: 20, weight: .semibold, design: .rounded))
                    .foregroundColor(Color("text"))
            }
            .padding(.horizontal, 16)
            .padding(.top, 16)
            ZStack {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color.clear)
                    .overlay(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).stroke(Color.white, lineWidth: 2))
                    .padding()
                HealthyImageView()
                    .opacity(userManager.elementsAnalysis.isEmpty ? 0.7:0)
                ScrollViewAnalysisView()
                    .padding()
                    .opacity(userManager.elementsAnalysis.isEmpty ? 0:1)
                Button {
                    showingResultAlert.toggle()
                } label: {
                    Image(systemName: "checkmark.circle")
                        .font(.system(size: 30, weight: .bold))
                        .imageScale(.large)
                        .foregroundColor(Color.green)
                }
                .shadow(color: .gray, radius: 15, x: 10, y: 10)
                .disabled(userManager.elementsAnalysis.isEmpty ? true:false)
                .opacity(userManager.elementsAnalysis.isEmpty ? 0:0.8)
                .position(x: width*0.2, y: height*0.65)
                .alert(isPresented: $showingResultAlert) {
                    Alert(title: Text(NSLocalizedString("Getting the result", comment: "")), message: Text(NSLocalizedString("You have entered micronutrient and vitamin deficiency analysis data. Update test results?", comment: "")), primaryButton: .destructive(Text("OK"), action: {
                        userManager.showFinalResult = true
                        changer.mainViewChanger = .resultTestingView
                    }), secondaryButton: .cancel())
                }
                Button {
                    showingUpdateAlert.toggle()
                } label: {
                    Image(systemName: "checkmark.circle.trianglebadge.exclamationmark")
                        .font(.system(size: 30, weight: .regular))
                        .imageScale(.large)
                        .foregroundColor(Color.orange)
                }
                .shadow(color: .gray, radius: 15, x: 10, y: 10)
                .disabled(userManager.elementsAnalysis == userManager.lowElementsList ? true:false)
                .opacity(userManager.elementsAnalysis == userManager.lowElementsList ? 0:0.8)
                .position(x: width*0.8, y: height*0.65)
                .alert(isPresented: $showingUpdateAlert) {
                    Alert(title: Text(NSLocalizedString("Attention!", comment: "")), message: Text(NSLocalizedString("Symptom selection and test result changed. Would you like to update the list of trace elements and vitamins for analysis?", comment: "")), primaryButton: .destructive(Text("OK"), action: {
                        userManager.elementsAnalysis.removeAll()
                        userManager.elementsAnalysis = userManager.lowElementsList
                    }), secondaryButton: .cancel())
                }
            }
            HStack {
                CustomButtonView(buttonTitle: NSLocalizedString("Back", comment: ""), action: {
                    changer.mainViewChanger = .mainView
                }, width: 160, height: 50)
                Spacer()
                CustomButtonView(buttonTitle: NSLocalizedString("Clear", comment: ""), action: {
                    showingClearAlert.toggle()
                }, width: 160, height: 50)
            }
            .padding(.horizontal,16)
            .alert(isPresented: $showingClearAlert) {
                Alert(title: Text(NSLocalizedString("Clear", comment: "")), message: Text(NSLocalizedString("Are you sure you want to reset the last test results? This will result in the loss of lab data.", comment: "")), primaryButton: .destructive(Text("OK"), action: {
                    userManager.elementsAnalysis.removeAll()
                    userManager.showFinalResult = false
                    userManager.clearCDElemantValue()
                }), secondaryButton: .cancel())
            }
            .onAppear {
                if userManager.elementsAnalysis.isEmpty {
                    userManager.showFinalResult = false
                    userManager.elementsAnalysis = userManager.lowElementsList
                }
            }
        }
        .padding(.bottom, 16)
    }
}

struct AnalysisView_Previews: PreviewProvider {
    static var previews: some View {
        AnalysisView()
            .environmentObject(ViewChanger())
            .environmentObject(UserManager())
    }
}
