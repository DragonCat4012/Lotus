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
                ForEach(vm.allTypes) { type in
                    HStack {
                        Text(String(type.rawValue)).foregroundColor(.gray)
                        Image(systemName: "heart.rectangle.fill")
                            .foregroundColor(Color(hexString: type.color))
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
}
