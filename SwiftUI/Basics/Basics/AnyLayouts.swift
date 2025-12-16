//
//  AnyLayouts.swift
//  Basics
//
//  Created by Дарья Литвинова on 14.12.2025.
//

import SwiftUI

struct AnyLayouts: View {
    
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    @Environment(\.verticalSizeClass) private var verticalSizeClass
    
    var body: some View {
        VStack(spacing: 12) {
            // тут все зависит от устройства, на 14 Pro например, даже в горизонтальном положении horizontalSizeClass = compact, а в max уже reqular
            // https://useyourloaf.com/blog/size-classes/ тут можно почитать
            Text("Horizontal: \(horizontalSizeClass.debugDescription)")
            Text("Vertical: \(verticalSizeClass.debugDescription)")
            
//            if horizontalSizeClass == .compact {
//                VStack {
//                    Text("Aplha")
//                    Text("Beta")
//                    Text("Gamma")
//                }
//            } else {
//                HStack {
//                    Text("Aplha")
//                    Text("Beta")
//                    Text("Gamma")
//                }
//            }
            
            let layout: AnyLayout = horizontalSizeClass == .compact ? AnyLayout(VStackLayout()) : AnyLayout(HStackLayout())
            
            layout {
                Text("Aplha")
                Text("Beta")
                Text("Gamma")
            }
        }
    }
}

#Preview {
    AnyLayouts()
}
