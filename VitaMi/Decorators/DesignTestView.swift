//
//  DesignTestView.swift
//  VitaMi
//
//  Created by Иван Маришин on 11.08.2021.
//

import SwiftUI

struct DesignTestView: View {
    @EnvironmentObject var user: User
    @State private var showingDetail = false
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                ForEach(user.elements) { element in
                    if user.lowElementsList.contains(element.symbol) {
                        Button(action: {
                            showingDetail.toggle()
                        }, label: {
                            HStack {
                                Text(element.ruName)
                                    .foregroundColor(Color(.systemGray))
                                Spacer()
                                Image(systemName: "questionmark.circle")
                            }
                            .font(.system(size: 20, weight: .semibold, design: .rounded))
                            .padding(10)
                        })
                        .sheet(isPresented: $showingDetail, content: {
                        })
                        .frame(height: 40)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(.systemGray)))
                        .padding(.vertical, 2.0)
                        .padding(.horizontal, 10.0)
                    }
                }
                .padding(.vertical, 25)
                .padding(.horizontal, 15)
            }
            .navigationBarHidden(true)
            .background(ContentCardView())
        }
    }
}

struct DesignTestView_Previews: PreviewProvider {
    static var previews: some View {
        DesignTestView()
            .environmentObject(ViewChanger())
            .environmentObject(User())
    }
}
