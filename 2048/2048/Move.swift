//
//  Move.swift
//  2048
//
//  Created by 荣翔 on 2020/9/10.
//  Copyright © 2020 荣翔. All rights reserved.
//

import SwiftUI

enum Move {
    case up
    case down
    case left
    case right
}

func travel(in direction:Move) ->  (x:Int ,y:Int) {
    switch direction {
    case .up:
        return (0,-1)
    case .down:
        return (0,1)
    case .left:
        return (-1,0)
    case .right:
        return (1,0)
    
    }
}

extension Main{
    func haveSpace(id:Int,in direction :Move) -> Bool {
        var position  = self.Cards[id].coordinates
        position.x +=  CGFloat(travel(in: direction).x)
        position.y +=  CGFloat(travel(in: direction).y)
        if position.x<=3&&position.x>=0 && position.y<=3&&position.y>=0 {
           if self.Cards.firstIndex(where: {
                data in
            data.coordinates.x == position.x && data.coordinates.y == position.y && !data.deleted
           }) == nil {
            return true
            }
        }
        return false
    }
    
    func sort(in direction:Move) ->[Int] {
        var temp = self.Cards
        temp.sort(by: {(data1,data2) in
            switch direction {
            case .up:return data1.coordinates.y < data2.coordinates.y
            case .down:return data1.coordinates.y > data2.coordinates.y
            case .left:return data1.coordinates.x < data2.coordinates.x
            case .right:return data1.coordinates.x > data2.coordinates.x
            }
        })
        
        var selection:[Int] = []
        for item in temp {
            selection.append(item.id)
        }
        return selection
    }
    
    func move(in direction:Move)  {
        let selection = self.sort(in: direction)
        for i in selection {
            while self.haveSpace(id: i, in: direction){
                self.Cards[i].coordinates.x += CGFloat(travel(in: direction).x)
                self.Cards[i].coordinates.y += CGFloat(travel(in: direction).y)

            }
        }
    }
}
