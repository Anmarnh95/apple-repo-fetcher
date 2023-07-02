import Foundation


/// A struct used to decode backend response.
struct GHFullRepository: Codable, Identifiable {
    let id: Int
    let full_name: String
    let organization: String
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
        case id, description, homepage, language, organization
        case full_name = "full_name"
        case favorites = "stargazers_count"
        case watchers = "watchers_count"
        case forks = "forks_count"
        case issues = "open_issues"
        case createdAt = "created_at"
        case updatedAt = "updatedAt"
        case pushedAt = "pushed_at"
    }
    
    // Initializer Used to create mock objects
    init(id: Int, full_name: String, organization: String, description: String?, homepage: String, favorites: Int, watchers: Int, forks: Int, issues: Int, createdAt: String, updatedAt: String, pushedAt: String, language: String) {
        self.id = id
        self.full_name = full_name
        self.organization = organization
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
