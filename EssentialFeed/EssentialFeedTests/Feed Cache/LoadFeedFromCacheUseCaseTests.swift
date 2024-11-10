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
    
    private class FeedStoreSpy: FeedStore {
         
         enum ReceivedMessage: Equatable {
             case deleteCachedFeed
             case insert([LocalFeedImage], Date)
         }
         
         private(set) var receivedMessages = [ReceivedMessage]()
         
         private var deletionCompletions = [DeleteionCompletion]()
         private var insertionCompletions = [InsertionCompletion]()
         
         func deleteCachedFeed(completion: @escaping DeleteionCompletion) {
             deletionCompletions.append(completion)
             receivedMessages.append(.deleteCachedFeed)
         }
         
         func completeDeletion(with error: Error, at index: Int = 0) {
             deletionCompletions[index](error)
         }
         
         func completeDeletionSuccessfully(at index: Int = 0) {
             deletionCompletions[index](nil)
         }
         
         func insert(_ feed: [LocalFeedImage], timestamp: Date, completion: @escaping InsertionCompletion) {
             insertionCompletions.append(completion)
             receivedMessages.append(.insert(feed, timestamp))
         }
         
         func completeInsertion(with error: Error, at index: Int = 0){
             insertionCompletions[index](error)
         }
         
         func completeInsertionSuccessfully(at index: Int = 0){
             insertionCompletions[index](nil)
         }
     }
    
}
