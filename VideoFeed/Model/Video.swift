//
//  Video.swift
//  VideoFeed
//
//  Created by J C on 5/30/23.
//

import Foundation


struct Video: Identifiable, Decodable {
    let videoUrl: String
    var id: String {
        return NSUUID().uuidString
    }
}
