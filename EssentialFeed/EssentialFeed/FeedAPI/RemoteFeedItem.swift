//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Ivan Jovanovik on 8.11.24.
//

import Foundation

internal struct RemoteFeedItem: Decodable {
    internal let id: UUID
    internal let description: String?
    internal let location: String?
    internal let image: URL
    
}
