**기본코드**
----
```swift
.alert(isPresented: $___){
    Alert(title: Text(""), message: nil, dismissButton: .defalut(Text("")))
}
```
***
**Alert 사용 조건**
-------
1. Alert를 표시할지에 대한 여부를 지정하는 Bool binding (state)
> `@Binding` 다른보기에서 소유 한 값 유형 데이터를 나타냅니다. 바인딩을 로컬로 변경하면 원격 데이터도 변경됩니다. 이것은 데이터를 소유하지 않습니다. 
2. Alert를 반환하는 closure
> 함수 외부에서 선언된 값에 대한 참조를 자동으로 유지하는 익명 함수입니다.
***
- SwiftUI는 bool 값이 상태이기 때문에 변경 될 때마다 뷰를 새로 고칩니다. 결과적으로 true로 설정된 경우 Alert가 표시됩니다.만약 Alert가 해제되면 bool 값이 자동으로 false로 설정됩니다.
***
```swift
.alert(isPresented: $___){
    Alert(title: Text(""), message: nil, dismissButton: .defalut(Text("")))
}
```
> 버튼을 클릭했을때 나오는 메세지는  Title: Text 에 적고, 확인 후 밖으로 빠져 나오는 버튼 메세지를  dismissButton: Text 에 적어줍니다.
```swift
struct ContentView: View {
    @State private var showingAlert = false //showAlert의 bool 타입을 false로 설정

    var body: some View {

        Button("Alert 메세지") {
            self.showingAlert.toggle()
        }
        .foregroundColor(.white) //텍스트의 색상
        .padding()
        .background(Color.green) //배경색
        .cornerRadius(30) //모서리 둥글게
        .font(.system(size: 30)) //폰트 사이즈

        .alert(isPresented: $showingAlert) {
            Alert(title: Text("1114"), message: nil, dismissButton: .default(Text("이승화")))
        }
    }
}
```
***
**두 가지 버튼 추가**
------
- primaryButton: .destructive, secondaryButton: .cancel 로 경고 메세지에 두가지 버튼을 추가 할 수 있습니다.
```swift
.alert(isPresented: $showingAlert) {
                    Alert(title: Text(""), message: Text(""), primaryButton: .destructive(Text(""), action: {//some Action
                    }), secondaryButton: .cancle(Text("")))
}
```
***
```swift
struct ContentView: View{
    
    @State private var showingAlert = false
    
    var body: some View {
        Button(action: {
            self.showingAlert.toggle()
        }) {
            Text("이승화")
            .alert(isPresented: $showingAlert) {
                Alert(Text("이승화"),message: Text("1114"), primaryButton: .destructive(Text("안뇽"), action: {
                    //some action
                }), secondaryButton: .cancle(Text("하2")))
                 }
           }
        }
    }
```
***
- Alert property에 let 과 return 값으로 경고 메세지가 나왔을때, 두가지의 버튼을 만들 수 있습니다.

