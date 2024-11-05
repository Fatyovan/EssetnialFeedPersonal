//
//  CacheFeedUseCaseTests.swift
//  EssentialFeed
//
//  Created by Ivan Jovanovik on 5.11.24.
//

import XCTest


class LocalFeedLoader {
    init(store: FeedStore) {
        
    }
}

class FeedStore {
    var deleteCachedFeedCallCount: Int = 0
    
}

class CacheFeedUseCaseTests: XCTestCase {
    
    func test_init_doesNotDeleteCacheUponCreation() {
        let store = FeedStore()
        _ = LocalFeedLoader(store: store)
        
        XCTAssertEqual(store.deleteCachedFeedCallCount, 0)
    }
}
