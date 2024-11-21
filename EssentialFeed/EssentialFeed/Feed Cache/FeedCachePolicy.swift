//
//  FeedCachePolicy.swift
//  EssentialFeed
//
//  Created by Ivan Jovanovik on 21.11.24.
//

import Foundation

internal final class FeedCachePolicy {
    private init() {}
    
    private static let calendar = Calendar(identifier: .gregorian)
    
    private static var maxCacheAgeinDays: Int {
        return 7
    }
    
    internal static func validate(_ timestamp: Date, against date: Date) -> Bool {
        guard let maxCacheAge = calendar.date(byAdding: .day, value: maxCacheAgeinDays, to: timestamp) else {
            return false
        }
        
        return date < maxCacheAge
    }
}
