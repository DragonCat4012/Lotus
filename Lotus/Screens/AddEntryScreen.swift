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
            
            
            Text("type")
                .frame(maxWidth: .infinity)
                .foregroundColor(.gray)
            // TODO: align left
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(CoreData.getTypes()) { type in
                        let color = Color(hexString: type.color)
                        RoundedRectangle(cornerRadius: 8)
                            .fill(color)
                            .frame(width: 50, height: 50)
                            .overlay(
                                        Text(String(type.rawValue))
                                )
                            .offset(y: type == vm.selectedType ? 0 : 20)
                            .shadow(radius: 2)
                            .onTapGesture {
                                vm.selectedType = type
                            }
                    }
                }
            }.padding(.bottom)
            
            
            Button("Hinzufügen") {
                CoreData.addItem(date: selectedDate, type: vm.selectedType.rawValue)
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
