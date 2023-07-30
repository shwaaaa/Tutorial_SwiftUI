import Foundation
import SwiftUI

class DiaryMemory: ObservableObject {
    @Published var content: String
    let id: UUID
    
    init(content: String) {
        id = UUID()
        self.content = content
    }
}
