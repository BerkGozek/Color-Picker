import SwiftUI

struct ContentView: View {
    
    @State var HueVal: Double = 1.0 // 1.0 = 360 degrees of hue
    
    
    @State var SatVal: Double = 1.0 // 1.0 = 100% saturation
    
    
    @State var BriVal: Double = 1.0 // 1.0 = 100% brightness
    @State var BriInp: Int = 0
    
    

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
                    Text(String(Int(HueVal*360)))
                    
                    
                }
                
                Text("Saturation")
                HStack {
                    Slider(value: $SatVal, in: 0...1.0)
                        .frame(width:150)
                    Text(String(Int(SatVal*100)))
                }
                
                Text("Brightness")
                HStack {
                    Slider(value: $BriVal, in: 0...1.0)
                        .frame(width:150)
//                    Text(String(Int(BriVal*100)))
                    TextField("", value: $BriInp, formatter:NumberFormatter())
                        .onChange(of: BriInp) { newValue in
                            if (newValue>100){
                                BriVal = 1.0
                                BriInp = 100
                            }
                            else if (newValue>100){
                                BriVal = 0.0
                                BriInp = 0
                            }
                        }
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
