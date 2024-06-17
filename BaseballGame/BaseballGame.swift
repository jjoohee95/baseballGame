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
    var answerNum: [Int] = []  // 정답 숫자를 저장할 배열

    // 게임 시작 시 정답 숫자를 생성하는 메서드
    func startNewGame() {
        answerNum = makeAnswerNum()
    // print("정답 숫자: \(answerNum)")  정답 디버깅
    }

    // 정답 숫자 생성 메서드
    private func makeAnswerNum() -> [Int] {
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
        // 첫 번째 자리 숫자에 0을 입력했을 경우
        if userNum /100 == 0 && userNum != 0 {
        print("첫 번째 자리에 0이 입력될 수 없습니다. 다시 입력해주세요.")
        return false
        }

        // 세 자리 숫자를 입력했는지 확인
        guard userNumStr.count == 3 else {
            print("세 자리 수를 입력해주세요.")
            tries += 1
            return false
        }

        let userNumSet = Set(userNumStr)
        guard userNumSet.count == 3 else {
            print("특정 숫자가 반복 사용되었습니다. 다시 입력해주세요.")
            tries += 1
            return false
        }
        return true
    }

    //스트라이크 볼 체크 함수
    func checkStrikeBall(userNum: Int) -> (strike: Int, ball: Int)? {
        guard isValidNumber(userNum: userNum) else {
            return nil
        }

        let userNumArray = Array(String(userNum)).compactMap { Int(String($0)) }
        var strike = 0
        var ball = 0
        //숫자 자리 일치 > strike, 숫자만 일치 > ball
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

