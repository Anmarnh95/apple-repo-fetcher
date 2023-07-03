import SwiftUI

/// Used to show an error describtion in case of an error.
struct ErrorView: View {
    
    private var errorMessage: String = "Unknown Error occured"
    private var title: String = "Error"
    
    /**
     Initializes the ErrorView
     - Parameters:
        - message: A message shown in the middle of the screen describing the error.
        - title:A title for the ErrorView shown in the navigation bar.
     */
    init(message: String, title: String) {
        self.errorMessage = message
        self.title = title
    }
    var body: some View {
        VStack {
            Spacer()
            Text(errorMessage)
            Spacer()
        }
        .navigationTitle(title)
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(message: "Test Error", title: "Test Error")
    }
}
