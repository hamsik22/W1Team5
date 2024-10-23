//
//  TeamData.swift
//  W1Team5
//
//  Created by t2023-m0072 on 10/23/24.
//

import UIKit

struct TeamData {
    
    let name: String
    let info: [Info]
    
    init() {
        let explanation = Info(title: "설명", contents: ["열정과다러들이 모였다."])
        let characteristic = Info(title: "특징", contents: ["No NoBase"])
        let promise = Info(title: "약속", contents: ["마감시간 지키자"])
        let goal = Info(title: "목표", contents: ["악으로 깡으로 버티자"])
        
        self.name = "팀인데5를곁들인"
        self.info = [explanation, characteristic, promise, goal]
    }
    
    struct Info {
        let title: String
        let contents: [String]
    }
}
