//
//  RootScreen.swift
//  Lotus
//
//  Created by Kiara on 19.07.23.
//

import SwiftUI
import CoreData

struct RootScreen: View {
    @EnvironmentObject var vm: RootScreenModel
    
    var body: some View {
        NavigationView {
            ZStack {
                
                VStack {
                    ZStack {
                        Image("backImage")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .rotationEffect(.degrees(-90))
                            .frame(height: 300)
                            .edgesIgnoringSafeArea(.top)
                        
                        header()
                        
                    }.padding(.bottom, 30)
                    
                    actionRow()
                    
                    Spacer()
                    
                    BarView()
                    
                    RankingView()
                    
                    buttons().padding(.bottom, 20)
                    
                }.ignoresSafeArea()
            }.ignoresSafeArea()
                .sheet(isPresented: $vm.isAddEntryScreenPresented) {
                    AddEntryScreen()
                }
                .sheet(isPresented: $vm.isSettingsScreenPresented) {
                    SettingsScreen()
                }
        }.navigationTitle("hmmm").onAppear(perform: vm.onAppear)
    }
    
    func actionRow() -> some View {
        HStack {
            Button("+") {
                vm.isAddEntryScreenPresented = true
            }.buttonStyle(PrimaryStyle()).frame(width: 50)
            
            Spacer()
            
            YearSelector()
            
        }.padding()
    }
    
    func header() -> some View {
        VStack {
            Text("Welcome Back")
                .foregroundColor(.white).font(.title)
                .padding()
                .padding(.top, 50)
            
            CalendarView()
                .padding()
        }
    }
    
    func buttons() -> some View {
        VStack {
            Button("Settings") {
                vm.isSettingsScreenPresented = true
            }.buttonStyle(PrimaryStyle())
        }.padding()
    }
    
    func headerBackground() -> some View {
        GeometryReader { geo in
            ZStack(alignment: .top) {
                Image("backImage")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .rotationEffect(.degrees(-90))
            }.frame(width: geo.size.width, height: 300)
        }
    }
}

struct RootScreen_Previews: PreviewProvider {
    static var previews: some View {
        RootScreen()
            .environmentObject(RootScreenModel())
    }
}
