//
//  NoItemsView.swift
//  todolist
//
//  Created by Victor Hugo Faioli Livio on 22/08/22.
//

import SwiftUI

struct NoItemsView: View {
    
//    @State var animate: Bool = false
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
            Text("Não há nada pendente.")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.top, 40)
                Text("Adicione uma tarefa no botão correspondente.")
                    .padding(.bottom, 20)
                    .frame(maxWidth: 350)
                NavigationLink(
                    destination: AddView(),
                    label:  {
                    Text("Adicionar")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
//                        .background(animate ? secondaryAccentColor : Color.accentColor)
                        .cornerRadius(10)
                })
                .padding(.horizontal, 50)
//                .shadow(
//                    color: animate ? secondaryAccentColor.opacity(0.7): Color.accentColor.opacity(0.7),
//                    radius: animate ? 30 : 10,
//                    x: 0.0,
//                    y: animate ? 50 : 30)
//                .scaleEffect(animate ? 1.1 : 1.0)
//                .offset(y: animate ? -7 : 0)
        }
            .frame(maxWidth: 400)
        }
        .multilineTextAlignment(.center)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .onAppear(perform: addAnimation)
    }
    
//    func addAnimation() {
//        guard !animate else { return }
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
//            withAnimation(
//                Animation
//                    .easeInOut(duration: 2.0)
//                    .repeatForever()
//            ) {
//                animate.toggle()
//            }
//        }
//    }
    
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
        NoItemsView()
                .navigationTitle("Titulo")
    }
    }
}
