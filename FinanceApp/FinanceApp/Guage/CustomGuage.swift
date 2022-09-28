//
//  CustomGuage.swift
//  FinanceApp
//
//  Created by Harsh Yadav on 03/07/22.
//

import SwiftUI

struct CustomGuage: View {
    var body: some View {
        VStack{
            Text("Hello, World!")
            
            guage()
                .scaledToFit()
            
            
//            let arc = UIBezierPath(arcCenter: CGPoint(x: 0, y: 0),
//                                          radius: 60,
//                                          startAngle: .pi ,
//                                          endAngle: 0.2,
//                                          clockwise: true)
//
//            Path(arc.cgPath).foregroundColor(Color.blue)
        }
    }
}

struct CustomGuage_Previews: PreviewProvider {
    static var previews: some View {
        CustomGuage()
    }
}


struct guage:Shape{
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX+50, y: rect.maxY))
        
        path.addQuadCurve(to: CGPoint(x: rect.maxX-50, y: rect.maxY), control: CGPoint(x: rect.midX, y: rect.minY + 25))
        

//        path.addArc(center: CGPoint(x: 100, y:100), radius: 50, startAngle: .degrees(0), endAngle: .degrees(90), clockwise: true)

        return path.strokedPath(.init(lineWidth: 3, dash: [5, 3], dashPhase: 10))
    }
}
