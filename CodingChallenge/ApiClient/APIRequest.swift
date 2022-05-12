import Foundation

public enum ApiRequestType: String {
    case GET, POST
}

protocol APIRequest {
    var baseURL : URL { get }
    var method: ApiRequestType { get }
    var path: String { get }
    var parameters: [String : String] { get }
}

extension APIRequest {
    
    func request() -> URLRequest {
        guard var components = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: false) else {
            fatalError("Unable to create URL components")
        }

        components.queryItems = parameters.map {
            URLQueryItem(name: String($0), value: String($1))
        }

        guard let url = components.url else {
            fatalError("Could not get url")
        }

        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
}
