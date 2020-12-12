//
//  Api_wrapper.swift
//  Flickr
//
//  Created by Андрей Коноплев on 12.12.2020.
//

import Foundation

class Api_wrapper {
    class func getInteresPhoto(page: Int,
                               per_page: Int,
                               success: @escaping (_ json: Any) -> Void,
                               failure: @escaping (_ error: String?) -> Void) {
        
        let url = Constants.API_const.baseUrl
        
        let params: [String: AnyHashable] = [
            "method": "flickr.interestingness.getList",
            "api_key": Constants.API_const.token,
            "format": "json",
            "per_page": per_page,
            "page": page,
            "nojsoncallback": 1
        ]
        
        let method: HTTPMethod = .GET
        
        let request: URLRequest = Api_conf.createRequest(url: url,
                                                         method: method,
                                                         params: params)
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            Api_conf.generalCompletionHandler(data: data, error: error, success: success, failure: failure)
        }
        
        dataTask.resume()
        
    }
    
    class func getSizeForPhoto(photoID: String,
                               success: @escaping (_ json: Any) -> Void,
                               failure: @escaping () -> Void) {
        
    }
}
