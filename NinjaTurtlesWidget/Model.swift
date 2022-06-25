//
//  Model.swift
//  NinjaTurtlesWidget
//
//  Created by Unsal Oner on 26.03.2022.
//

import Foundation

struct NinjaTurtles : Identifiable, Codable {
    
    var id : String {image}
    
    let image : String
    let name : String
    let characteristic : String
    
}


let donatello = NinjaTurtles(image: "donatello", name: "Donatello", characteristic: "Scientist")
let leonardo = NinjaTurtles(image: "leonardo", name: "Leonardo", characteristic: "Leader")
let michaelangelo = NinjaTurtles(image: "michaelangelo", name: "Michaelangelo", characteristic: "Funny")
let raphael = NinjaTurtles(image: "raphael", name: "Raphael", characteristic: "Bad Boy")
