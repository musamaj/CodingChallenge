import Foundation

class PhotosRequest: APIRequest {
    var baseURL = URL(string: "https://picsum.photos/")!
    var method = ApiRequestType.GET
    var path = "v2/list"
    var parameters = [String: String]()

    init(page: Int) {
        parameters["page"] = String(page)
    }
}
