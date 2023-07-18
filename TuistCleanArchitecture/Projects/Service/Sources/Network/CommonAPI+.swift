//
//  CommonAPI+.swift
//  ModularSwift
//
//  Created by Bradley.yoon on 2023/07/17.
//  Copyright © 2023 YsCompnay. All rights reserved.
//

import Foundation

import Moya

extension CommonAPI {
    
    func getBaseURL() -> URL {
        #if SANDBOX
        let domain: String = "randomuser.me/api/"
        #else
        let domain: String = "randomuser.me/api/"
        #endif
        return URL(string: "https://\(domain)")!
    }
    
    func getPath() -> String {
        switch self {
        case .getProfile(_, _, _) :
            return ""
        }
    }
    
    func getMethod() -> Moya.Method {
        return .get
    }
    
    func getTask() -> Task  {
        let param: [String: Any]
        switch self {
        case .getProfile(let page, let per_page, let gender):
            param = ["page": page, "results": per_page, "gender": gender]
        }
        return .requestParameters(parameters: param, encoding: URLEncoding.queryString)
    }
}
