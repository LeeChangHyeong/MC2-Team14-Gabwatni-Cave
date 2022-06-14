//
//  RandomGameView.swift
//  Gabwatni_Cave
//
//  Created by 정호윤 on 2022/06/10.
//

import SwiftUI

struct RandomGameView: View {
    @State var bossChoice = Int.random(in: 1...3)
    
    @State private var clearRandomGame = false
    @State private var myChoice = 0
    
    var body: some View {
        // 기본 뷰
        if myChoice == 0 && clearRandomGame == false {
            ZStack {
                // 배경
                Rectangle()
                    .overlay(
                        Image("minigame dragon")
                            .resizable()
                    )
                    .foregroundColor(.black)
                    .ignoresSafeArea()
                
                VStack {
                    // 보스 대사
                    Text("게임을 시작하지...\n가위 바위 보!")
                        .font(.custom("Sam3KRFont", size: 36))
                        .padding()
                    
                    Spacer()
                    
                    // 가위 바위 보 선택지
                    Button {
                        myChoice = 1
                    } label: {
                        ZStack {
                           Image("textbox")
                               .resizable()
                               .frame(width: 310, height: 60)
                           
                           Text("가위")
                                .font(.custom("Sam3KRFont", size: 24))
                        }
                    }
                    
                    Button {
                        myChoice = 2
                    } label: {
                        ZStack {
                           Image("textbox")
                               .resizable()
                               .frame(width: 310, height: 60)
                           
                           Text("바위")
                                .font(.custom("Sam3KRFont", size: 24))
                        }
                    }
                    
                    Button {
                        myChoice = 3
                    } label: {
                        ZStack {
                           Image("textbox")
                               .resizable()
                               .frame(width: 310, height: 60)
                           
                           Text("보")
                                .font(.custom("Sam3KRFont", size: 24))
                        }
                    }
                }
                .foregroundColor(.white)
            }
        }
        // 가위바위보 비겼을때 뷰
        else if myChoice == bossChoice && clearRandomGame == false {
        ZStack {
            // 배경
            Rectangle()
                .overlay(
                    Image("minigame dragon")
                        .resizable()
                )
                .foregroundColor(.black)
                .ignoresSafeArea()
            
            VStack {
                // 보스 대사
                Text("비겼군...\n다시 도전해라!")
                    .font(.custom("Sam3KRFont", size: 36))
                    .padding()
                
                Spacer()
                
                // 가위 바위 보 선택지
                Button {
                    myChoice = 1
                    bossChoice = Int.random(in: 1...3)
                } label: {
                    ZStack {
                       Image("textbox")
                           .resizable()
                           .frame(width: 310, height: 60)
                       
                       Text("가위")
                            .font(.custom("Sam3KRFont", size: 24))
                    }
                }
                
                Button {
                    myChoice = 2
                    bossChoice = Int.random(in: 1...3)
                } label: {
                    ZStack {
                       Image("textbox")
                           .resizable()
                           .frame(width: 310, height: 60)
                       
                       Text("바위")
                            .font(.custom("Sam3KRFont", size: 24))
                    }
                }
                
                Button {
                    myChoice = 3
                    bossChoice = Int.random(in: 1...3)
                } label: {
                    ZStack {
                       Image("textbox")
                           .resizable()
                           .frame(width: 310, height: 60)
                       
                       Text("보")
                            .font(.custom("Sam3KRFont", size: 24))
                    }
                }
            }
            .foregroundColor(.white)
        }
    }
        // 가위로 이겼을때 뷰
        else if myChoice == 1 && bossChoice == 3 && clearRandomGame == false {
            ZStack {
                // 배경
                Rectangle()
                    .overlay(
                        Image("minigame dragon")
                            .resizable()
                    )
                    .foregroundColor(.black)
                    .ignoresSafeArea()
                
                VStack {
                    // 보스 대사
                    Text("이걸 이기네...")
                        .font(.custom("Sam3KRFont", size: 36))
                        .padding()
                    
                    Spacer()
                }
                .foregroundColor(.white)
            }
            .onAppear {
                withAnimation(.easeIn(duration: 2).delay(1)) {
                    clearRandomGame = true
                }
            }
            
        }
        // 바위로 이겼을때 뷰
        else if myChoice == 2 && bossChoice == 1 && clearRandomGame == false {
            ZStack {
                // 배경
                Rectangle()
                    .overlay(
                        Image("minigame dragon")
                            .resizable()
                    )
                    .foregroundColor(.black)
                    .ignoresSafeArea()
                
                VStack {
                    // 보스 대사
                    Text("내가 지다니...")
                        .font(.custom("Sam3KRFont", size: 36))
                        .padding()
                    
                    Spacer()
                }
                .foregroundColor(.white)
            }
            .onAppear {
                withAnimation(.easeIn(duration: 2).delay(1)) {
                    clearRandomGame = true
                }
            }
        }
        // 보로 이겼을때 뷰
        else if myChoice == 3 && bossChoice == 2 && clearRandomGame == false{
            ZStack {
                // 배경
                Rectangle()
                    .overlay(
                        Image("minigame dragon")
                            .resizable()
                    )
                    .foregroundColor(.black)
                    .ignoresSafeArea()
                
                VStack {
                    // 보스 대사
                    Text("나를 이기다니...")
                        .font(.custom("Sam3KRFont", size: 36))
                        .padding()
                    
                    Spacer()
                }
                .foregroundColor(.white)
            }
            .onAppear {
                withAnimation(.easeIn(duration: 2).delay(1)) {
                    clearRandomGame = true
                }
            }
        }
        // 이기고 나면 클리어 뷰로 이동
        else if clearRandomGame == true {
            ClearView()
        }
        // 졌을때 사망뷰로 이동
        else { DeathView(reasonText: "가위, 바위, 보 게임 져서", tipText: "다음번엔 잘해보세요.") }
    }
}

struct RandomGameView_Previews: PreviewProvider {
    static var previews: some View {
        RandomGameView()
    }
}
