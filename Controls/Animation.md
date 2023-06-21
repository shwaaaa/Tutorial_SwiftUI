# Animation
------
- 버튼을 클릭할때마다 화면 또는 이미지가 커지는 효과를 주는것은 `CGFloat` 와 `.scaleEffect`를 사용해야한다.
```swift
struct ContentView: View {
    //state로 animationAmount에 CGFloat을 넣어준다
    @State private var animationAmount: CGFloat = 1

    var body: some View {

        Button("Tapl Me") {
            //버튼이 탭 될때마다 +1씩 상승한다
            self.animationAmount += 1
        }
        .padding(50)
        .background(Color.green)
        .foregroundColor(.white)
        .clipShape(Circle())
        //animationAmount 크기가 변한다.
        .scaleEffect(animationAmount)
    }
}
```
- 이제 버튼을 클릭하면 버튼부분이 확대 되는것을 확인 하실 수 있지만, 여기서 Animation 효과를 줄 수 있다.
```swift
.animation(.default)
```
```swift
struct ContentView: View {
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        
        Button("Tapl Me") {
            self.animationAmount += 1
        }
        .padding(50)
        .background(Color.green)
        .foregroundColor(.white)
        .clipShape(Circle())
        .scaleEffect(animationAmount)
        
        //블러 반경이 0에서 시작하여 3포인트 6포인트 9포인트씩 이동함을 의미함
        .blur(radius: (animationAmount - 1) * 3)
                .animation(.default)
    }
}
```
***

**Animation 커스터마이징**
------
- Animation 효과를 지정하는 방법은 다양한 옵션이 있다.

1. 기본 애니메이션 효과
```swift
.animation(.default)
```

2. 버튼이 끝에 가까워 질수록 느려지는 효과 (빠르게 → 느리게)
```swift
.animation(.easeOut) 
```

3. 초(sec)를 지정해주고 효과 받기
```swift
.animation(.easeinOut(duration: 2))
```

4. 초(sec)를 지정해주고, 딜레이 적용하기 (클릭 후, 1초뒤에 작동함)
```swift
.animation(Animation.easeinOut(duration: 2)
.delay(1))
```

5. 초(sec)를 지정해주고, 원하는 만큼 바운스 적용 하기
```swift
.animation(Animation.easeInOut(duration: 2)
                    .repeatCount(3, autoreverses: true))  //3번 바운스함
```

6. 초(sec)를 지정해주고, 영원히 바운스 적용 하기
```swift
.animation(Animation.easeInOut(duration: 2)
                    .repeatForever(autoreverses: true))  //끝없이 바운스함
```

7. 버튼을 누르면 바운스하는 효과
- stiffness 가 높을수록 바운스하는 속도가 빨라지고, damping 이 낮을수록 바운스 횟수가 높아집니다.
```swift
.animation(.interpolatingSpring(stiffness: 50, damping: 1))
```

8. 버튼 주위에 원이 깜빡이는 오버레이 만들기
- 불투명도 값을 사용하여 버튼 위에 노란색 원이 나타나게 하려고합니다. `overlay { Circle() }` 서클 안쪽에 아래 코드를 작성해주면 사용이 가능합니다.
```swift
//animationAmount가 1이면 불투명이 1이고, 2이면 불투명도가 0이다
.opacity(Double(2 - animationAmount))
```

- 다음으로, 버튼의 animationAmount += 1액션 부분도 주석 처리 하고, Animation 효과를 repeatForver 로 지정해줍니다.
- 불값은 false 로 설정해주세요. Animation 효과 뒤에 .onAppear  { self.animationAmoint = 2 } 를 추가해주면 끝납니다.
```swift
struct ContentView: View {
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        
        Button("Tapl Me") {
            //self.animationAmount += 1
        }
        .padding(50)
        .background(Color.green)
        .foregroundColor(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(Color.yellow, lineWidth: 2)
                .scaleEffect(animationAmount)
                //animationAmount가 1이면 불트명이 1이고, 2이면 불투명도가 0이다
                .opacity(Double(2 - animationAmount))
                .animation(Animation.easeInOut(duration: 1)
                            .repeatForever(autoreverses: false)))
        .onAppear {
            self.animationAmount = 2
        }
    }
}
```

***

