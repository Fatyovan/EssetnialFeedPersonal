//
//  ManagedCache.swift
//  EssentialFeed
//
//  Created by Ivan Jovanovik on 6.5.25.
//


import CoreData

@objc(ManagedCache)
   class ManagedCache: NSManagedObject {
    @NSManaged    var timestamp: Date
    @NSManaged    var feed: NSOrderedSet
}

extension ManagedCache {
       static func newUniqueInstance(in context: NSManagedObjectContext) throws -> ManagedCache {
        try find(in: context).map(context.delete)
        return ManagedCache(context: context)
    }

       static func find(in context: NSManagedObjectContext) throws -> ManagedCache? {
        guard let entityName = entity().name else {
            return nil
        }
        let request = NSFetchRequest<ManagedCache>(entityName: entity().name!)
        request.returnsObjectsAsFaults = false
        return try context.fetch(request).first
    }

       var localFeed: [LocalFeedImage] {
        feed.compactMap { ($0 as? ManagedFeedImage)?.local }
    }
}
