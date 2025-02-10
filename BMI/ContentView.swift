//
//  ContentView.swift
//  BMI
//
//  Created by satoeisuke on 2025/02/10.
//

import SwiftUI

struct ContentView: View {
    @State private var sintyou: Double = 0.0
    @State private var sintyouUnit: String = "m"
    @State private var taijyu: Double = 0.0
  //  @State private var conversionUnit = "cm"
    
    let lengthUnits = ["m", "cm"]
    var body: some View {
        Form {
            Section("入力") {
                HStack {
                    //身長の入力
                    TextField("", value: $sintyou, format: .number)
                        .keyboardType(.numberPad)
                        .padding()
                    
                    Picker("", selection: $sintyouUnit) {
                        ForEach(lengthUnits, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                }
                //体重の入力
                HStack {

                    TextField("", value: $taijyu, format: .number)
                        .keyboardType(.numberPad)
                        .padding()
                    Text("kg")
                }
            }
            
            Section("あなたのBMI") {
                Text(bmi(tai: taijyu, sin: sintyou, tani: sintyouUnit), format: .number)

            }
        }
    }
    
    func bmi(tai: Double, sin: Double, tani: String) -> Double {
        var bmi: Double = 0.0
        
        switch sintyouUnit {
        case "m":
            bmi = taijyu / (sintyou * sintyou)
        case "cm":
            let centiMeter = sintyou / 100
            bmi = taijyu / (centiMeter * centiMeter)
        default:
            return 0
        }
        
        return bmi
    }
      
}


#Preview {
    ContentView()
}
