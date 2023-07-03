import Foundation

struct Mocks{
    
    /// A mock array of fake responses from the apple github API. It is availabe globally for testing.
    static public let mockRepositoryList: [GHListRepository] = [
        GHListRepository(id: 0, name: "Test/Repository1", description: "A Test Respository to test stuff number 1", favorites: 0, createdAt: "01.02.2023"),
        GHListRepository(id: 0, name: "Test/Repository2", description: "short text", favorites: 100, createdAt: "31.02.2023"),
        GHListRepository(id: 0, name: "Repository3", description: "A Test Respository to test stuff", favorites: 2, createdAt: "30.03.2023"),
        GHListRepository(id: 0, name: "Test/a/Repository4", description: "A Test Respository to test stuff and more stuff and more stuff to create long annoying text", favorites: 10000000, createdAt: "01.02.2002"),
        GHListRepository(id: 0, name: "Repository5", description: "I don't know what to say", favorites: 947, createdAt: "01.01.1900"),
    ]
    
    /// A mock repository from the apple github API. It is availabe globally for testing.
    static public let mockRepository = GHFullRepository(id: 0,
                                                        full_name: "Test Repository",
                                                        organization: "Apple",
                                                        description: "A test Repositroy to test things",
                                                        homepage: "A very legit homepage",
                                                        favorites: 1000000,
                                                        watchers: 10000000,
                                                        forks: 10000,
                                                        issues: 0,
                                                        createdAt: "30.02.2222",
                                                        updatedAt: "31.02.2222",
                                                        pushedAt: "01.13.2222",
                                                        language: "Swift")
}
