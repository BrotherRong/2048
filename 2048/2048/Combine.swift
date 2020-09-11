//
//  Combine.swift
//  2048
//
//  Created by 荣翔 on 2020/9/10.
//  Copyright © 2020 荣翔. All rights reserved.
//

import SwiftUI

extension Main{

    func combine(in direction:Move){
        let selection = self.sort(in: direction)
        for i in selection {
            if !self.Cards[i].deleted {
                if let index = self.Cards.firstIndex(where: {
                    data in
                    var position  = self.Cards[i].coordinates
                    position.x += CGFloat(travel(in: direction).x)
                    position.y += CGFloat(travel(in: direction).y)
                    return position == data.coordinates && self.Cards[i].number == data.number && !data.deleted
                }){
                    self.Cards[i].coordinates.x +=  CGFloat(travel(in: direction).x)
                    self.Cards[i].coordinates.y +=  CGFloat(travel(in: direction).y)
                    self.Cards[index].number *= 2
                    self.Cards[i].deleted = true
                    score += self.Cards[index].number
//                    dataStore()
//                    highestScore = initUserData()
//                    NSLog("%ld",highestScore)
                }
            }
            
            
        }
    }
    
    func moveAndCombine(in direction:Move)  {
        self.move(in: direction)
        self.combine(in: direction)
        self.move(in: direction)
    }
    
}

struct Combine_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
