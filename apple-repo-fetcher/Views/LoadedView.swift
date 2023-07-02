import SwiftUI

/// LoadedView shows the list of GitRepository. 
struct LoadedView: View {
    
    var repos: [GitRepository] = []
    var onRefresh: ()->Void = {}
    
    var body: some View {
        
        if repos.isEmpty {
            Text("No available Repos")
        } else {
            VStack {
                HStack {
                    Text("Apple Repositories")
                        .font(.title)
                        .bold()
                        .padding()
                    Spacer()
                }
                List {
                    ForEach(repos) { repo in
                        ListEntry(repository: repo)
                    }
                }
                .refreshable {
                    onRefresh()
                }
                .listStyle(.plain)
            }
        }
    }
}

struct LoadedView_Previews: PreviewProvider {
    static var previews: some View {
        LoadedView(repos: MockRepositories.mocks, onRefresh: {})
    }
}
