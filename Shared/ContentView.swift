import SwiftUI
import GoogleMobileAds



struct BannerAdView: UIViewRepresentable {

    func makeUIView(context: Context) -> GADBannerView {
//        let banner = GADBannerView(adSize: kGADAdSizeSmartBannerPortrait)
        let banner = GADBannerView(adSize: kGADAdSizeBanner)
        //-----------テストデバイス向けのコード↓
        GADMobileAds.sharedInstance().requestConfiguration.testDeviceIdentifiers =
            [ "4e063ab0ed22438654dc185740dde665" ] // device ID
        //-----------テストデバイス向けのコード↑
        
        banner.adUnitID = "ca-app-pub-1023155372875273/2406169933"
        //↑こちら本物。
        
//        banner.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        //↑こちらのadUnitIDはテスト用。本番環境では自身の広告ユニットIDに変更する

        banner.rootViewController = UIApplication.shared.windows.first?.rootViewController
        banner.load(GADRequest())
        return banner
    }
    
    func updateUIView(_ uiView: GADBannerView, context: Context) {
    }
}

@available(macOS 12.0, *)
struct ContentView: View {
    
    enum Field:Int,Hashable{
        case Forcus1
        case Forcus2
        case Forcus3
        case Forcus4
        case Forcus5
        case Forcus6
        case Forcus7
        case Forcus8
        case Forcus9
        case Forcus10
    }
    
    @FocusState var focus:Field?
    
    @FocusState private var Forcused: Bool   // フォーカス状態プロパティ
    @State var state: String = "Closed"
    
    @State var kakaku1 = ""
    @State var kazu1 = ""
    @State var result1 : Double = 0
    @State var kakaku2 = ""
    @State var kazu2 = ""
    @State var result2 : Double = 0
    @State var kakaku3 = ""
    @State var kazu3 = ""
    @State var result3 : Double = 0
    @State var kakaku4 = ""
    @State var kazu4 = ""
    @State var result4 : Double = 0
    @State var kakaku5 = ""
    @State var kazu5 = ""
    @State var result5 : Double = 0
    
    @State var ckakaku1 : Double = 0
    @State var ckazu1 : Double = 0
    @State var ckakaku2 : Double = 0
    @State var ckazu2 : Double = 0
    @State var ckakaku3 : Double = 0
    @State var ckazu3 : Double = 0
    @State var ckakaku4 : Double = 0
    @State var ckazu4 : Double = 0
    @State var ckakaku5 : Double = 0
    @State var ckazu5 : Double = 0
    
