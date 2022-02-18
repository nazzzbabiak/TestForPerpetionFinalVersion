//
//  Post.swift
//  TestForPerpetio
//
//  Created by Nazar Babyak on 17.02.2022.
//

import Foundation

struct PostModel: Identifiable, Codable, Hashable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}
