//
//  Grids.swift
//  Basics
//
//  Created by Дарья Литвинова on 15.12.2025.
//

import SwiftUI

struct Grids: View {
    var body: some View {
        Grid(alignment: .center, horizontalSpacing: 0, verticalSpacing: 10) {
            ForEach(0..<4) { rowIndex in
                GridRow {
                    ForEach(0..<4) { columnIndex in
                        let cellNumber = rowIndex * 4 + (columnIndex + 1)
                        if cellNumber == 7 {
                            EmptyView()
                            // занимает все простанство которое может
                            //Color.green
                            //Color.clear
                            //    // вот так можно ограничить
                             //   .gridCellUnsizedAxes([.vertical,.horizontal])
                        } else {
                            cell(int: cellNumber)
                            // сколько ячеек занимает ячейка, тут 6 ячейка занимает место двух
                                .gridCellColumns(cellNumber == 6 ? 2 : 1)
                            // как выровняить вью в внутри границ ее ячейки
                                .gridCellAnchor(.top)
                            // задает выравнивание столбца
                                .gridColumnAlignment(
                                    cellNumber == 1 ? .trailing :
                                        cellNumber == 4 ? .leading :
                                            .center
                                )
                        }
                    }
                }
            }
        }
    }
    
    private func cell(int: Int) -> some View {
        Text("\(int)")
            .frame(height: int == 10 ? 20 : nil)
            .font(.largeTitle)
            .padding()
            .background(.indigo)
            .foregroundStyle(.white)
    }
}

#Preview {
    Grids()
}
