//
//  ContentView.swift
//  NinjaTurtlesWidget
//
//  Created by Unsal Oner on 26.03.2022.
//

import SwiftUI
import WidgetKit

let turtleArray = [donatello,michaelangelo,raphael,leonardo]
struct ContentView: View {
    
    @AppStorage("turtle", store: UserDefaults(suiteName: "group.com.unsaloner.NinjaTurtlesWidget"))
    
    var turtleData : Data = Data()
    
    var body: some View {
        VStack{
            ForEach(turtleArray){ turtle in
                TurtleView(turtle: turtle).onTapGesture(count: 1) {
                    saveToDefaults(turtle: turtle)
                }
                
            }
        }
    }
    func saveToDefaults(turtle: NinjaTurtles) {
        if let saveTurtle = try? JSONEncoder().encode(turtle) {
            self.turtleData = saveTurtle
            WidgetCenter.shared.reloadTimelines(ofKind: "TurtlesWidget")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
