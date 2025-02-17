struct LoginModel: Codable {
    let name: String
    let id: Int
}

struct LoginRequestModel: Codable {
    let username: String
    let password: String
}
