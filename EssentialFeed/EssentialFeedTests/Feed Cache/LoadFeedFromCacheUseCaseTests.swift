//
//  LoadFeedFromCacheUseCaseTests.swift
//  EssentialFeed
//
//  Created by Ivan Jovanovik on 10.11.24.
//

import XCTest
import EssentialFeed

final class LoadFeedFromCacheUseCaseTests: XCTestCase {
    
    func test_init_doesNotMessageStoreUponCreation() {
        let (_, store) = makeSut()
        
        XCTAssertEqual(store.receivedMessages, [])
    }
    
    //MARK: - Helpers
    
    private func makeSut(currentDate: @escaping () -> Date = Date.init, file: StaticString = #filePath, line: UInt = #line) -> (sut: LocalFeedLoader, store: FeedStoreSpy) {
        let store = FeedStoreSpy()
        let sut = LocalFeedLoader(store: store, currentDate: currentDate)
        trackForMemoryLeaks(store, file: file, line: line)
        trackForMemoryLeaks(sut, file: file, line: line)
        
        return (sut: sut, store: store)
    }
}
