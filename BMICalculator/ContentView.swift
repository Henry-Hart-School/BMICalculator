//
//  ContentView.swift
//  BMICalculator
//
//  Created by David Cormell on 23/02/2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var state: GlobalState
    
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    @State private var counter = 0
    
    @State private var backColor = Color.init(UIColor(rgb: 0xFFFF00))
    
    var body: some View {
        VStack {
            Image("PublicHealth").scaledToFit()
            Spacer()
            List {
                HStack {
                    Button {
                        state.setInputToMetric()
                    } label: {
                        Text("Metric")
                    }.buttonStyle(BorderlessButtonStyle())

                    Button {
                        state.setInputToImperial()
                    } label: {
                        Text("Imperial").frame(maxWidth:.infinity, alignment: .trailing)
                    } .buttonStyle(BorderlessButtonStyle())

                }
                Section {
            TextField(state.heightText, text: $state.height)
            TextField(state.weightText, text: $state.weight)
                }
            
            Text(state.bmiOutput).padding()
            }
            Button("Calculate BMI") {
                state.calculateAndPrintBMI()
            }
            Spacer()
        }.background(backColor).onReceive(timer) { _ in
            counter += 1
            backColor = Color.init(UIColor(rgb: 0xFF+128+counter%128))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
