//
//  AddEntryScreen.swift
//  Lotus
//
//  Created by Kiara on 25.07.23.
//

import SwiftUI



struct AddEntryScreen : View {
    @State var selectedDate = Date()
    @EnvironmentObject var vm: RootScreenModel
    
    var body: some View {
        
        VStack {
            Text("Neuer Eintrag")
            
            DatePicker("Pick a date uwu", selection: $selectedDate, displayedComponents: [.date])
                .datePickerStyle(GraphicalDatePickerStyle())
            
            // TODO: pick a type
            
            Text("type")
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<11) { i in
                        RoundedRectangle(cornerRadius: 8)
                            .frame(width: 50, height: 50)
                    }
                }
            }
            
            Button("Hinzufügen") {
                CoreData.addItem(date: selectedDate, type: 0)
                // TODO: chekc that its a valid type
                vm.isAddEntryScreenPresented = false
            }.buttonStyle(PrimaryStyle())
        }.padding()
    }
}

struct AddEntryScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddEntryScreen()
            .environmentObject(RootScreenModel())
    }
}
