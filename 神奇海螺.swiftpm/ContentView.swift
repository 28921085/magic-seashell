//
//  ContentView.swift
//  test2
//
//  Created by User05 on 2022/10/26.
//

import SwiftUI

struct ContentView: View {
    @State private var name:String=""
    @State private var birthday = Date()
    @State private var age:Double=18
    @State private var gender:Bool=false//false = man true = woman
    @State private var topic:String=""
    @State private var q:Bool=false
    var body: some View {
        //Image，TextEditor，Stepper。
        VStack{
            Form {
                TextField("First name", text: $name)
                DatePicker("Birthday", selection:$birthday, displayedComponents: .date)
                VStack{
                    HStack{
                        Text("Age : ")
                        Spacer()
                        Text("\(age, specifier: "%.0f")")
                    }
                    Slider(value: $age,in: 6...100,step:1)
                }
                Toggle(isOn: $gender) {
                    Label(gender ? "Woman" : "Man", systemImage: "flag.fill")
                }
                Picker(selection: $topic, label: Text("選擇想占卜的事情")) {
                    Text("財富").tag("財富")
                    Text("愛情").tag("愛情")
                }
                DisclosureGroup("更多選項"){
                    VStack{
                        Toggle("性別：\(q ? "男生" : "女生")", isOn: $q)
                        
                        
                    }
                }
            }
            Button{
                
            }label:{
                Text("submit")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
