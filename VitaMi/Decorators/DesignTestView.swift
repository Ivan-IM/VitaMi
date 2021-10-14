//
//  DesignTestView.swift
//  VitaMi
//
//  Created by Иван Маришин on 11.08.2021.
//

import SwiftUI

struct DesignTestView: View {
    
    let coreDM: CoreDataManager = CoreDataManager()
    @EnvironmentObject var user: User
    @State private var showingDetail = false
    @State private var elements: [ElementCD] = [ElementCD]()
    
    var body: some View {
        ZStack {
            Color("background")
            VStack {
                Button {
                    //coreDM.saveElement(element: element)
                    coreDM.deleteElements(element: elements.last!)
                } label: {
                    Text("Save")
                }

                CustomButtonMainView(buttonTitle: "Button adsdasdasd", imageName: "leaf.circle", imageColor: Color.blue, action: {
                    elements = coreDM.getElements()
                }, width: 150, height: 150)
                List {
                ForEach(elements, id: \.self) { elem in
                    Text("\(elem.symbol ?? "")")
                    }
                }
            }
        }
    }
}

struct DesignTestView_Previews: PreviewProvider {
    static var previews: some View {
        DesignTestView()
            .preferredColorScheme(.light)
            .environmentObject(ViewChanger())
            .environmentObject(User())
    }
}
