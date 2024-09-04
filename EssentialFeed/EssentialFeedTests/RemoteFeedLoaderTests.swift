//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Ivan Jovanovik on 4.9.24.
//

import XCTest

class RemoteFeedLoader {
    
    }

class HTTPClient {
    var requestedURL: URL?
}
final class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient()
        _ = RemoteFeedLoader()
        
        
        XCTAssertNil(client.requestedURL)
    }

}
