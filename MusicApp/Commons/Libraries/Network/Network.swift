//
//  Network.swift
//  MusicApp
//
//  Created by Juliano Terres on 25/04/19.
//  Copyright © 2019 Juliano Terres. All rights reserved.
//

import Alamofire

class Network: NetworkProtocol {
  
  func request(url: String, method: HTTPMethod, parameters: Parameters?, success: @escaping (Data) -> Void, failure: @escaping (String) -> Void) {
    
    guard let token = UserDefaults.standard.object(forKey: "token") as? String else {
      failure("Failed to get the token")
      return
    }
    
    let headers: HTTPHeaders = [
      "Authorization": token,
      "Accept": "application/json",
      "Content-Type": "application/json"
    ]
    
    var urlRequest = URLComponents(string : url)!
    var parametersPost = parameters
    
    if let parametersPassed = parameters, method == .get {
      let queryItens = parametersPassed.map{ URLQueryItem(name: $0.key, value : ($0.value as! String)) }
      urlRequest.queryItems = queryItens
      parametersPost = nil
    }
    
    defaultRequest(url: urlRequest, method: method, parameters: parametersPost, encoding: JSONEncoding.default, headers: headers, success: { (response) in
      success(response)
    }) { (error) in
      failure(error)
    }
    
  }
  
  func requestToken(url: String, code: String, type: TokenRequestType, success: @escaping (Data) -> Void, failure: @escaping (String) -> Void) {
    
    let grantTypeValue = (type == .new) ? "authorization_code" : "refresh_token"
    let typeKey = (type == .new) ? "code" : "refresh_token"
    let clientId = "a11c2af175c64095b4a6f2677ea96d69"
    let clientSecret = "5cd31bff7dec4584af404461042c001b"
    let autorizationHash = (clientId + ":" + clientSecret).toBase64
    
    let parameters: Parameters = [
      "grant_type": grantTypeValue,
      typeKey: code,
      "redirect_uri": "musicappspotifychallange://"
    ]
    
    let headers: HTTPHeaders = [
      "Authorization": "Basic " + autorizationHash
    ]
    
    let urlRequest = URLComponents(string : url)!
    
    defaultRequest(url: urlRequest, method: .post, parameters: parameters, encoding: URLEncoding(), headers: headers, success: { (response) in
      success(response)
    }) { (error) in
      failure(error)
    }
    
  }
  
  private func defaultRequest(url: URLComponents, method: HTTPMethod, parameters: Parameters?, encoding: ParameterEncoding, headers: HTTPHeaders?, success: @escaping (Data) -> Void, failure: @escaping (String) -> Void) {
    
    print("->START REQUEST:(\(method.rawValue))\n\(url.url?.absoluteString ?? "")\n")
    
    Alamofire.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers).validate().responseJSON(completionHandler: { [weak self] response in
      self?.logAlamofireRequest(response: response)
      switch response.result {
      case .success:
        if let data = response.data {
          success(data)
        }
      case .failure(let error):
        failure(error.localizedDescription)
      }
    })
    
  }
  
  private func logAlamofireRequest(response: DataResponse<Any>) {
    
    guard let request = response.request else { return }
    guard let url = request.url else { return }
    guard let httpMethod = request.httpMethod else { return }
    
    print("->REQUEST(\(httpMethod))\n\(url)\n")
    
    if let requestHeaders = request.allHTTPHeaderFields, !requestHeaders.isEmpty {
      print("->HEADERS\n\(requestHeaders)\n")
    }
    
    if let httpBody = request.httpBody {
      do {
        let jsonBody = try JSONSerialization.jsonObject(with: httpBody)
        print("->BODY\n")
        print(String(data: try! JSONSerialization.data(withJSONObject: jsonBody, options: .prettyPrinted), encoding: .utf8)!)
        print("\n")
      } catch {
        print("Error in the print of the body")
      }
    }
    
    if let responseData = response.response {
      let statusCode = responseData.statusCode
      let statusCodeString = (statusCode != 0) ? "(\(statusCode))" : ""
      print("->RESPONSE" + statusCodeString)
    }
    
    if let values = response.result.value {
      print(String(data: try! JSONSerialization.data(withJSONObject: values, options: .prettyPrinted), encoding: .utf8)!)
    }
    
  }
  
}
