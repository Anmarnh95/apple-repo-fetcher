import Foundation


struct MockRepositories{
    
    /// A mock array of fake responses from the apple github API. It is availabe globally for testing.
    static public let mocks: [GitRepository] = [
        GitRepository(id: 0, name: "Test/Repository1", description: "A Test Respository to test stuff number 1", favorites: 0, createdAt: "01.02.2023"),
        GitRepository(id: 0, name: "Test/Repository2", description: "short text", favorites: 100, createdAt: "31.02.2023"),
        GitRepository(id: 0, name: "Repository3", description: "A Test Respository to test stuff", favorites: 2, createdAt: "30.03.2023"),
        GitRepository(id: 0, name: "Test/a/Repository4", description: "A Test Respository to test stuff and more stuff and more stuff to create long annoying text", favorites: 10000000, createdAt: "01.02.2002"),
        GitRepository(id: 0, name: "Repository5", description: "I don't know what to say", favorites: 947, createdAt: "01.01.1900"),
    ]
}
