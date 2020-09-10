//
//  ContentView.swift
//  2048
//
//  Created by 荣翔 on 2020/9/10.
//  Copyright © 2020 荣翔. All rights reserved.
//

import SwiftUI

let maxWidth = UIScreen.main.bounds.width
let maxHeight = UIScreen.main.bounds.height

func abs(_ ip :CGFloat) -> CGFloat{
    return ip>0 ? ip : -ip
}

struct ContentView: View {
    @State var coordinates:(x:Int,y:Int) = (0,0)
    @State var losing = false
    @ObservedObject var UserData : Main = Main()
        
    var SwipGesture : some Gesture {
        DragGesture()
      .onEnded({position in
          let direction = position.translation
          withAnimation(.spring())
          {
             if abs(direction.width) < abs(direction.height) {
                 direction.height<0 ? self.UserData.moveAndCombine(in: .up) :self.UserData.moveAndCombine(in: .down)
             }
             else {
                 direction.width<0 ? self.UserData.moveAndCombine(in: .left) :self.UserData.moveAndCombine(in: .right)
             }
              if !self.UserData.addNewCard() {
                  self.losing = true
              }
          }
          
         
      })
    }
    
    var body: some View {
        ZStack {
            VStack {
//                Form{
//
//                    Stepper(value: self.$coordinates.x, in:0...3) {
//                        Text("横坐标\(self.coordinates.x)")
//                    }
//                    Stepper(value: self.$coordinates.y, in:0...3) {
//                        Text("纵坐标\(self.coordinates.y)")
//                    }

                ZStack{
                    BackgroundGrid()
                        .gesture(self.SwipGesture)
                    ForEach(self.UserData.Cards){ item  in
                        if !item.deleted {
                            SingleCard(card: item)
                            .environmentObject(self.UserData)
                            .animation(.spring())
                                .transition(.opacity)                      .gesture(self.SwipGesture)

                        }
                    }
                  
    //                Image(systemName: "pencil").resizable().onTapGesture {
    //                    self.UserData.moveAndCombine(in: .right)
    //                }
                }.frame(width:min(maxWidth,maxHeight)*0.8,height: min(maxWidth,maxHeight)*0.8).alert(isPresented: self.$losing, content: {Alert(title:Text("你输了"),message: Text("重新开始"),dismissButton: Alert.Button.cancel({
                    self.UserData.rePlay()
                }))
                    
                })
                
            }
            VStack {
                Spacer()
                  Button(action:{
                      self.UserData.rePlay()
                  }){
                    Image(systemName: "arrow.counterclockwise").imageScale(.large).padding()
                  }
                }
        }
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
