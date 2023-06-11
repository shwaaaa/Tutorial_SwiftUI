**ActionSheet**
-------

```swift
@State var SomeBinding = false

.actionSheet(.isPresented: $someBinding) {
    ActionSheet(title: Text, message: Text, button: [ActionSheet.Button])

}
```
- SwiftUI는 사용자가 선택할 수있는action Sheet를 만들기위한 ActionSheet View를 제공하며 Alert와 유사하게 작동합니다.
- Alert와 마찬가지로 action Sheet를 표시할지 여부를 추적하는 속성을 정의해야 합니다. 그런 다음 actionSheet() 수정자를 사용하여 해당 속성을 모니터링하고 조건이 true가 되면 선택한 action Sheet를 표시합니다.

```swift
struct ContentView: View {

    @State private var showingSheet = false

    var body: some View{

    }
}
```
- ShowingSheet를 false로 속성값을준 뒤, 아래와 같이 ActionSheet를 작성 할 수 있습니다.
```swift
buttons: [.default(Text(""))]
```
```swift
var body: some View{
    Button("이승와") {
        self.showingSheet.toggle()
    }
    .actionSheet(.isPresented: $showingSheet) {
        ActionSheet(title: Text("Some Title"), message: Text("some message"), buttons: [.default(Text("Dismiss Action Sheet"))])
    }
}
```
***
- Dismiss 버튼 아래에 취소 버튼 만들기
```swift
buttons: [.default(Text("")), .cancel(Text(""))]
```
```swift
var body: some View{
    Button("이승와!") {
        self.showingSheet.toggle()
    }
    .actionSheet(.isPresented: $showingSheet) {
        ActionSheet(title: Text("Some Title"),
                        message: Text("Some message"),
                        buttons: [.default(Text("Dissmiss")),
                                  .cancel(Text("취소"))
                        ])
    }
}
```

***

**함수사용**
-------
- body에 actionSheet를 직접 사용할 수도 있지만 func를 사용하여 코드를 더 깔끔하게 정리할 수 있습니다.
```swift
import SwiftUI
 
struct actionSheet: View {
    @State var showActionSheet: Bool = false
    var body: some View {
        
        Button(action: {
            showActionSheet.toggle()
        }) {
            Text("이승와")
        }
        .actionSheet(isPresented: $showActionSheet, content: getActionSheet)
    }
    // actionSheet 함수
    func getActionSheet() -> ActionSheet {

        let button1: ActionSheet.Button = .default(Text("default".uppercased()))
        let button2: ActionSheet.Button = .destructive(Text("destructive".uppercased()))
        let button3: ActionSheet.Button = .cancle()

        let title = Text("ActionSheet")

        return ActionSheet(title: title, message: nil, buttons[button1, button2, button3])
    }
}
```
