//
//  EntranceView.swift
//  Gabwatni_Cave
//
//  Created by dohankim on 2022/06/09.
//

import SwiftUI
import AVFoundation

struct EntranceView: View {
    @State var str = ""
    @State var str2 = "어떻게 잡았지"
    @State var StrArr : [String] = ["헉! 최가문의 후예...","드디어 나를 구하러 왔구나 소년이여...", "300년 동안 기다렸다...","난 동달(동굴달팽이라는 뜻, 동굴의 달인도 가능 ㅋㅋ)이라고 해","저희 할아버지의 할아버지의 할아버지의 할아버지를 어떻게 아시는 거죠?","나랑 같이 동굴을 탈출하려던 파트너 였지..(아련..)","너가 달수씨 대신 날 여기서 꺼내주지 않겠어?","좋습니다. 가문의 이름을 걸고 구해드리겠습니다.","출발하기전에 간단한 설명을 해주지..."," 이 동굴은 석회동굴이고, 저런 종유석들이 있는게 특징이지."," 한번 살펴보지 않겠어?"," " ]
    @State var charArr : [String] = ["달팽이","달팽이", "달팽이","달팽이","최병호","달팽이","달팽이","최병호","달팽이","달팽이","달팽이"," " ]
    @State var stringNumber = 0
    @State var toggle  = false
    @State var isClicked = false
    @State var xPosition : CGFloat = UIScreen.main.bounds.width/2
    @State var yPosition : CGFloat = UIScreen.main.bounds.height/3
    
    @Binding var flow : Int
    var body: some View {
        ZStack{
            Image("entrancecave")
                .resizable()
                .ignoresSafeArea()
            Color.black.opacity(0.7)
            .ignoresSafeArea()
            VStack{
                GeometryReader{geo in
                    Button {
                        ges(strnum: stringNumber)
                        isClicked = true
                        if stringNumber < 11{
                            stringNumber+=1
                            print(stringNumber)
                        }
                        else if stringNumber == 11{
                            flow = 1
                            print(1323)
                        }
                    } label: {
                        Image(!isClicked ? "달팽이" : charArr[stringNumber-1])
                            .resizable()
                            .scaleEffect(1.0)
                            .frame(width: UIScreen.main.bounds.height/3, height: (!isClicked ? "달팽이" : charArr[stringNumber-1]) == "달팽이" ? UIScreen.main.bounds.height/3: UIScreen.main.bounds.height/2, alignment: .center)
                            
                    }
                    .position(x: xPosition
                              , y: yPosition)
                   
                    Text(!isClicked ? "달팽이" : charArr[stringNumber-1])
                            .font(.custom("Sam3KRFont", size: 20))
                            .foregroundColor(.white)
                            .position(x: UIScreen.main.bounds.width/4
                                      , y: UIScreen.main.bounds.height/10 * 7)
                    
                    Text(str)
                        .font(.custom("Sam3KRFont", size: 20))
                        .foregroundColor(.white)
                        .frame(width: 250, height: 100, alignment: .center)
                        .overlay(
                                TextBox()
                            )
                        .position(x: UIScreen.main.bounds.width/2
                                  , y: UIScreen.main.bounds.height/9 * 7)
                }
                
            }
            
            
        }
    }
    
    
    func ges(strnum : Int){
        str = ""
        let startTime = Date().timeIntervalSince1970
        let length = StrArr[strnum].count
        var index = 0
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { (timer) in
            if strnum >= StrArr.count - 1 {timer.invalidate()}
            AudioServicesPlaySystemSound(1306)
            str += String(StrArr[strnum][StrArr[strnum].index(StrArr[strnum].startIndex, offsetBy: index)])
            index+=1
            if index == length{
                timer.invalidate()
                
            }
            if(toggle){
                timer.invalidate()
                str += StrArr[strnum].substring(from: index, to: length-1)
                toggle.toggle()
                
            }

        }
        
        
    }
}



struct TextBox: View {
    var body: some View{
        ZStack{
            Image("textbox")
        }
    }

}

extension String {
    func substring(from: Int, to: Int) -> String {
        guard from < count, to >= 0, to - from >= 0 else {
            return ""
        }
        
        // Index 값 획득
        let startIndex = index(self.startIndex, offsetBy: from)
        let endIndex = index(self.startIndex, offsetBy: to + 1) // '+1'이 있는 이유: endIndex는 문자열의 마지막 그 다음을 가리키기 때문
        
        // 파싱
        return String(self[startIndex ..< endIndex])
    }
}