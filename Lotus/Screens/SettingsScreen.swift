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
                Section("Edit Type") {
                    TextField("Typename", text: $vm.editTypeNme)
                    ColorPicker("Shape 1 color", selection: $vm.editSelectedColor, supportsOpacity: false)
                    
                    Button("save changes") {
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
                            Button() {
                                vm.removeType(type: type)
                            } label: {
                                Image(systemName: "trash.fill")
                            } .tint(.red)
                        }
                    }
                }
                
                Button("Add new type") {
                    vm.addType()
                }.listRowBackground(Color.primary).foregroundColor(Color.white)
                
            } header: {
                Text("All Types")
            } footer: {
                Text("Swipe to edit types")
            }
            
            Section {
                Button("Edit entrys") {
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
