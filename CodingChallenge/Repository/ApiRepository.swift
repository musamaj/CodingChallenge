//
//  ApiRepository.swift
//  RxSwiftPractice
//
//  Created by Usama Jamil on 25/01/2022.
//

import Foundation
import RxSwift

class ApiRepository {
    
    private let apiClient: WebAPIClientType
    
    init(client: WebAPIClient) {
        self.apiClient = client
    }
    
    func fetchNews(apiRequest: APIRequest) -> Observable<News> {
        return apiClient.fetchNews(apiRequest: apiRequest)
    }
}
