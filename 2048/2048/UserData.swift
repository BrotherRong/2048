//
//  UserData.swift
//  2048
//
//  Created by 荣翔 on 2020/9/10.
//  Copyright © 2020 荣翔. All rights reserved.
//
import Foundation
import SwiftUI

var encoder = JSONEncoder()
var decoder = JSONDecoder()

class Main: ObservableObject{
    @Published var Cards : [Card]
    init() {
        self.Cards = []
        self.Cards.append(Card(number: 2, coordinates: (0,1), id: self.Cards.count))
        self.Cards.append(Card(number: 2, coordinates: (0,2), id: self.Cards.count))
    }
    
    
    func add(data:Card) {
        self.Cards.append(Card(number: data.number, coordinates: data.coordinates, id: self.Cards.count))
    }
    
    func rePlay()  {
        for item in self.Cards {
            self.Cards[item.id].deleted = true
        }
        self.Cards.append(Card(number: 2, coordinates: (0,1), id: self.Cards.count))
        self.Cards.append(Card(number: 2, coordinates: (0,2), id: self.Cards.count))
        
        highestScore = initUserData()
//        print(highestScore)
//                  print(score)
        if score>highestScore
        {
            dataStore()
            highestScore = score
//            print(highestScore)
//            print(score)

        }
        score = 0

    }
    
    
    func dataStore()  {
        UserDefaults.standard.setValue(score, forKey: "HighestScore")
    }

}

struct Card : Identifiable {
    var number : Int
    var coordinates : (x:CGFloat, y:CGFloat)
    var deleted :Bool = false
    var id : Int = 0
    
}


struct Score: Identifiable,Codable {
    var highestScore: Int = 0
    var id : Int = 0

}

