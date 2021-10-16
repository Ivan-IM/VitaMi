//
//  InfoView.swift
//  VitaMi
//
//  Created by Иван Маришин on 11.08.2021.
//

import SwiftUI

struct InfoView: View {
    
    var body: some View {
        VStack(spacing: 15) {
            Spacer()
            Text("Добро пожаловать в лабораторию VitaMi.")
                .multilineTextAlignment(.center)
                .font(.system(size: 22, weight: .semibold, design: .rounded))
            Text("Нарушение баланса микроэлементов и витаминов в организме - очень распространенное явление, зачастую мы этого не замечаем или списываем на общую усталость, недостаток сна, энергетических ресурсов, плохое настроение. Однако данная симптоматика очень часто является следствием нарушение баланса в нашем организме.")
                .multilineTextAlignment(.center)
                .font(.system(size: 18, weight: .semibold, design: .rounded))
                .padding()
            Spacer()
            Text("Приложение не является полноценным диагностическим инструменом. Разработка данной системы направлена на привлечения внимания к дисбалансу рациона в современном мире, а также обратить внимание общества на беспорядочный прием биологически активных добавок, микроэлементов и витаминов.")
                .multilineTextAlignment(.center)
                .font(.system(size: 14, weight: .semibold, design: .rounded))
                .padding()
            Spacer()
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
