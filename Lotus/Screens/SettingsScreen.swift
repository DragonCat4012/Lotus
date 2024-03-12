//
//  SettingsScreen.swift
//  Lotus
//
//  Created by Kiara on 26.07.23.
//

import SwiftUI

struct SettingsScreen: View {
    @EnvironmentObject var vm: RootScreenModel
    
    var body: some View {
        List {
            
            if vm.editTypePresented {
                Section("settings_SectionEditTypes_title") {
                    TextField("settings_SectionEditTypes_typename", text: $vm.editTypeNme)
                    ColorPicker("settings_SectionEditTypes_color", selection: $vm.editSelectedColor, supportsOpacity: false)
                    
                    Button("settings_SectionEditTypes_saveButtonTitle") {
                        vm.saveTypeChanges()
                    }.listRowBackground(Color.primary).foregroundColor(Color.white)
                }
            }
            
            Section {
                HStack {
                    Text("settings_SectionEditTypes_exampleID")
                    Text("settings_SectionEditTypes_exampleName")
                    Spacer()
                    Text("settings_SectionEditTypes_exampleCount")
                }.foregroundColor(.gray)
                ForEach(vm.allTypes) { type in
                    HStack {
                        typeView(type)
                        Text(type.name)
                        Spacer()
                        Text(String(vm.getTilesCountForType(type: type)))
                    }.onTapGesture {
                        vm.selectTypeToEdit(type)
                    }
                    .swipeActions {
                        Button {
                            vm.selectTypeToEdit(type)
                        } label: {
                            Image(systemName: "pencil")
                        }
                        
                        if CoreData.getTypes().count > 1 {
                            Button {
                                vm.removeType(type: type)
                            } label: {
                                Image(systemName: "trash.fill")
                            } .tint(.red)
                        }
                    }
                }
                
                Button("settings_addnewtype") {
                    vm.addType()
                }.listRowBackground(Color.primary).foregroundColor(Color.white)
                
            } header: {
                Text("settings_section_alltypes")
            } footer: {
                Text("settings_section_alltypes_footer")
            }
            
            Section {
                Button("settings_section_editEntrys") {
                    vm.isEditEntriesScreenPresented = true
                }
            } footer: {
                Text("Version: " + appVersion)
            }
        }.sheet(isPresented: $vm.isEditEntriesScreenPresented) {
            EditEntrysScreen()
        }
    }
    
    func typeView(_ entry: Category) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .fill(Color(hexString: entry.color))
                .frame(width: 35, height: 25)
            Text(String(entry.rawValue))
                .frame(width: 35, height: 25)
        }
    }
}
