struct StreamingResponse: Decodable {
    let service: ServiceResponse
}

struct ServiceResponse: Decodable {
    let id: String
    let name: String
    let imageSet: ServiceImageSetResponse
}

struct ServiceImageSetResponse: Decodable {
    let lightThemeImage: String
}
