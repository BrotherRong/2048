//
//  AddNewCard.swift
//  2048
//
//  Created by 荣翔 on 2020/9/10.
//  Copyright © 2020 荣翔. All rights reserved.
//

import SwiftUI

extension Main {
    func isFull() -> Bool{
        for i in 0 ..< 4{
            for j in 0 ..< 4 {
                if self.Cards.firstIndex(where: {
                    let coor = $0.coordinates
                    return Int(coor.x) == i && Int(coor.y) == j && !$0.deleted
                }) == nil {
                    return false
                }
            
            }
        }
        return true
    }
    
    
    func addNewCard() ->Bool {
        if isFull(){
            return false
        }else {
            var Xcoor = arc4random()%4
            var Ycoor = arc4random()%4
            
            while self.Cards.firstIndex(where:{
                let coor = $0.coordinates
                return Int(coor.x) == Xcoor && Int(coor.y) == Ycoor && !$0.deleted
            }) != nil {
                Xcoor = arc4random()%4
                Ycoor = arc4random()%4
            }
            self.add(data: Card(number:2,coordinates:(CGFloat(Xcoor),CGFloat(Ycoor))))
            return true

        }
    }
}
