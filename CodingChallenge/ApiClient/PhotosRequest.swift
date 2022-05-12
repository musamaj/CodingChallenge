import Foundation

class NewsRequest: APIRequest {
    var baseURL = URL(string: "https://picsum.photos/")!
    var method = ApiRequestType.GET
    var path = "v2/list"
    var parameters = [String: String]()

    init() {
//        parameters["access_key"] = "c80a89c14e4cb3a21d55071a248b0d71"
//        parameters["offset"] = String(pagination.offset)
//        parameters["limit"] = String(pagination.limit)
    }
}
