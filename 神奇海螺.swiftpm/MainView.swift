import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView{
            VStack{
                Image("神奇海螺")
                    .resizable()
                    .frame(width: 300, height: 300)
                NavigationLink{
                    RandomView()
                }label:{
                    Text("是／否選擇器")
                }
                NavigationLink{
                    DiceView()
                }label:{
                    Text("擲骰子")
                }
                NavigationLink{
                    DrawView()
                }label:{
                    Text("抽獎模擬")
                }
                NavigationLink{
                    DateView()
                }label:{
                    Text("日期占卜")
                }
                NavigationLink{
                    SelectView()
                }label:{
                    Text("選擇障礙小助手")
                }
                NavigationLink{
                    SoupView()
                }label:{
                    Text("心靈毒雞湯")
                }
            }
            .navigationTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
