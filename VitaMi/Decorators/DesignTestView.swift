//
//  DesignTestView.swift
//  VitaMi
//
//  Created by Иван Маришин on 11.08.2021.
//

import SwiftUI

struct DesignTestView: View {
    
    let coreDM: CoreDataManager = CoreDataManager()
    let element: Element = Element(id: "asifjoe", symbol: "Na", enName: "Sodium", ruName: "Натрий", type: "microel", elementInfo: "натрий бал-бла", ruProductInfo: ["соль", "уголь"], normalValue: [0.5, 0.8], value: 0.6, measure: "mmol.l", helper: ["H", "E"], blocker: ["B", "L"])
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
                
                ForEach(elements, id: \.self) { elem in
                    List(elem.normalValue!, id: \.self) { inf in
                        Text("\(inf)")
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
