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
    typealias RetrievalCompletion = (Error?) -> Void
    
    func deleteCachedFeed(completion: @escaping DeleteionCompletion)
    func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion)
    func retrieve(completion: @escaping RetrievalCompletion)
}
