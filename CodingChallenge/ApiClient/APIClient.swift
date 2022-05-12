import Foundation
import RxSwift
import RxCocoa

protocol WebAPIClientType {
    func fetchNews<T: Codable>(apiRequest: APIRequest) -> Observable<T>
}

class WebAPIClient: WebAPIClientType {

    func fetchNews<T: Codable>(apiRequest: APIRequest) -> Observable<T> {
        let request = apiRequest.request()
        return URLSession.shared.rx.data(request: request)
            .map {
                try JSONDecoder().decode(T.self, from: $0)
            }
    }
}
