import SwiftUI

/// Used to show an error describtion in case of an error.
struct ErrorView: View {
    
    private var errorMessage: String = "Unknown Error occured"
    private var title: String = "Error"
    
    init(message: String, title: String) {
        self.errorMessage = message
    }
    var body: some View {
        VStack {
            Spacer()
            Text(errorMessage)
            Spacer()
        }
        .navigationTitle("Apple Repositories")
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(message: "Test Error", title: "Test Error")
    }
}
