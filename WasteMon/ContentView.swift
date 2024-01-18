//
//  ContentView.swift
//  WasteMon
//
//  Created by David Haselberger on 18.01.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("WasteMon - a different kind of battery information").bold()
            Text("")
            Text("CO2 calculation is based on:")
            Text("[this comment](https://www.quora.com/How-much-CO2-will-generate-when-1-kg-of-coal-is-burned)")
            Text("Atomic waste calculation based on:")
            Text("[this summary](https://whatisnuclear.com/calcs/how-much-nuclear-waste-per-capita.html)")
            Text("")
            Text("[Please get in contact, if there are more accurate measures](https://github.com)")
            Text("")
            Text("This software is open source and published unter the MIT License.")
            Text("See sourcecode for full MIT license text.")
            Text("")
            Text("Copyright (c) 2024 David Haselberger. All rights reserved.")
            Text("")
            Text("For more reliable battery information, check out:")
            Text("[Mac-Battery-Inspector](https://github.com/5j54d93/Mac-Battery-Inspector) by Ricky Chuang")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
