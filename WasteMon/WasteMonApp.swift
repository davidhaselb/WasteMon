//
//  WasteMonApp.swift
//  WasteMon
//
//  Created by David Haselberger on 18.01.24.
//

import SwiftUI



@main
struct WasteMonApp: App {
    @State private var wm: Wastemon = Wastemon()
    @State var wasteForm: Bool = true
    
    
    
    
    var body: some Scene {
        #if os(macOS)
        Settings {
            ContentView()
        }
        #endif
        
        MenuBarExtra {
            Text("Show battery status as...")
            Button{ wasteForm = true } label:{
                HStack{
                    Image(systemName: "carbon.dioxide.cloud")
                    Text("...CO2 pollution (in kg)")
                }
            }
            Button{ wasteForm = false } label:{
                HStack{
                    Image(systemName: "atom")
                    Text("...atomic waste (in mg)")
                }
            }
            Divider()
            SettingsLink{
                       Text("Settings")
                  }
            Button("Quit"){
                NSApplication.shared.terminate(nil)
            }.keyboardShortcut("Q")
        } label:{
            HStack{
                if(wasteForm)
                {
                    Image(systemName: "carbon.dioxide.cloud")
                    Text(String(wm.co2Waste!) + " kg")
                } else{
                    Image(systemName: "atom")
                    Text(String(wm.atomicWaste!) + " mg")
                }
                
            }
        }.menuBarExtraStyle(.menu)
    
    }
    
    /*Settings {
          ContentView()
    }*/
    
    

    
    
}
