//
//  ContentView.swift
//  CounterApp-WatchOS WatchKit Extension
//
//  Created by Luca Dillenburg on 15/02/22.
//

import SwiftUI

struct ContentView: View {
    @State var secondScreenShown = false
    @State var timerVal = 5
    
    var body: some View {
        VStack(alignment: .center) {
            Text("Start timer for")
            Picker(selection: $timerVal, label: Text("")) {
                Text("5 seconds").tag(5)
                Text("10 seconds").tag(10)
                Text("15 seconds").tag(15)
                Text("20 seconds").tag(20)
                Text("25 seconds").tag(25)
                Text("30 seconds").tag(30)
            }
            .padding(.bottom, 10)
            NavigationLink(
                destination: CountingDownView(
                    secondScreenShown: $secondScreenShown,
                    timerVal: timerVal
                ),
                isActive: $secondScreenShown,
                label: {Text("Start")}
            )
        }
    }
}

struct CountingDownView: View {
    @Binding var secondScreenShown:Bool
    @State var timerVal = 0
    
    var body: some View {
        VStack(alignment: .center) {
            if timerVal > 0 {
                Text("Time remaining")
                    .font(.system(size: 14))
                Text("\(timerVal)")
                    .font(.system(size: 40))
                    .onAppear() {
                        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
                            if self.timerVal > 0 {
                                self.timerVal -= 1
                            }
                        }
                    }
                Text("seconds")
                    .font(.system(size: 14))
                    .padding(.bottom, 10)
                Button(action: {
                    self.secondScreenShown = false
                }) {
                    Text("Cancel").foregroundColor(.red)
                }
            } else {
                Text("Times up!")
                    .font(.system(size: 30))
                    .padding(.bottom, 10)
                Button(action: {
                    self.secondScreenShown = false
                }) {
                    Text("Go back").foregroundColor(.green)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