    @State var hyouji1 : String = ""
    @State var hyouji2 : String = ""
    @State var hyouji3 : String = ""
    @State var hyouji4 : String = ""
    @State var hyouji5 : String = ""
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.white, .green]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
                .onTapGesture {
                    UIApplication.shared.closeKeyboard()
                }
            
            VStack{
                BannerAdView().frame(width: 320, height: 50)
                Text("どれがお得？")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .frame(width: 300, height: 40)
                    .foregroundColor(Color(.white))
                    .background(Color(.orange))
                    .cornerRadius(3)
                Spacer()
                HStack{
                    VStack(spacing: 5){
                        Text("価格(円)")
                            .font(.title)
                            .frame(height: 28)
                        TextField("", text : $kakaku1)
                            .focused($Forcused)
                            .focused($focus, equals: Field.Forcus1)
                        TextField("", text : $kakaku2)
                            .focused($focus, equals: Field.Forcus3)
                        TextField("", text : $kakaku3)
                            .focused($focus, equals: Field.Forcus5)
                        TextField("", text : $kakaku4)
                            .focused($focus, equals: Field.Forcus7)
                        TextField("", text : $kakaku5)
                            .focused($focus, equals: Field.Forcus9)
                    }.onAppear {
                        /// 0.3秒の遅延発生後TextFieldに初期フォーカスをあてる
                        DispatchQueue.main.asyncAfter(deadline: .now()+0.3) {
                            Forcused = true
                        }}
                    VStack(spacing: 5){
                        Text("数量など")
                            .font(.title)
                            .frame(height: 28)
                        TextField("", text : $kazu1)
                            .focused($focus, equals: Field.Forcus2)
                        TextField("", text : $kazu2)
                            .focused($focus, equals: Field.Forcus4)
                        TextField("", text : $kazu3)
                            .focused($focus, equals: Field.Forcus6)
                        TextField("", text : $kazu4)
                            .focused($focus, equals: Field.Forcus8)
                        TextField("", text : $kazu5)
                            .focused($focus, equals: Field.Forcus10)
                    }
                    VStack(spacing: 5){
                        Text("単位価格")
                            .font(.title)
                            .frame(height: 28)
                        TextField("", text : $hyouji1)
                        TextField("", text: $hyouji2)
                        TextField("", text : $hyouji3)
                        TextField("", text : $hyouji4)
                        TextField("", text : $hyouji5)
                    }
                    .disabled(true)
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.trailing)
                .keyboardType(.decimalPad)
                .font(.title)
                HStack{
                    Button(action: {
                        
                        kakaku1 = ""
                        kakaku2 = ""
                        kakaku3 = ""
                        kakaku4 = ""
                        kakaku5 = ""
                        kazu1 = ""
                        kazu2 = ""
                        kazu3 = ""
                        kazu4 = ""
                        kazu5 = ""
                        hyouji1 = ""
                        hyouji2 = ""
                        hyouji3 = ""
                        hyouji4 = ""
                        hyouji5 = ""
                        focus = Optional(TokuMo.ContentView.Field.Forcus1)
                    }){
                        Text("リセット")
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .foregroundColor(Color(.white))
                            .background(Color(.blue))
                            .cornerRadius(18)
                            .font(.title)
                    }
                    Spacer()
                        .frame(width: 20)
                    Button(action: {
                        ckakaku1 = Double(kakaku1) ?? 0
                        ckazu1 = Double(kazu1) ?? 0
                        ckakaku2 = Double(kakaku2) ?? 0
                        ckazu2 = Double(kazu2) ?? 0
                        ckakaku3 = Double(kakaku3) ?? 0
                        ckazu3 = Double(kazu3) ?? 0
                        ckakaku4 = Double(kakaku4) ?? 0
                        ckazu4 = Double(kazu4) ?? 0
                        ckakaku5 = Double(kakaku5) ?? 0
                        ckazu5 = Double(kazu5) ?? 0
                        
                        self.result1 = Double(self.ckakaku1) / Double(self.ckazu1)
                        self.result2 = Double(self.ckakaku2) / Double(self.ckazu2)
                        self.result3 = Double(self.ckakaku3) / Double(self.ckazu3)
                        self.result4 = Double(self.ckakaku4) / Double(self.ckazu4)
                        self.result5 = Double(self.ckakaku5) / Double(self.ckazu5)
                        
                        hyouji1 = String(format: "%.3f", result1)
                        hyouji2 = String(format: "%.3f", result2)
                        hyouji3 = String(format: "%.3f", result3)
                        hyouji4 = String(format: "%.3f", result4)
                        hyouji5 = String(format: "%.3f", result5)
                        
                        if kazu1 == ""
                        {
                            hyouji1 = ""
                        }
                        if kazu2 == ""
                        {
                            hyouji2 = ""
                        }
                        if kazu3 == ""
                        {
                            hyouji3 = ""
                        }
                        if kazu4 == ""
                        {
                            hyouji4 = ""
                        }
                        if kazu5 == ""
                        {
                            hyouji5 = ""
                        }


                        if result1.isNaN
                        {
                            hyouji1 = ""
                        }
                        if result2.isNaN
                        {
                            hyouji2 = ""
                        }
                        if result3.isNaN
                        {
                            hyouji3 = ""
                        }
                        if result4.isNaN
                        {
                            hyouji4 = ""
                        }
                        if result5.isNaN
                        {
                            hyouji5 = ""
                        }
                    }){
                        Text("計算")
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .foregroundColor(Color(.white))
                            .background(Color(.blue))
                            .cornerRadius(18)
                            .font(.title)
                    }

                    
                }
                Spacer()
            }
        }.toolbar{
            ToolbarItem(placement: .keyboard){
                HStack{
                    Button(action: {
                        focus = Field(rawValue: focus!.rawValue - 1)
                    }){
                        Image(systemName: "chevron.left")
                    }
                    Spacer()
                        .frame(width: 40)
                    Button(action: {
                        focus = Field(rawValue: focus!.rawValue + 1)
                    }){
                        Image(systemName: "chevron.right")
                    }}}}
        .onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardDidShowNotification)) { _ in
            self.state = "Opened"
        }.onReceive(NotificationCenter.default.publisher(for: UIResponder.keyboardDidHideNotification)) { _ in
            self.state = "Closed"
        }
    }}

extension UIApplication {
    func closeKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
