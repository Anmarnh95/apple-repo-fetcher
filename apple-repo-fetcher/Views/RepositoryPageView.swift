import Foundation
import SwiftUI

struct RepositoryPageView: View {
    
    var repo: GHFullRepository
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10){
                HStack {
                    Text(repo.fullName)
                        .font(.largeTitle)
                    Spacer()
                }
                Text(repo.description ?? "")
                Divider()
                Text("Language:  \(repo.language)")
                Text("Homepage:  \(repo.homepage)")
                Divider()
                datesGrid
                Divider()
                numbersGrid
                Spacer()
            }
            .padding()
        }
    }
    
    var datesGrid: some View {
        Grid(horizontalSpacing: 30, verticalSpacing: 5){
            GridRow{
                Text("Created at:")
                    .gridColumnAlignment(.leading)
                Text(repo.createdAt)
            }
            GridRow {
                Text("Last updated at:")
                    .gridColumnAlignment(.leading)
                Text(repo.updatedAt)
            }
            GridRow {
                Text("Last pushed at:")
                    .gridColumnAlignment(.leading)
                Text(repo.pushedAt)
            }
        }
    }
    
    var numbersGrid: some View {
        Grid(horizontalSpacing: 30, verticalSpacing: 5){
            GridRow{
                Image(systemName: "eye")
                Image(systemName: "star")
                Image(systemName: "exclamationmark.octagon")
                Image(systemName: "tuningfork")
            }
            GridRow{
                Text("watchers")
                    .font(.caption2)
                Text("favorites")
                    .font(.caption2)
                Text("issues")
                    .font(.caption2)
                Text("Forks")
                    .font(.caption2)
            }
            Divider()
            GridRow{
                Text("\(repo.watchers)")
                Text("\(repo.favorites)")
                Text("\(repo.issues)")
                Text("\(repo.forks)")
            }
            Divider()
        }
    }
}

struct RepositoryPageView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoryPageView(repo: Mocks.mockRepository)
    }
}
