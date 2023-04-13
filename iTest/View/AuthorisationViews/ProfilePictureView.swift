// Created for iTest on 13.04.2023
//  ProfilePictureView.swift
//  iTest
//
//
//    dmgordienko@gmail.com 2023

import SwiftUI

struct ProfilePictureView: View {
    @State var image: Image
    @State var size: CGFloat
    
    init(image: Image, size: CGFloat) {
        let optimalSize = min(size, UIScreen.main.bounds.height * 0.55 ,UIScreen.main.bounds.width * 0.55)
        self._image = State(initialValue: image)
        self._size = State(initialValue: optimalSize)
    }
    
    var body: some View {
        VStack(alignment: .center) {
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: size, height: size)
                .cornerRadius(size)
                .padding()
                .background(Circle()
                    .fill(Color(UIColor.systemBackground)))
        }
    }
}


struct ProfilePictureView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePictureView(image: Image(systemName: "person.fill"), size: 400)
                                    .padding()
    }
}
