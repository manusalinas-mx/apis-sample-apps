
### Searchable Navigable Sample

How to implement `searchable` modifier and `Navigate` to result automatically 

![Simulator Screen Recording - iPhone 16 - 2024-11-19 at 14 18 00](https://github.com/user-attachments/assets/e95378c3-2350-4f1d-bfdf-288a7214b91c)

## Explanation

**The ViewModel**


```swift
@Observable
class SearchViewModel {

    var results: [String] = []
    var shouldNavigate: Bool = false

    func searching(_ text: String) {
        guard !text.isEmpty else { return }
        
        let items = ["telephone", "telescope", "television", "ball", "basket ball", "volley ball", "Hugo Boss", "Apple", "Google", "Futbol"]
        results = items.filter { $0.localizedCaseInsensitiveContains(text) }

        if !results.isEmpty {
            shouldNavigate = true
        }
    }
}
```

- `shouldNavigate` indicates if the UI can navigate to the detail view rendering the `results` content. If `results`is empty, do not navigate.

- `localizedCaseInsensitiveContains` is super important to find character combination in a string collection

--- 

**The Main View**

```swift
struct ContentView: View {
    @State private var searchText: String = ""
    @State private var typingTimer: Timer? = nil
    @State private var viewModel = SearchViewModel()

    var body: some View {
        NavigationStack {
            VStack {
                Text(searchText.isEmpty ? "Type to search..." : viewModel.results.isEmpty ? "No results found" : "Type something else")
                    .font(.title3)
                    .foregroundColor(.gray)

                Spacer()
            }
            .navigationDestination(isPresented: $viewModel.shouldNavigate) {
                SearchResultView(results: viewModel.results)
            }
            .searchable(text: $searchText)
            .onChange(of: searchText) { _, newValue in
                // Reset the timer when the user types
                typingTimer?.invalidate()
                typingTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
                    // Update results after the delay
                    viewModel.searching(newValue)
                }
            }
            .navigationTitle("Search Items")
        }
    }
}
```

- `typingTimer' helps us to make a delayed second during user typing to avoid searching on any character change

- `searchable` processes implicitly any change on `searchText` variable storing its value state

-  `onChange(of: searchText)` detects any change on `searchText`variable allowing us more control in the `newValue` value. We can invalidate the timer if It's active and re-init the timer after 1 second executing the `searching` method on `View Model`.

-  `navigationDestination(isPresented: ){...}` allows to navigate to the Detail view when `shouldNavigate` value is `true`. When user backs to main screen, `shouldNavigate` automatically handles the `false`value.


