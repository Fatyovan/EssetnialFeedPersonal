//
//  FeedStore.swift
//  EssentialFeed
//
//  Created by Ivan Jovanovik on 6.11.24.
//

import Foundation

public protocol FeedStore {
    typealias DeleteionCompletion = (Error?) -> Void
    typealias InsertionCompletion = (Error?) -> Void
    
    func deleteCachedFeed(completion: @escaping DeleteionCompletion)
    func insert(_ items: [LocalFeedItem], timestamp: Date, completion: @escaping InsertionCompletion)
}


public struct LocalFeedItem: Equatable {
   public let id: UUID
   public let description: String?
   public let location: String?
   public let imageURL: URL
    
    public init(id: UUID, description: String?,
                location: String?, imageURL: URL) {
        self.id = id
        self.description = description
        self.location = location
        self.imageURL = imageURL
    }
}
