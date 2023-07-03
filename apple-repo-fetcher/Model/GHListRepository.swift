import Foundation

/// A struct used to decode backend responses in  fetchRepositories() in classes implementing API protocol.
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
    
   
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.favorites = try container.decode(Int.self, forKey: .favorites)
        self.createdAt = try DateStringFormatter.format(inputDateString: container.decode(String.self, forKey: .createdAt), outputStringFormat: "MMMM dd, yyyy")
    }
}

#if DEBUG
extension GHListRepository{
    
    // Initializer Used to create mock objects
    init(id: Int,
         name: String,
         description: String?,
         favorites: Int,
         createdAt: String) {
        
        self.id = id
        self.name = name
        self.description = description
        self.favorites = favorites
        self.createdAt = createdAt
    }
    
}
#endif
