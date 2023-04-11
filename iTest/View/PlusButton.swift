//
//  PlusButton.swift
//  iTest
//
//  Created by Дмитрий Гордиенко on 09.04.2023.
//

import SwiftUI

struct PlusButton: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 40)
                .fill(Color(UIColor.secondarySystemBackground))
            Image(systemName: "plus")
                .resizable()
                .scaledToFit()
                .padding([.all], 50)
                .foregroundColor(Color(UIColor.systemBackground))
        }
        //.frame(width: 150, height: 150)
        .padding()
    }
}

struct PlusButton_Previews: PreviewProvider {
    static var previews: some View {
        PlusButton()
    }
}
