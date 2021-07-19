//
//  BiochemicalAnalysisView.swift
//  VitaMi
//
//  Created by Иван Маришин on 18.07.2021.
//

import SwiftUI

struct BiochemicalAnalysisView: View {
    
    @EnvironmentObject var user: User
    
    var body: some View {
        TabView {
            Text("Dev")
                .tabItem {
                    Image(systemName: "eyedropper.halffull")
                    Text("BioAnalysis")
                }
            ResultTestingView()
                .tabItem {
                    Image(systemName: "doc.text")
                    Text("Result")
                }
        }
        .navigationTitle("Biochemical Analysis")
    }
}

struct BiochemicalAnalysisView_Previews: PreviewProvider {
    static var previews: some View {
        BiochemicalAnalysisView()
    }
}
