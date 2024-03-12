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
                HStack {
                    Text("settings_SectionEditTypes_exampleDate")
                    Spacer()
                    Text("settings_SectionEditTypes_exampleID")
                }.foregroundColor(.gray)
                ForEach(vm.allEntries) { entry in
                    HStack {
                        Text(formatDate(entry.timestamp))
                        Spacer()
                        typeView(entry)
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
    
    func typeView(_ entry: MoodEntry) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(vm.getColorForEntry(entry))
                .frame(width: 35, height: 25)
            Text(String(entry.value))
                .frame(width: 35, height: 25)
        }
    }
    
    func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        return formatter.string(from: date)
    }
}
