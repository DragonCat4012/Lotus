//
//  EditEntrysScreen.swift
//  Lotus
//
//  Created by Kiara on 27.07.23.
//

import SwiftUI

struct EditEntrysScreen: View {
    @EnvironmentObject var vm: RootScreenModel
    
    var body: some View {
        List {
            Section {
                ForEach(vm.allEntries) { entry in
                    HStack {
                        Text(formatDate(entry.timestamp)) // TODO: show colors
                        Spacer()
                        Text(String(entry.value))
                    }.swipeActions {
                        Button {
                            vm.deleteEntry(entry)
                        } label: {
                            Image(systemName: "trash.fill")
                        } .tint(.red)
                    }
                }
            }
        header: {
            Text("editEntrys_title")
        } footer: {
            Text("editEntrys_footer")
        }
        }
    }
    
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter.string(from: date)
    }
}
