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
- 이제 색만 변하게 하는게 심심하니 clipShape 를 추가해줘서 모양까지 바뀌게 하고싶은데 이것도 삼항연산자 사용해보겠습니다.
- **단 animation 앞에 추가해야합니다!**
- 여러 animation() 수정자를 적용하면 각 수정자가 다음 Animation까지 모든 것을 제어합니다. 이를 통해 모든 속성에 대해 균일하지 않고 모든 종류의 다른 방식으로 상태 변경을 Animation 할 수 있습니다. 예를 들어, 기본 Animation으로 색상을 변경할 수 있지만, 클립 모양에 보간 스프링을 사용할 수 있습니다.
```swift
struct ContentView: View {
    @State private var animationAmount: Bool = false
    
    var body: some View {
        Button("Tap Me") {
            self.animationAmount.toggle()
        }
        .frame(width: 200, height: 200, alignment: .center)
        .background(animationAmount ? Color.green : Color.yellow)
        .foregroundColor(animationAmount ? Color.white : Color.black )
        .animation(.default)
        .clipShape(RoundedRectangle(cornerRadius: animationAmount ? 60 : 0))
        /* 위에 이미 애니메이션 효과를 줬지만, 애니메이션 효과를 한번 더 주면서 
                                       클릭시 덤핑 하는 효과를 한번 더 준다 */
        .animation(.interpolatingSpring(stiffness: 50, damping: 1))
    }
}
```
- 만약, 버튼을 클릭하여 Animation이 적용되고 있는 도중 버튼을 한번더 클릭해서 취소 시키고 싶다고 버튼을 클릭하면, .animation(.default) 값은 취소될 때에도 에니메이션 효과를 주면서 바뀌지만, `.animation(nil)` 값을 주면 바로 중단됩니다.
```swift
.animation(nil)
```

***

**뷰가 표시되고 숨겨지는 효과 만들기 (IF 문)**
-----------
- SwiftUI의 가장 강력한 기능 중 하나는 뷰가 표시되고 숨겨지는 방식을 사용자 지정하는 기능입니다. 이것은 If문을 활용하여 Animation효과를 보여줄 수 있습니다. 우선 해볼것은 버튼을 누를때 빨간색 사각형이 보이게 화면 코드를 작성해야합니다.
```swift
struct ContentView: View {                       
   @State private var isShowingRed = false
    var body: some View {
        
        VStack {
            Button("Tap Me!") {
                self.isShowingRed.toggle()
            }
            //만약 isShowingRed 일 때, 빨간색 사각형
            if isShowingRed {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 200, height: 200)
            }
        }
    }
}
```
- 이렇게만 작성하면 "Tap Me!" 를 눌렀을때 빨간상자가 나타나게 됩니다. 여기서 버튼에 Animation withAnimation 효과를 추가해봅시다.
```swift
VStack {
            Button("Tap Me!") {
                withAnimation {
                    self.isShowingRed.toggle()
                }
            }
}
```

***

**Animation.default**
----------
- 각 `RoundedRectangle`에 삼항연산자를 사용해서 값을 넣어줬고 overlay를 사용하여 어느 효과를 부여받고 있는지 보기 좋게 텍스를 적어줬다.
```swift
import SwiftUI

struct ContentView: View {
    @State var animate: Bool = false
    let timing: Double = 10.0
    var body: some View {
        VStack {
            Button("애니메이션") {
                animate.toggle()
            }
            RoundedRectangle(cornerRadius: 20)
                .frame(width: animate ? 300 : 200, height: 100)
                .overlay(
                    Text("animation : default")
                        .foregroundColor(Color.white)
                )
                .animation(Animation.default)
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: animate ? 300 : 200, height: 100)
                .overlay(
                    Text("animation : easeOut")
                        .foregroundColor(Color.white)
                )
                .animation(Animation.easeOut(duration: timing))
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: animate ? 300 : 200, height: 100)
                .overlay(
                    Text("animation : easeIn")
                        .foregroundColor(Color.white)
                )
                .animation(Animation.easeIn(duration: timing))
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: animate ? 300 : 200, height: 100)
                .overlay(
                    Text("animation : linear")
                        .foregroundColor(Color.white)
                )
                .animation(Animation.linear(duration: timing))  
        }
    }
}
```
- default는 지연(duration) 효과를 주지 않았기 때문에 제일 빠르다
- 순서는 default > EaseOut > linear > EaseIn 순으로 빠른것을 확인할 수 있다.

***

**Animation.Spring / animation(.none)**
--------
- Spring은 default와 비슷해 보이지만 조금 더 자연스럽다. 그리고 duration효과가 필요하지 않는다. 마찬가지로 default와 비교해보자.
```swift
struct ContentView: View {
    @State var animate: Bool = false
    var body: some View {
        VStack {
            Button("애니메이션") {
                animate.toggle()
            }
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: animate ? 300 : 50, height: 100)
                .overlay(
                    Text("Spring")
                        .font(animate ? .headline : .caption)
                        .foregroundColor(Color.white)
                        //텍스트 애니메이션 미적용
                        .animation(.none)
                    
                )
                .animation(Animation.spring())
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: animate ? 300 : 50, height: 100)
                .overlay(
                    Text("default")
                        .font(animate ? .headline : .caption)
                        .foregroundColor(Color.white)
                )
                .animation(Animation.default)
        }
    }
}
```
- 여기서 Text의 크기도 삼항 연산자로 넣어줬는데 Text까지 애니메이션이 적용되어 보기 좋지 않다. 이럴 때 부분적으로 애니메이션을 적용시키지 않게 해주려면 바로 `animation(.none)`만 원하는 위치에 넣어주면 된다.
***
- spring에도 여러가지 기능을 넣을 수 있다.
```swift
RoundedRectangle(cornerRadius: 20)
    .frame(width: animate ? 300 : 50, height: 100)
    .overlay(
        Text("Spring")
            .font(animate ? .headline : .caption)
            .foregroundColor(Color.white)
            //텍스트 애니메이션 미적용
            .animation(.none)
        
    )
    .animation(Animation.spring(
                // 몇초에 걸쳐서 작동시킬지
                response: 3.0,
                // damping 비율 할지
                dampingFraction: 0.3,
                // 블랜드시간 기본 1로 지정
                blendDuration: 1.0)
    )

```
```swift
RoundedRectangle(cornerRadius: 20)
    .frame(width: animate ? 300 : 50, height: 100)
    .overlay(
        Text("Spring")
            .font(animate ? .headline : .caption)
            .foregroundColor(Color.white)
            //텍스트 애니메이션 미적용
            .animation(.none)
        
    )
    .animation(Animation.spring(
                // 몇초에 걸쳐서 작동시킬지
                response: 0.5,
                // 얼마나 덤핑 할지
                dampingFraction: 0.7,
                // 블랜드시간 기본 1로 지정
                blendDuration: 1.0)
    )
```
