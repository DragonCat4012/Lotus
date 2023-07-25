//
//  AddEntryScreen.swift
//  Lotus
//
//  Created by Kiara on 25.07.23.
//

import SwiftUI



struct AddEntryScreen : View {
    @State var selectedDate = Date()
    
    var body: some View {
        
        VStack {
            Text("Neuer Eintrag")
            
            DatePicker("Pick a date uwu", selection: $selectedDate)
            
            // TODO: pick a type
            
            Button("+") {
                CoreData.addItem(date: Date(), type: 0)
                // TODO: chekc that its a valid type
            }
        }.padding()
    }
}

struct AddEntryScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddEntryScreen()
    }
}
