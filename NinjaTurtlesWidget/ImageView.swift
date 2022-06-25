//
//  ImageView.swift
//  NinjaTurtlesWidget
//
//  Created by Unsal Oner on 26.03.2022.
//

import SwiftUI

struct ImageView: View {
    var image : Image
    
    var body: some View {
        image.resizable().aspectRatio(contentMode: .fit).clipShape(Circle()).overlay(Circle().stroke(.green,lineWidth: 3 )).shadow(radius: 20)
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(image: Image("michaelangelo"))
        
    }
}
