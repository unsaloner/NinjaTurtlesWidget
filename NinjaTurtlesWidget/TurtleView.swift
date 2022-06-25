//
//  TurtleView.swift
//  NinjaTurtlesWidget
//
//  Created by Unsal Oner on 26.03.2022.
//

import SwiftUI

struct TurtleView: View {
    
    let turtle : NinjaTurtles
    
    
    var body: some View {
        
        HStack{
            ImageView(image: Image(turtle.image)).frame(width: 100, height: 100, alignment: .center).padding()
            Spacer()
            VStack{
                Text(turtle.name).font(.title).fontWeight(.bold).foregroundColor(.green)
                Text(turtle.characteristic).fontWeight(.bold)
            }.padding()
            Spacer()
        }.frame(width: UIScreen.main.bounds.width, alignment: .center)
    }
}
struct TurtleView_Previews: PreviewProvider {
    static var previews: some View {
        TurtleView(turtle: michaelangelo)
    }
}
