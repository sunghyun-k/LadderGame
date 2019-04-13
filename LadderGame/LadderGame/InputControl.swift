//
//  InputControl.swift
//  LadderGame
//
//  Created by 김성현 on 13/04/2019.
//  Copyright © 2019 Codesquad Inc. All rights reserved.
//

import Foundation

struct InputControl {
    
    private func ask(for question: String) throws -> String {
        print(question)
        guard let input = readLine() else {
            throw InputError.invalidInput
        }
        return input
    }
    
    private func readParticipants() throws -> [String] {
        let participantsFromUser = try ask(for: "참여할 사람 이름을 입력하세요. (이름은 쉼표(,)로 구분하세요)")
        let participants = participantsFromUser.split(separator: ",").map { String($0) }
        guard participants.count > 1 else {
            throw InputError.invalidNumberOfParticipants
        }
        for participant in participants {
            guard participant.count <= 5 else {
                throw InputError.invalidParticipantName
            }
        }
        return participants
    }
    
    private func readHeight() throws -> Int {
        let heightFromUser = try ask(for: "사다리 높이는 몇 개인가요?")
        guard let height = Int(heightFromUser), height > 0 else {
            throw InputError.invalidLadderHeight
        }
        return height
    }
    
    func readLadderInfo() throws -> (participants: [String], height: Int) {
        return (try readParticipants(), try readHeight())
    }
    
}