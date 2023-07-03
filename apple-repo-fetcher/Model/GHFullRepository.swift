import Foundation

/// A struct used to decode backend responses in fetchRepositoryByName() in classes implementing API protocol.
struct GHFullRepository: Codable, Identifiable {
    let id: Int
    let fullName: String
    let description: String?
    let homepage: String
    let favorites: Int
    let watchers: Int
    let forks: Int
    let issues: Int
    let createdAt: String
    let updatedAt: String
    let pushedAt: String
    let language: String
    
    enum CodingKeys: String, CodingKey {
        case id, description, homepage, language, forks, watchers
        case fullName = "full_name"
        case favorites = "stargazers_count"
        case issues = "open_issues_count"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case pushedAt = "pushed_at"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.homepage = try container.decode(String.self, forKey: .homepage)
        self.language = try container.decode(String.self, forKey: .language)
        self.forks = try container.decode(Int.self, forKey: .forks)
        self.watchers = try container.decode(Int.self, forKey: .watchers)
        self.fullName = try container.decode(String.self, forKey: .fullName)
        self.favorites = try container.decode(Int.self, forKey: .favorites)
        self.issues = try container.decode(Int.self, forKey: .issues)
        self.createdAt = try DateStringFormatter.format(inputDateString: container.decode(String.self, forKey: .createdAt))
        self.updatedAt = try DateStringFormatter.format(inputDateString: container.decode(String.self, forKey: .updatedAt))
        self.pushedAt = try DateStringFormatter.format(inputDateString: container.decode(String.self, forKey: .pushedAt))
    }
}


#if DEBUG
extension GHFullRepository {
    
    // Initializer Used to create mock objects
    init(id: Int,
         full_name: String,
         organization: String,
         description: String?,
         homepage: String,
         favorites: Int,
         watchers: Int,
         forks: Int,
         issues: Int,
         createdAt: String,
         updatedAt: String,
         pushedAt: String,
         language: String) {
        
        self.id = id
        self.fullName = full_name
        self.description = description
        self.homepage = homepage
        self.favorites = favorites
        self.watchers = watchers
        self.forks = forks
        self.issues = issues
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.pushedAt = pushedAt
        self.language = language
    }
    
}
#endif
