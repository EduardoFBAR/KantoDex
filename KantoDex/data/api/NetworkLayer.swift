//
//  NetworkLayer.swift
//  KantoDex
//
//  Created by Eduardo Flores Belo on 1/2/21.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias NetworkStartHandler = () -> ()
typealias NetworkErrorHandler = (Any?) -> ()
typealias NetworkFinishHandler = (Any?) -> ()

class NetworkLayer: NSObject {
    var start: NetworkStartHandler?
    var error: NetworkErrorHandler?
    var finish: NetworkFinishHandler?
    var api: API?
    var parameters: [String: AnyObject]?
    var headers: [String: String]?
    
    func setStartHandler(start: @escaping NetworkStartHandler) {
        self.start = start
    }
    
    func setErrorHandler(error: @escaping NetworkErrorHandler) {
        self.error = error
    }
    
    func setFinishHandler(finish: @escaping NetworkFinishHandler) {
        self.finish = finish
    }
    
    private func getMethod(api: API) -> Alamofire.HTTPMethod {
        let requestMethod: Alamofire.HTTPMethod
        
        switch api.method {
        case "POST":
            requestMethod = Alamofire.HTTPMethod.post
            break
        case "PUT":
            requestMethod = Alamofire.HTTPMethod.put
            break
        case "DELETE":
            requestMethod = Alamofire.HTTPMethod.delete
            break
        default:
            requestMethod = Alamofire.HTTPMethod.get
            break
        }
        
        return requestMethod
        
    }
    
    // MARK: - Request URL
    
    func requestAPI(api: API, parameters: [String: AnyObject]?, headers: [String: String]?) {
        self.api = api
        self.parameters = parameters
        self.headers = headers
        
        start?()
        
        Alamofire.request(api.path,
                          method: getMethod(api: api),
                          parameters: parameters,
                          encoding: JSONEncoding.default,
                          headers: headers).responseJSON{(response) -> Void in
                            switch response.result {
                            case .success(let json):
                                switch response.response!.statusCode {
                                case 200:
                                    let response = JsonParser.sharedInstance.parseJson(api: api, json: JSON(json))
                                    self.finish?(response)
                                    break
                                default:
                                    self.error?(ERROR)
                                }
                                break
                            case .failure(let error):
                                self.error?(error as NSError)
                                break
                            }
                          }
    }

}
