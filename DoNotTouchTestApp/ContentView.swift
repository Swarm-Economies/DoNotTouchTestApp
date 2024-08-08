import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appState: AppState

    var body: some View {
        VStack {
            Text("非アクティブ: \(appState.inActiveCount.description)")
                .foregroundColor(.red)
                .padding()
        }
        .onChange(of: appState.isActive) {
            if !appState.isActive {
                showAlert()
            }
        }
    }


    func showAlert() {
        print("App moved to background.")
    }
}

class AppState: ObservableObject {
    @Published var isActive: Bool = true
    @Published var inActiveCount: Int = 0

    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleAppBecameActive), name: UIApplication.didBecomeActiveNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleAppResignActive), name: UIApplication.willResignActiveNotification, object: nil)
    }

    @objc func handleAppBecameActive() {
        DispatchQueue.main.async {
            self.isActive = true
        }
    }

    @objc func handleAppResignActive() {
        DispatchQueue.main.async {
            self.isActive = false
            self.inActiveCount += 1
        }
    }
}


#Preview {
    ContentView().environmentObject(AppState())
}
