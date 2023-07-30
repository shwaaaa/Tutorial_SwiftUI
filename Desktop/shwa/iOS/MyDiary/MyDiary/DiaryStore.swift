import Foundation

class DiaryStore: ObservableObject {
    @Published var list: [DiaryMemory]

    init() {
        list = [
        DiaryMemory(content: "오느른 기분이 좋았다😎 끄읏"),
        DiaryMemory(content: "오느른 기분이 짜증났다🥵 끄읏"),
        DiaryMemory(content: "오느른 기분이 우울했다🥹 끄읏")]
    }
    func insert(diary: String) {
        list.insert(DiaryMemory(content: diary), at: 0)
    }

    func update(diary: DiaryMemory?, content: String) {
        guard let diary = diary else {
            return
        }
        diary.content = content
    }
}
