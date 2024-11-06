//
//  FeedStore.swift
//  EssentialFeed
//
//  Created by Ivan Jovanovik on 6.11.24.
//


public protocol FeedStore {
    typealias DeleteionCompletion = (Error?) -> Void
    typealias InsertionCompletion = (Error?) -> Void
    
    func deleteCachedFeed(completion: @escaping DeleteionCompletion)
    func insert(_ items: [FeedItem], timestamp: Date, completion: @escaping InsertionCompletion)
}
