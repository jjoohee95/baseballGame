//
//  BaseballGame.swift
//  BaseballGame
//
//  Created by  on 6/13/24.
//


func isValidNumber(userNum: Int) -> Bool {

    // 세 자리 수인지 확인
    if userNum < 100 || userNum > 999 {
        print("세 자리 수를 입력해주세요.")
        return false
    }
    // 중복된 숫자가 있는지 확인,
    // 숫자 > 문자열 > 문자의 집합 count를 통해 요소 숫자가 3인지 확인하여 중복숫자 검사
    let userNumStr = String(userNum)
    let numSet = Set(userNumStr)
    if numSet.count != 3 {
        print("특정 숫자가 두 번 사용되었습니다. 다시 입력해주세요.")
        return false
    }
    return true
}

class BaseballGame {
    func startgame() {
        let answerNum = makeAnswerNum() // 정답을 만드는 함수


        //게임 반복을 위한 while 문
        while true {

            // 사용자에게 입력값을 받음
            print("< 게임을 시작합니다 > 숫자를 입력하세요: ", terminator: "")

            if let input = readLine(), let userNum = Int(input) {
                if isValidNumber(userNum: userNum) {
                    // 힌트출력 : 같은숫자 같은자리 스트라이크, 같은숫자 다른자리 볼, 다른숫자 다른자리 아웃
                    // randomNum & userNum > 배열로 변환하여  각 자리 별 비교
                    // if, else if, else 조건문 사용하여 각각 선언
                    let userNumArray = Array(String(userNum))
                    let answerNum = Array(answerNum)
                    var ball = 0
                    var strike = 0

                    for (index, digit) in userNumArray.enumerated() {
                        if String(answerNum[index]) == String(digit) {
                            strike += 1
                        } else if answerNum.contains(Int(String(digit)) ?? -1) {
                            ball += 1
                        }
                    }
                    if strike == 3 {
                        print(" 정답입니다. 처음으로 돌아갑니다 ")
                        break // 게임이 종료되면 반복문 탈출
                        } 
                        if strike == 0 && ball == 0 {
                        print(" OUT( NOTHING ) ")
                        } else {

                        var output = ""
                        if strike > 0 {
                            output += "strike: \(strike)"
                        }
                        if ball > 0 {
                            output += (output.isEmpty ? "" : ", ") + "ball: \(ball)"
                        }
                        print("(\(output))", terminator: "")
                    }
                }
            }
        }
    }

    // 정답을 만드는 함수
    func makeAnswerNum() -> [Int] {
        var numbers = [Int]()
        while numbers.count < 3 {
            let randomNum = Int.random(in: 0...9)
            // 숫자가 비어있거나 0이면 초기화하고 첫번째 숫자부터 다시 생성
            if numbers.isEmpty && randomNum == 0 {
                numbers.removeAll()
                continue
            }
            // 생성된 숫자가 배열에 포함되어 있지 않을때만 배열에 추가됨
            if !numbers.contains(randomNum) {
                numbers.append(randomNum)
            }
        }
        return numbers
    }
}
