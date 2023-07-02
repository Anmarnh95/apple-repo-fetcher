import Foundation

/// A struct used to decode backend response.
struct GHListRepository: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
    let description: String?
    let favorites: Int
    let createdAt: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, description
        case favorites = "stargazers_count"
        case createdAt = "created_at"
    }
    
    // Initializer Used to create mock objects
    init(id: Int, name: String, description: String?, favorites: Int, createdAt: String) {
        self.id = id
        self.name = name
        self.description = description
        self.favorites = favorites
        self.createdAt = createdAt
    }
}
