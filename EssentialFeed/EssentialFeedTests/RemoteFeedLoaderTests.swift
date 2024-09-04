//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Ivan Jovanovik on 4.9.24.
//

import XCTest

class RemoteFeedLoader {
    
    func load() {
        HTTPClient.shared.requestedURL = URL(string: "https://a-url.com")
    }
        
}

class HTTPClient {
    var requestedURL: URL?
    
    static let shared = HTTPClient()
    
    private init() {}
    
}


final class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient.shared
        _ = RemoteFeedLoader()
        
        
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {
        let client = HTTPClient.shared
        let sut = RemoteFeedLoader()
        
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
    }

}
