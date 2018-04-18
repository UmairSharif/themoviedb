//
//  SPVideo.swift
//  STARZ PLAY
//
//  Created by Muhammad Umair on 17/04/2018.
//  Copyright © 2018 Umair. All rights reserved.
//

import UIKit

class SPVideo: NSObject, Codable {
    var vote_average: Double?
    var vote_count: Int?
    var id: Int?
    var video: Bool?
    var title: String?
    var media_type: String?
    var popularity: Double?
    var poster_path: String?
    var original_language: String?
    var original_title: String?
    var genre_ids: [String]?
    var backdrop_path: String?
    var adult: Bool?
    var overview: String?
    var release_date: String?
    
    init(json: [String: AnyObject]) {
        
        self.vote_average = json["vote_average"] as? Double
        self.vote_count = json["vote_count"] as? Int
        self.id = json["id"] as? Int
        self.video = json["video"] as? Bool
        self.title = json["title"] as? String
        self.media_type = json["media_type"] as? String
        self.popularity = json["popularity"] as? Double
        self.poster_path = json["poster_path"] as? String
        self.original_language = json["original_language"] as? String
        self.original_title = json["original_title"] as? String
        self.backdrop_path = json["backdrop_path"] as? String
        self.adult = json["adult"] as? Bool
        self.overview = json["overview"] as? String
        self.release_date = json["release_date"] as? String
        self.genre_ids = json["genre_ids"] as? [String]
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        self.vote_average = aDecoder.decodeObject(forKey: "vote_average") as? Double
        self.vote_count = aDecoder.decodeObject(forKey: "vote_count") as? Int
        self.id = aDecoder.decodeObject(forKey: "id") as? Int
        self.video = aDecoder.decodeObject(forKey: "video") as! Bool
        self.title = aDecoder.decodeObject(forKey: "title") as? String
        self.media_type = aDecoder.decodeObject(forKey: "media_type") as? String
        self.popularity = aDecoder.decodeObject(forKey: "popularity") as? Double
        self.poster_path = aDecoder.decodeObject(forKey: "poster_path") as? String
        self.original_language = aDecoder.decodeObject(forKey: "original_language") as? String
        self.original_title = aDecoder.decodeObject(forKey: "original_title") as? String
        self.backdrop_path = aDecoder.decodeObject(forKey: "backdrop_path") as? String
        self.adult = aDecoder.decodeObject(forKey: "adult") as! Bool
        self.overview = aDecoder.decodeObject(forKey: "overview") as? String
        self.release_date = aDecoder.decodeObject(forKey: "release_date") as? String
        self.genre_ids = aDecoder.decodeObject(forKey: "genre_ids") as? [String]
        
    }
    
    func encode(with aCoder: NSCoder)
    {
        aCoder.encode(self.vote_average, forKey: "vote_average")
        aCoder.encode(self.vote_count, forKey: "vote_count")
        aCoder.encode(self.id, forKey: "id")
        aCoder.encode(self.video, forKey: "video")
        aCoder.encode(self.title, forKey: "title")
        aCoder.encode(self.media_type, forKey: "media_type")
        aCoder.encode(self.popularity, forKey: "popularity")
        aCoder.encode(self.poster_path, forKey: "poster_path")
        aCoder.encode(self.original_language, forKey: "original_language")
        aCoder.encode(self.original_title, forKey: "original_title")
        aCoder.encode(self.backdrop_path, forKey: "backdrop_path")
        aCoder.encode(self.adult, forKey: "adult")
        aCoder.encode(self.overview, forKey: "overview")
        aCoder.encode(self.release_date, forKey: "release_date")
        aCoder.encode(self.genre_ids, forKey: "genre_ids")
    }
}
class SPSearchVideo: NSObject {
    var title: String?
    var videos = [SPVideo]()
    init(_ titleStr: String, _ videoArray: [SPVideo]) {
        super.init()
        title = titleStr
        videos = videoArray
    }
}
//{
//    "vote_average":5.8,
//    "vote_count":124,
//    "id":335777,
//    "video":false,
//    "media_type":"movie",
//    "title":"The Nut Job 2: Nutty by Nature",
//    "popularity":172.226291,
//    "poster_path":"\/xOfdQHNF9TlrdujyAjiKfUhxSXy.jpg",
//    "original_language":"en",
//    "original_title":"The Nut Job 2: Nutty by Nature",
//
//    "genre_ids":[
//    10751,
//    16, 12, 35
//    ],
//    "backdrop_path":"\/bd1X5nNrrAHVGG0MxsAeCOPPh1w.jpg",
//    "adult":false,
//    "overview":"When the evil mayor of Oakton decides to bulldoze Liberty Par
//    k and build a dangerous amusement park in its place, Surly Squirrel and his ragtag
//    group of animal friends need to band together to save their home, defeat the mayo
//    r, and take back the park.",
//    "release_date":"2017-08-11"
//}

