//
//  LongPressGestures.swift
//  ContinueLearning
//
//  Created by Дарья Литвинова on 22.01.2026.
//

import SwiftUI

struct LongPressGestures: View {
    
    @State private var isComplete: Bool = false
    @State private var isSuccess: Bool = false
    
    var body: some View {
        VStack {
            Rectangle()
                .fill(isSuccess ? .green : .blue)
                .frame(height: 55)
                .frame(maxWidth: isComplete ? .infinity : 0)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.gray)
            
            HStack{
                Text("CLICK HERE")
                    .foregroundStyle(.white)
                    .padding()
                    .background(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 50) {
                        withAnimation(.easeInOut) {
                            isSuccess = true
                        }
                    } onPressingChanged: { isPressing in
                        if isPressing {
                            withAnimation(.easeInOut(duration: 1.0)) {
                                isComplete = true
                            }
                        } else {
                            if !isSuccess {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                    withAnimation(.easeInOut) {
                                        isComplete = false
                                    }
                                }
                            }
                        }
                    }

                
                Text("RESET")
                    .foregroundStyle(.white)
                    .padding()
                    .background(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            isComplete = false
                            isSuccess = false
                        }
                    }
            }
        }
    }
}

#Preview {
    LongPressGestures()
}
