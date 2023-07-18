//
//  APIManager.swift
//  ProjectDescriptionHelpers
//
//  Created by Bradley.yoon on 2023/07/14.
//

import Foundation
import Service

import Moya


public class APIManager {
    public static let shared = APIManager()

    private init() { }

    private let provider = MoyaProvider<CommonAPI>(plugins: [MoyaLoggingPlugin()])

    func getProfile(page: Int, per_page: Int, gender: GenderStatus, completion: @escaping (([Gender]) -> Void)) {
        
        
        provider.request(.getProfile(page, per_page, gender.rawValue)) { result in
            switch result {
            case .success(let response):
                do {
                    let data = try JSONDecoder().decode(Genders.self, from: response.data)
                    completion(data.results)
                }catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
