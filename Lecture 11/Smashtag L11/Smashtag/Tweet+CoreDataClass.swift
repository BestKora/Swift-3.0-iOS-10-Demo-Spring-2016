//
//  Tweet+CoreDataClass.swift
//  Smashtag
//
//  Created by Tatiana Kornilova on 10/15/16.
//  Copyright © 2016 Stanford University. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData
import Twitter


public class Tweet: NSManagedObject {
    class func tweetWith(twitterInfo: Twitter.Tweet, inManagedObjectContext context: NSManagedObjectContext) -> Tweet?
    {
        let request: NSFetchRequest<Tweet> = Tweet.fetchRequest()
        request.predicate = NSPredicate(format: "unique = %@", twitterInfo.id)
        
        if let tweet = (try? context.fetch(request))?.first {
            // found this tweet in the database, return it ...
            return tweet
        } else  {
            // created a new tweet in the database
            // load it up with information from the Twitter.Tweet ...
            let tweet = Tweet(context: context)
            tweet.unique = twitterInfo.id
            tweet.text = twitterInfo.text
            tweet.posted = twitterInfo.created as NSDate?
            tweet.tweeter = TwitterUser.twitterUserWith(twitterInfo: twitterInfo.user, inManagedObjectContext: context)
            return tweet
        }
    }

}
