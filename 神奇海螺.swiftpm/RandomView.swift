import SwiftUI

struct RandomView: View {
    @State private var text:String=""
    @State private var result=false
    @State private var show=false
    var body: some View {
        Form{
            VStack{
                HStack{
                    Text("神奇海螺，請問我可以")
                    TextField("輸入問題",text:$text)
                }
                Button{
                    show=true
                    result=Bool.random()
                }label:{
                    Text("送出")
                }
                if show{
                    Text("神奇海螺：\(result ? "可以" : "不行")")
                }
            }
        }
    }
}
struct SoupView: View{
    @State private var question=["請選擇問題","明天要報告給教授的東西報不出來了怎麼辦？","面試時被問問題回答不出來怎麼辦？","空虛寂寞覺得冷怎麼辦？"]
    @State private var index=0
    @State private var ans=["說說你要問我什麼吧","那這個就是教授的課題了","就要跟他說‘你問錯問題了‘","去角落吧！角落有９０度"]
    var body: some View{
        VStack{
            Picker(selection: $index){
                Text(question[0]).tag(0)
                Text(question[1]).tag(1)
                Text(question[2]).tag(2)
                Text(question[3]).tag(3)
            }label:{
                Text("選擇問題")
            }
            Text("神奇海螺：\(ans[index])")
        }
    }
}
struct DiceView: View{
    @State private var result=1
    var body: some View{
        Image(systemName: "die.face.\(result)")
            .resizable()
            .frame(width: 100, height: 100)
        Button{
            var cnt:Int=0
            Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true){
                t in
                cnt+=1
                result=Int.random(in: 1...6)
                if cnt == 10{
                    t.invalidate()
                }
            }
        }label:{
            Text("投擲骰子")
        }
    }
}
struct SelectView: View{
    @State private var message:String=""
    @State private var text:String=""
    @State private var item:Array<Substring>?
    @State private var result=""
    var body: some View{
        Form{
            VStack{
                HStack{
                    Text("神奇海螺，請問我應該")
                    TextField("輸入問題",text: $text)
                }
                Text("輸入選項")
                TextEditor(text: $message)
                    .frame(width:200,height:200)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2))
                Button{
                    item=message.split(separator: "\n")
                    result=String(item?.randomElement() ?? "")
                }label:{
                    Text("送出")
                }
                if result != ""{
                    Text("神奇海螺：\(result)")
                }
            }
        }
    }
}
struct DateView: View{
    @State private var day = Date()
    @State private var result=0
    var body: some View{
        Form{
            VStack{
                DatePicker("神奇海螺，今天是個好日子嗎？", selection:$day, displayedComponents: .date)
                Button{
                    result=Int.random(in: 1...3)
                }label:{
                    Text("送出")
                }
                HStack{
                    if result != 0{
                        Text("神奇海螺：")
                    }
                    if result == 1{
                        Text("今天是個好日子")
                    }
                    else if result == 2{
                        Text("今天不宜外出")
                    }
                    else if result == 3{
                        Text("今天不宜呼吸")
                    }
                }
            }
        }
        
        
    }
}
struct DrawView: View {
    @State private var show=false
    @State private var result=0.0
    @State private var arg1=0.0
    @State private var arg2=0.0
    @State private var arg3=0.0
    @State private var name1:String=""
    @State private var name2:String=""
    @State private var name3:String=""
    @State private var presented=false
    var body: some View {
        Form{
            VStack{
                Text("神奇海螺，請問我會抽中哪個獎")
                DisclosureGroup("選項"){
                    VStack{
                        VStack{
                            TextField("項目１",text:$name1)
                            HStack{
                                Text("機率：")
                                Text(String(format:"%.2f",arg1))
                                Slider(value: $arg1, in: 0...(1.0-arg2-arg3))
                            }
                        }
                        VStack{
                            TextField("項目２",text:$name2)
                            HStack{
                                Text("機率：")
                                Text(String(format:"%.2f",arg2))
                                Slider(value: $arg2, in: 0...(1.0-arg1-arg3))
                            }
                        }
                        VStack{
                            TextField("項目３",text:$name3)
                            HStack{
                                Text("機率：")
                                Text(String(format:"%.2f",arg3))
                                Slider(value: $arg3, in: 0...(1.0-arg1-arg2))
                            }
                        }
                    }
                }
                Button{
                    if abs(1.0-arg1-arg2-arg3) < 1e-6{
                        show=true
                        result=Double.random(in: 0.0...1.0)
                    }
                    else{
                        presented=true
                    }
                    
                }label:{
                    Text("送出")
                }
                .alert("機率加起來要為１", isPresented: $presented, actions: {
                    Button("OK"){
                        presented=false
                    }
                })
                if show{
                    HStack{
                        Text("神奇海螺：")
                        if result<arg1{
                            Text("\(name1)")
                        }
                        else if result<arg2+arg1{
                            Text("\(name2)")
                        }
                        else{
                            Text("\(name3)")
                        }
                    }
                }
            }
        }
    }
}