**Animation bindings**
--------
- Stepper와 Animation 을 연동 시켜 stepper에 값을 줄 때마다 버튼의 크기를 조절 할 수 있습니다.
```swift
struct ContentView: View {

    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        VStack {
            Stepper("Scale Amount", value: $animationAmount.animation(), in: 1...10)
            
            Spacer()
            
            Button("Tap Me") {
                self.animationAmount += 1
            }
            .padding(40)
            .background(Color.green)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
    }
}
```
- stepper를 누를 때 마다 디버그에서 로그를 보고 싶을땐,
```swift
struct ContentView: View {
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
     print(animationAmount)  //print만 추가해주면 런을 할 수 없지만,
 
        return VStack {    //return을 추가하면 정상적으로 런이 가능하다.
            Stepper("Scale Amount", value: $animationAmount.animation(),
                                                         in: 1...10)
            
     {...}
```

- 위에서 배운 Animation Custom 효과를 이용할 수 도 있습니다. Stepper의 animation()안쪽에 Animation 효과를 넣어주면 됩니다.
```swift
struct ContentView: View {
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        print(animationAmount)
        return VStack {
            Stepper("Scale Amount", value: $animationAmount.animation(
                        Animation.easeInOut(duration: 1).repeatCount(3, autoreverses: true)),
                    in: 1...10)
            
            Spacer()
            
            Button("Tap Me") {
                self.animationAmount += 1
            }
            .padding(40)
            .background(Color.green)
            .foregroundColor(.white)
            .clipShape(Circle())
            .scaleEffect(animationAmount)
        }
    }
}
```
***
**Creating explicit animations / 3D 효과 주기**
------
- 버튼을 탭하면 3D 효과로 회전하게 만드려고 합니다. 여기에는 rotation3DEffect()뷰가 회전하는 방식을 결정하는, 축뿐만 아니라 각도 단위의 회전량을 제공 할 수있는 또 다른 새로운 수정자가 필요합니다.
> - X 축 (수평)을 통해 뷰를 기울이면 위에서 아래로 회전
> - Y 축 (수직)을 통해 뷰를 기울이면 왼쪽에서 오른쪽으로 회전 할 수 있습니다.
> - Z 축 (깊이)을 통해 뷰를 기울이면 왼쪽에서 오른쪽으로 회전 할 수 있습니다.

- 이 작업을 수행하려면 수정할 수있는 상태가 필요하며 회전 각도는 Double 입니다.
```swift
@State private var animationAmount = 0.0
```

- 다음으로 버튼 `AnimationAmount`이 Y 축을 따라 각도 만큼 회전하도록 요청해야 합니다. 즉, 왼쪽에서 오른쪽으로 회전합니다.
```swift
rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z:0))
```

- 버튼의 동작에 코드를 추가하여 AnimationAmount를 탭할 때마다 '360'을 추가합니다.
- `self.animationAmount += 360` 이것을 작성하면, 버튼에 Animation 수정자가 연결되어 있지 않았기 때문에  withAnimation()클로저를 버튼내에 할당해주고 사용하면 SwiftUI는 새 상태로 인한 모든 변경 사항이 자동으로 Animation되도록 읽어드립니다.
```swift
Button("Tap me") {
    withAnimation {
        self.animationAmount += 360
    }
}
```
```swift
struct ContentView: View {
    @State private var animationAmount = 0.0
    
    var body: some View {
        Button("Tap me") {
            withAnimation {
                self.animationAmount += 360
            }
        }
        .padding(40)
        .background(Color.green)
        .foregroundColor(.white)
        .clipShape(Circle())
        .rotation3DEffect(
            .degrees(animationAmount),
            axis: (x: 0.0, y: 1.0, z: 0.0))
    }
}
```
***
**animation stack 컨트롤**
------
- 우선 @State 에 bool 값을 할당해 준 후, 버튼 액션을 toggle로 설정한다.
```swift
struct ContentView: View {
    
    @State private var animationAmount = false

    var body: some View {
        Button("Tap Me") {
            self.animationAmount.toggle()
        }
        //background 보다 frame이 먼저 와야 한다.
        .frame(width: 200, height: 200)
        .background(Color.blue)
        .foregroundColor(.white)
    }
}
```
- 이제 background 와 foregroundColor에 삼항연산자를 넣어줘야 하는데 이 연산자로 인해서 버튼을 클릭할 때, animationAmount가 true이면 '초록색'  false 이면 '노란색' 이 되로록 만들어 본다. 글씨색 또한 같은 방법으로 수정해주시고, 밑에 Animation 효과를 부여한다.
```swift
        Button("Tap Me") {
            self.animationAmount.toggle()
        }
        .frame(width: 200, height: 200)
        .background(.animationAmount ? Color.green : Color.yellow)
        .foregroundColor(.animationAmount ? Color.white : Color.black)
        //Mark: 애니메이션 효과
        .animation(.default)
    }
}
```
- 