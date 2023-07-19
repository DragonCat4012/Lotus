//
//  RootView.swift
//  Lotus
//
//  Created by Kiara on 19.07.23.
//

import SwiftUI
import CoreData

struct RootView: View {
    @State var isStatsScreenPresented = false
    
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
                    
                    buttons().padding(.bottom, 20)
                    
                }.ignoresSafeArea()
            }.ignoresSafeArea()
                .sheet(isPresented: $isStatsScreenPresented){
                    StatsScreen()
                }
        }.navigationTitle("hmmm")
    }
    
    func actionRow() -> some View {
        HStack {
            Button("+") {
                
            }.buttonStyle(PrimaryStyle()).frame(width: 50)
            
            Spacer()
            
            Text("<< 2022 > >")
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
            Button {
                isStatsScreenPresented = true
            } label: {
                Text("Stats")
            }.buttonStyle(PrimaryStyle())
            
            Button("Settings") {
                
            }.buttonStyle(SecondaryStyle())
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

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
