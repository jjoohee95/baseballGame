//
//  gameStart.swift
//  BaseballGame
//
//  Created by t2023-m0023 on 6/17/24.
//

class GameManage {
    var records = [Int]()   // 각 게임의 시도 횟수를 저장하는 배열
    let baseballGame = BaseballGame()  // BaseballGame 인스턴스 생성

    func gameStart() {
        baseballGame.startNewGame() // 게임 시작 시 정답 숫자 생성

        print("< 게임을 시작합니다 >")
        gameLoop: while true {
            print("숫자를 입력하세요 : ", terminator: "")
            if let input = readLine(), let userNum = Int(input) {
                
                if let result = baseballGame.checkStrikeBall(userNum: userNum) {
                    let (strike, ball) = result

                    if strike == 3 {
                        records.append(baseballGame.tries)
                        print("정답입니다. 처음으로 돌아갑니다.")
                        break gameLoop
                    }

                    if strike == 0 && ball == 0 {
                        print("OUT (NOTHING)")
                    } else {
                        var output = ""
                        if strike > 0 {
                            output += "strike: \(strike)"
                        }
                        if ball > 0 {
                            output += (output.isEmpty ? "" : ", ") + "ball: \(ball)"
                        }
                        print("(\(output))")
                    }
                }
            } else {
                print("올바른 숫자를 입력하세요.")
            }
        }
    }
    // 게임 기록 보기 함수
    func recordView() {
        if records.isEmpty {
            print("게임 기록이 없습니다.")
        } else {
            for (index, tries) in records.enumerated() {
                print("\(index + 1)번째 게임: 시도 횟수 \(tries)")
            }
        }
    }

    func exitGame() {
        print("< 숫자 야구 게임을 종료합니다 >")
    }

    func mainMenu() {
        while true {
            print("환영합니다, 원하는 번호를 선택하세요!")
            print("1. 게임 시작     2. 기록 보기    3. 게임 종료")

            if let option = readLine(), let choice = Int(option) {
                switch choice {
                case 1:
                    gameStart()
                case 2:
                    recordView()
                case 3:
                    exitGame()
                    return
                default:
                    print("올바른 숫자를 입력하세요")
                }
            } else {
                print("올바른 숫자를 입력하세요")
            }
        }
    }
}
