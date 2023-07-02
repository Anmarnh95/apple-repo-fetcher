import SwiftUI

/// Used to describe an GitRepository instance, so it could be shown in the list in LoadedView.
struct RepositoryListView: View {
    
    let repository: GHListRepository
    
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text(repository.name)
                    .foregroundColor(.blue)
                    .font(.title2)
                Text(repository.description ?? "")
                    .font(.body)
                Text(repository.createdAt)
                    .foregroundColor(.gray)
                    .font(.caption)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Spacer()
                HStack(alignment: .bottom, spacing: 0){
                    Text("\(repository.favorites)")
                        .foregroundColor(.gray)
                        .font(.caption)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .imageScale(.small)
                }
            }
        }
    }
}

struct ListEntry_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView(repository: Mocks.mockRepositoryList[1])
            .previewLayout(.fixed(width: 300, height: 70))
        ListItemView(repository:Mocks.mockRepositoryList[4])
            .previewLayout(.fixed(width: 300, height: 100))
    }
}
