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
                .font(.title)
            
            DatePicker("Pick a date uwu", selection: $selectedDate, displayedComponents: [.date])
                .datePickerStyle(GraphicalDatePickerStyle())
            
            // TODO: pick a type
            
            Text("type")
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(CoreData.getTypes()) { type in
                        let color = Color(hexString: type.color)
                        RoundedRectangle(cornerRadius: 8)
                            .fill(color.opacity(0.3))
                            .frame(width: 50, height: 50)
                            .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .stroke(type == vm.selectedType ? color : .clear, lineWidth: 2)
                                )
                            .shadow(radius: 2)
                    }
                }
            }.padding(.bottom)
            
            
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
