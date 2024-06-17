//
//  BaseballGame.swift
//  BaseballGame
//
//  Created by  on 6/13/24.

// BaseballGame 클래스 외부에 위치한 사용자가 입력한 숫자와 정답 숫자의 스트라이크와 볼을 계산하는 함수
// 힌트출력 : 같은숫자 같은자리 스트라이크, 같은숫자 다른자리 볼, 다른숫자 다른자리 아웃
// randomNum & userNum > 배열로 변환하여  각 자리 별 비교
// if, else if, else 조건문 사용하여 각각 선언
class BaseballGame {
    var tries = 0   // 현재 게임의 시도 횟수를 기록할 변수

    func makeAnswerNum() -> [Int] {
        var numbers = [Int]()
        // 첫 번째 숫자는 1에서 9 사이의 값으로 선택
        numbers.append(Int.random(in: 1...9))

        while numbers.count < 3 {
            let randomNum = Int.random(in: 0...9)

            if !numbers.contains(randomNum) {
                numbers.append(randomNum)
            }
        }

        return numbers
    }

    func isValidNumber(userNum: Int) -> Bool {
        let userNumStr = String(userNum)

        // 세 자리 숫자를 입력했는지 확인
        guard userNumStr.count == 3 else {
            print("세 자리 수를 입력해주세요.")
            return false
        }

        let userNumSet = Set(userNumStr)
        // 첫 번째 자리에 0이 입력된 경우 처리
        if userNum / 100 == 0 && userNum != 0 {
            print("첫 번째 자리에 0이 입력될 수 없습니다. 숫자를 다시 입력해 주세요.")
        }

        guard userNumSet.count == 3 else {
            print("특정 숫자가 두 번 사용되었습니다. 다시 입력해주세요.")
            return false
        }

        return true
    }

    func checkStrikeBall(answerNum: [Int], userNum: Int) -> (strike: Int, ball: Int) {
        let userNumArray = Array(String(userNum)).compactMap { Int(String($0)) }
        var strike = 0
        var ball = 0

        for (index, digit) in userNumArray.enumerated() {
            if answerNum[index] == digit {
                strike += 1
            } else if answerNum.contains(digit) {
                ball += 1
            }
        }

        tries += 1
        return (strike, ball)
    }
}





//class BaseballGame {
//    
//    var records = [Int]()   // 각 게임의 시도 횟수를 저장하는 배열
//
//    func isValidNumber(userNum: Int) -> Bool {
//        let userNumStr = String(userNum)
//
//        guard userNumStr.count == 3 else {
//            print("세 자리 수를 입력해주세요.")
//            return false
//        }
//
//        let userNumSet = Set(userNumStr)
//
//        guard userNumSet.count == 3 else {
//            print("특정 숫자가 두 번 사용되었습니다. 다시 입력해주세요.")
//            return false
//        }
//
//        return true
//    }
//    func checkStrikeBall(answerNum: [Int], userNum: Int) -> (strike: Int, ball: Int) {
//        let userNumArray = Array(String(userNum)).compactMap { Int(String($0)) }
//        var strike = 0
//        var ball = 0
//
//        for (index, digit) in userNumArray.enumerated() {
//            if answerNum[index] == digit {
//                strike += 1
//            } else if answerNum.contains(digit) {
//                ball += 1
//            }
//        }
//        return (strike, ball)
//    }
//    func gameStart() {
//        let answerNum = makeAnswerNum()
//        print(answerNum)
//        // 정답을 만드는 함수
//        var tries = 0           // 현재 게임의 시도 횟수를 기록할 변수
//
//        while true {
//            // 사용자에게 새자리 숫자 입력값을 받음
//            print("< 게임을 시작합니다 >")
//            print("숫자를 입력하세요 : ", terminator: "")
//
//            if let input = readLine(), let userNum = Int(input) {
//                if isValidNumber(userNum: userNum) {
//                    tries += 1
//
//                    let (strike,ball) = checkStrikeBall(answerNum: answerNum, userNum: userNum)
//                    if strike == 3 {
//                        records.append(tries)
//                        print(" 정답입니다. 처음으로 돌아갑니다 ")
//                        break
//                        // 게임이 종료되면 반복문 탈출
//                    }
//                    if strike == 0 && ball == 0 {
//                        print(" OUT( NOTHING ) ")
//                    } else {
//                        var output = ""
//                        if strike > 0 {
//                            output += "strike: \(strike)"
//                        }
//                        if ball > 0 {
//                            output += (output.isEmpty ? "" : ", ") + "ball: \(ball)"
//                        }
//                        print("(\(output))", terminator: "")
//                    }
//                }
//            }
//        }
//    }
//
//
//    func game() {
//    gameLoop: while true {
//          print("환영합니다, 원하는 번호를 선택하세요!")               // 사용자에게 입력값을 받음
//            print(" 1. 게임 시작     2. 기록 보기    3. 게임 종료 ")
//            if let option = readLine(), let choice = Int(option) {
//                switch choice {
//                case 1:                                         // 게임 시작
//                    gameStart()
//                case 2:                                         // 기록보기
//                    recordView()
//                case 3:                                         // 게임종료
//                    print("< 숫자 야구 게임을 종료합니다 >")
//                    break gameLoop                              // gameLoop 라벨을 통해 외부 루프에서 탈출
//                default:
//                    print("올바른 숫자를 입력하세요")
//                }
//            }
//        }
//    }
//}
//
//
//class gameManage {
//
//    func makeAnswerNum() -> [Int] {
//        var numbers = [Int]()
//
//        // 첫 번째 숫자는 1에서 9 사이의 값으로 선택
//        numbers.append(Int.random(in: 1...9))
//        // 두 번째 숫자 부터 반복문을 사용하여 값을 선택
//        while numbers.count < 3 {
//            let randomNum = Int.random(in: 0...9)
//
//            // 생성된 숫자가 배열에 포함되어 있지 않을때만 배열에 추가됨
//            if !numbers.contains(randomNum) {
//                numbers.append(randomNum)
//            }
//        }
//
//        return numbers
//    }
//
//    // 기록보기함수 : 1....n번 게임에서의 시도 횟수를 확인
//    // 1번째 게임 시도 횟수를 값으로 저장, 2번째 게임의 시도 횟수를 값으로 저장 .....[배열로 저장]
//    func recordView() {
//        if records.isEmpty {
//            print("게임 기록이 없습니다.")
//        } else {
//            for (index, tries) in records.enumerated() {
//                print("\(index+1)번째 게임: 시도 횟수 _ \(tries)")
//            }
//        }
//    }
//}
