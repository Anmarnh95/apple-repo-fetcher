import SwiftUI

/// Used to show an error describtion in case of an error.
struct ErrorView: View {
    
    private var errorMessage: String = "Unknown Error occured"
    
    init(message: String) {
        self.errorMessage = message
    }
    var body: some View {
        VStack {
            HStack {
                Text("Apple Repositories")
                    .font(.title)
                    .bold()
                    .padding()
                Spacer()
            }
            Spacer()
            Text(errorMessage)
            Spacer()
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(message: "Test Error")
    }
}
