import SwiftUI

enum ScenePhaseType {
    case active
    case inactive
    case background
}

struct ContentView: View {
    @Environment(\.scenePhase) var scenePhase
    @State var tmpStatus: ScenePhaseType = .active
    @State var isActive: Bool = true
    @State var isSleep: Bool = false
    @State var inActiveCount: Int = 0


    var body: some View {
        VStack {
            Text("非アクティブ: \(self.inActiveCount.description)")
                .foregroundColor(.red)
                .padding()
            Text("\(tmpStatus)")
        }
        .onChange(of: scenePhase) {
            switch scenePhase {
            case .active:
                self.isSleep = false
                self.tmpStatus = .active
                print("アプリがアクティブになりました")
            case .inactive:
                if (self.tmpStatus == .active) {
                    self.inActiveCount += 1
                }
                if (self.tmpStatus == .background && !isSleep){
                    self.inActiveCount -= 1
                }
                self.tmpStatus = .inactive
                print("アプリがインアクティブになりました")
            case .background:
                self.inActiveCount += 1
                if (self.tmpStatus == .active) {
                    self.inActiveCount -= 1
                    self.isSleep = true
                }
                self.tmpStatus = .background
                print("アプリがバックグラウンドに入りました")
            @unknown default:
                print("未知のフェーズに入りました")
            }
        }
    }
}

#Preview {
    ContentView()
}
