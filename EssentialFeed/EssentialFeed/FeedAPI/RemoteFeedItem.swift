//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Ivan Jovanovik on 8.11.24.
//

import Foundation

  struct RemoteFeedItem: Decodable {
      let id: UUID
      let description: String?
      let location: String?
      let image: URL
    
}
