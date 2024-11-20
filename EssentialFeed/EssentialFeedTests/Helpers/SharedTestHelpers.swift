//
//  SharedTestHelpers.swift
//  EssentialFeed
//
//  Created by Ivan Jovanovik on 20.11.24.
//

import Foundation

func anyURL() -> URL {
    return URL(string: "https://any-url.com")!
}

func anyNSError() -> NSError {
    return NSError(domain: "any error", code: 0)
}

