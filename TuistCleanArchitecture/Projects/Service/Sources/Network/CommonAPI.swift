//
//  CommonAPI.swift
//  ModularSwift
//
//  Created by Bradley.yoon on 2023/07/17.
//  Copyright © 2023 YsCompnay. All rights reserved.
//

import Foundation

import Moya

public enum GenderStatus: String {
    case male = "male"
    case female = "female"
}

public enum CommonAPI {
    case getProfile(Int, Int, String)
}

extension CommonAPI: Moya.TargetType {
    
    public var headers: [String : String]? {
        var headers: [String: String] = [:]
        headers["Accept"] = "application/json"
        return headers
    }
    
    public var baseURL: URL { getBaseURL() }
    public var path: String { getPath() }
    public var method: Moya.Method { getMethod() }
    public var task: Task { getTask() }
    
    
}
