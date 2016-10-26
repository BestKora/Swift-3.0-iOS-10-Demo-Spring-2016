//
//  TwitterUser+CoreDataClass.swift
//  Smashtag
//
//  Created by Tatiana Kornilova on 10/15/16.
//  Copyright © 2016 Stanford University. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData
import Twitter


public class TwitterUser: NSManagedObject {
    class func twitterUserWith(twitterInfo: Twitter.User, inManagedObjectContext context: NSManagedObjectContext) -> TwitterUser?
    {
        let request: NSFetchRequest <TwitterUser> = TwitterUser.fetchRequest()
        request.predicate = NSPredicate(format: "screenName = %@", twitterInfo.screenName)

        if let tweet = (try? context.fetch(request))?.first {
            // found this tweet in the database, return it ...
            return tweet
        } else {
              let twitterUser = TwitterUser (context: context)
            twitterUser.screenName = twitterInfo.screenName
            twitterUser.name = twitterInfo.name
            return twitterUser
        }
    }
    

}
