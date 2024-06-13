//
//  File.swift
//  BaseballGame
//
//  Created by t2023-m0023 on 6/13/24.
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
