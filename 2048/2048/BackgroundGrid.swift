//
//  BackgroundGrid.swift
//  2048
//
//  Created by 荣翔 on 2020/9/10.
//  Copyright © 2020 荣翔. All rights reserved.
//

import SwiftUI

struct BackgroundGrid: View {
    
    var length  = 4.5
    var spacing = 14
    var body: some View {
        GeometryReader{ geometry in
            VStack(spacing : CGFloat(self.spacing)) {
                ForEach(0..<4){ item in
                    HStack(spacing : CGFloat(self.spacing) ) {
                        ForEach(0..<4) {_ in
                            Rectangle().frame(width:geometry.size.width/CGFloat(self.length),height:geometry.size.height/CGFloat(self.length)).foregroundColor(.gray)
                            .cornerRadius(10)
                            
                        }
                    }
                }
            }
            
           
        }
        
    }
}

struct BackgroundGrid_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundGrid()
    }
}
