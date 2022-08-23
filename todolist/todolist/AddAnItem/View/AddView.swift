//
//  AddView.swift
//  todolist
//
//  Created by Victor Hugo Faioli Livio on 16/08/22.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: HomeListViewModel
    @State var textFieldText: String = ""
    
    let secondaryAccentColor = Color("SecondaryAccentColor")
    
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView{
            TextField("Digite aqui...", text: $textFieldText)
                .padding(.horizontal)
                .frame(height: 60)
                .background(Color(uiColor: .secondarySystemBackground))
                .cornerRadius(10)
            Button(action: {
              saveButtonPressed()
            }, label: {
                Text("Adicionar".uppercased())
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(secondaryAccentColor)
                    .cornerRadius(10)
            })

        }
        .padding(14)
        .navigationTitle("Adicionar Tarefa...")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() == true {
            viewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    
    // adicionar regra de verificacao de no minimo 3 caracteres por objeto.
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text("Afazeres"), message: Text("Sua tarefa deve conter pelo menos 3 caracteres."), dismissButton: .default(Text("OK")))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
    }
        .environmentObject(HomeListViewModel())
}
}
