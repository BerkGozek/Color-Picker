import SwiftUI

struct ContentView: View {
    
    @State var HueVal: Double = 1.0 // 1.0 = 360 degrees of hue
    @State var HueInp: Int = 360

    
    @State var SatVal: Double = 1.0 // 1.0 = 100% saturation
    @State var SatInp: Int = 100

    
    @State var BriVal: Double = 1.0 // 1.0 = 100% brightness
    @State var BriInp: Int = 100
    
    @State var OpaVal: Double = 1.0
    @State var OpaInp: Int = 100
    

    var body: some View {
        VStack {

            VStack {
                Text("HSB Sliders")
                    .padding(.bottom)
                
                Text("Hue")
                HStack {
                    ZStack{
                        LinearGradient(
                            gradient: Gradient(colors: [Color.red, Color.orange,Color.yellow,Color.green,Color.cyan,Color.blue,Color.purple,Color.pink,Color.red]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                        .frame(width:150)
                        .cornerRadius(14)
                        LinearGradient(
                            gradient: Gradient(colors: [Color.white]),
                            startPoint: .leading,
                            endPoint: .trailing
                        ).opacity(1-SatVal)
                        .frame(width:150)
                        .cornerRadius(14)
                        Slider(value: $HueVal, in: 0...1.0)
                            .frame(width:150)
                            .onChange(of: HueVal){newValue in
                                HueInp = Int(newValue*360)
                            }
                    }
                    TextField("", value: $HueInp, formatter:NumberFormatter())
                        .frame(width: 35,height: 10,alignment: .center)
                        .onChange(of: HueInp) { newValue in
                            HueVal = Double(HueInp)/360.0
                            if (newValue>360) {
                                HueVal = 1.0
                                HueInp = 360
                            }
                            else if (newValue<0){
                                HueVal = 0.0
                                HueInp = 0
                            }
                        }
                    
                    
                }
                
                Text("Saturation")
                HStack {
                    ZStack{
                        LinearGradient(
                            gradient: Gradient(colors: [Color.white, Color(hue: HueVal, saturation: 1, brightness: 1)]),
                                        startPoint: .leading,
                                        endPoint: .trailing)
                        .frame(width:150)
                        .cornerRadius(14)
                                    
                        Slider(value: $SatVal, in: 0...1.0)
                            .frame(width:150)
                            .onChange(of: SatVal){newValue in
                                SatInp = Int(newValue*100)
                            }
                    }
                    TextField("", value: $SatInp, formatter:NumberFormatter())
                        .frame(width: 35,height: 10,alignment: .center)
                        .onChange(of: SatInp) { newValue in
                            SatVal = Double(SatInp)/100.0
                            if (newValue>100) {
                                SatVal = 1.0
                                SatInp = 100
                            }
                            else if (newValue<0){
                                SatVal = 0.0
                                SatInp = 0
                            }
                        }
                }
                
                Text("Brightness")

                HStack {
                    ZStack{
                        LinearGradient(
                            gradient: Gradient(colors: [Color.black, Color(hue: HueVal, saturation: SatVal, brightness: 1)]),
                            startPoint: .leading,
                            endPoint: .trailing)
                        .frame(width:150)
                        .cornerRadius(14)
                        Slider(value: $BriVal, in: 0...1.0)
                            .frame(width:150)
                            .onChange(of: BriVal){newValue in
                                BriInp = Int(newValue*100)
                            }
                    }
                    TextField("", value: $BriInp, formatter:NumberFormatter())
                        .frame(width: 35,height: 10,alignment: .center)
                        .onChange(of: BriInp) { newValue in
                            BriVal = Double(BriInp)/100.0
                            if (newValue>100) {
                                BriVal = 1.0
                                BriInp = 100
                            }
                            else if (newValue<0){
                                BriVal = 0.0
                                BriInp = 0
                            }
                        }
                }
                .padding()
                
                Text("Opacity")
                HStack{
                    Slider(value: $OpaVal, in: 0...1.0).frame(width:150)
                        .onChange(of: OpaVal){newValue in
                            OpaInp = Int(newValue*100)
                        }
                    TextField("", value: $OpaInp, formatter:NumberFormatter())
                        .frame(width: 35,height: 10,alignment: .center)
                        .onChange(of: OpaInp) { newValue in
                            OpaVal = Double(OpaInp)/100.0
                            if (newValue>100) {
                                OpaVal = 1.0
                                OpaInp = 100
                            }
                            else if (newValue<0){
                                OpaVal = 0.0
                                OpaInp = 0
                            }
                        }
                }
                Rectangle()
                    .fill(Color(hue: HueVal, saturation: SatVal, brightness: BriVal))
                    .frame(width: 100, height: 100)
                    .opacity(OpaVal)
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
