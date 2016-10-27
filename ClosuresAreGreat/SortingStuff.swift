//
//  SortingStuff.swift
//  ClosuresAreGreat
//
//  Created by Jim Campagno on 10/25/16.
//  Copyright © 2016 Gamesmith, LLC. All rights reserved.
//

import Foundation


struct ToyBin {
    
    var ships: [Ship] = []
    var books: [Book] = []
    var bowlingPins: [BowlingPin] = []
    var musicCDs: [MusicCD] = []
    
    // TODO: Implement all of the sort functions (lets organize this toy bin!)
    
    mutating func sortShips() -> [Ship] {
        
        ships = ships.sorted(by: {$0.age > $1.age})
        for (index, ship) in ships.enumerated() {
            if ship.name == "Titanic" {
                let titanic = ships.remove(at: index)
                ships.insert(titanic, at: 0)
            }
        }
        return ships
    }
    
    mutating func sortBooks() -> [Book] {
        return books.sorted(by: { $0.name < $1.name })
    }
    
    mutating func sortBowlingPins() -> [BowlingPin] {
        return bowlingPins.sorted(by: { $0.color.rawValue < $1.color.rawValue })
    }
    
    mutating func sortMusicCDs() -> [MusicCD] {
        
        musicCDs = musicCDs.sorted(by: {$0.name > $1.name })
        for (index, music) in musicCDs.enumerated() {
            if music.name == "Drake" {
                let drake = musicCDs.remove(at: index)
                musicCDs.insert(drake, at: 0)
            }
        }
        return musicCDs
    }
    
    mutating func changeColorOfAllPins(to color: Color) -> [BowlingPin] {
        return bowlingPins.map({ pin in
            var newPin = pin
            newPin.changeColor(to: color)
            return newPin
        })
    }
 
}


struct Ship {
    var name: String
    var age: Int
}


struct Book {
    var name: String
    var year: Int
    var author: String
}


struct BowlingPin {
    var name: String
    var film: String
    var color: Color
    
    mutating func changeColor(to color: Color) {
        self.color = color
    }
    
}


enum Color: Int {
    case red, organe, yellow, green, blue, indigo, violet
}



struct MusicCD {
    var name: String
    var year: Int
    var songs: [String]
}
