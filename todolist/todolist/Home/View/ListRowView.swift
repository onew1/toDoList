//
//  ListRowView.swift
//  todolist
//
//  Created by Victor Hugo Faioli Livio on 15/08/22.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    let colorList = Color("List")
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
            Text(item.title)
            Spacer()
        }
        .foregroundColor(item.isCompleted ? .gray : colorList)
        .font(.title2)
        .padding(.vertical, 8)
    }
    
}
