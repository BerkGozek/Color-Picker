import SwiftUI

struct ContentView: View {
    
    @State var HueVal: Double = 1.0 // 1.0 = 360 degrees of hue
    
    
    @State var SatVal: Double = 1.0 // 1.0 = 100% saturation
    
    
    @State var BriVal: Double = 1.0 // 1.0 = 100% brightness
    
    
    

    var body: some View {
        VStack {
            ColorPicker("This is a joke:", selection: .constant(.red))
            
            VStack {
                Text("HSB Sliders")
                    .padding()
                
                Text("Hue")
                HStack {
                    Slider(value: $HueVal, in: 0...1.0)
                        .frame(width:150)
                    Text(String(Int(HueVal)))
                    
                    
                }
                
                Text("Saturation")
                HStack {
                    Slider(value: $SatVal, in: 0...1.0)
                        .frame(width:150)
                    Text(String(Int(SatVal)))
                }
                
                Text("Brightness")
                HStack {
                    Slider(value: $BriVal, in: 0...1.0)
                        .frame(width:150)
                    Text(String(Int(BriVal)))
                }
                .padding()
                
                Rectangle()
                    .fill(Color(hue: HueVal, saturation: SatVal, brightness: BriVal))
                    .frame(width: 100, height: 100)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
