This is an app, which fetches the public repositories of apple from Github.

First, apple_repo_fetcherApp file calls the MainView and passes a MainViewModel to it. The MainViewModel is initialized with an ApplePublicReposAPI object, which implements the API protocol. MainViewModel has 3 states, loading, loaded and error. These states are represented by the enum AppState. MainViewModel is first initialized with loading, then, when the api is called , the state turns to loaded in case of success and the informations about the repositories are found in the array Repos.

The array Repo is an array of GitRepository objects. In a GitReposroty, 5 pieces of information is decoded, creation date, name, description, number of favorites, and a unique id.

The api is called by calling startLoading in MainViewModel, which in turn calls fetchRepositories from ApplePublicReposAPI. ApplePublicReposAPI is responsible for fetching the data and decoding them into and array of GitRepository. The function startLoading in the MainViewModel is responsible for state changes and filling the array repos, which in turn get represented in the view.

The MainView calls startLoading when it appears. When the state is loading, MainView shows a progress indicator, when it changes to loaded, it shows the View LoadedView, which shows the array of GitRepository in a list, where the list elements are instances of ListEntry. MainView shows the ErrorView in case of an error state.
