//
//  SPAPIManager.swift
//  STARZ PLAY
//
//  Created by Muhammad Umair on 17/04/2018.
//  Copyright © 2018 Umair. All rights reserved.
//

import UIKit

enum RequestType: String {
    case post = "POST"
    case get = "GET"
    case put = "PUT"
}
typealias Failure = (String)->()
typealias Success = (Any)->()
class SPAPIManager: NSObject {
    static let shared = SPAPIManager()
    fileprivate let baseURL = ""
    private override init() {}
    
    fileprivate func createRequest(apiUrl: String, type: RequestType, headers: [String: String]) -> URLRequest? {
        if let url = URL(string: baseURL + apiUrl) {
            var request = URLRequest(url: url)
            request.httpMethod = type.rawValue
            request.allHTTPHeaderFields = headers
            return request
        }
        return nil
    }
    fileprivate func combine(paramString: String, params: [String: String]) -> String {
        var urlString = paramString
        for param in params {
            urlString = urlString.replacingOccurrences(of: param.key + "=", with: param.key + "=" + param.value)
        }
        return urlString
    }
    fileprivate func getRequest(url: String, param: [String: String], completion: @escaping Success, failure: @escaping Failure) {
        let urlString = combine(paramString: url, params: param)
        if let request = createRequest(apiUrl: urlString, type: .get, headers: [:]) {
            let task = URLSession.shared.dataTask(with: request, completionHandler: { (responseData, response, error) in
                if let data = responseData {
                    do{
                        let json = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                        completion(json)
                    }catch let err {
                        failure(err.localizedDescription)
                    }
                }else {
                    failure(error!.localizedDescription)
                }
            })
            task.resume()
        }else {
            failure("Failed to create Request")
        }
    }
    
    //MARK: - All API Calls
    func getVideoDetail(search: String, success: @escaping ([SPVideo])->(), failure: @escaping Failure) {
        let url = kVideoSearchURL
        var param: [String: String] = [:]
        param["api_key"] = kAPIKey
        param["query"] = search
        getRequest(url: url, param: param, completion: { (responseObject) in
            if let json = responseObject as? [String: AnyObject], let results = json["results"] as? [[String: AnyObject]] {
                var videos = [SPVideo]()
                for res in results {
                    let video = SPVideo(json: res)
                    videos.append(video)
                }
                success(videos)
            }else {
                failure("Failed to load data from json")
            }
        }, failure: failure)
    }
}
