# LED 전광판 만들기


## 1 Project Setup & UI

### 1. Project Editor

`General > Deployment Info > Device Orientation`

![Untitled](https://user-images.githubusercontent.com/53874628/136777667-75571561-f2fe-4d48-bf9c-ee7c41f1cd80.png)

- iOS Version: 13.0
- Device Orientation: Portrait / Upside Down / Landscape Left / Landscape Right
    
    → 전광판은 보통 가로모드로 사용하기 때문에 Portrait은 필요하지 않아 보이지만, 아이폰으로 내용을 작성할 때의 편리함을 위해 지원하기로 한다.
    
    - [Device Orientation?](https://github.com/yoogail105/SSAC_iOS/issues/3#issue-1015288934)
        
        ```swift
        1. Portrait: 아이폰을 **세로**로 세워둔 방향
        2. Upside Down: 아이패드의 경우, 기기의 위쪽이 **아래**에 향하도록 화면이 전환
        3. Landscape Left: 기기의 위쪽이 **왼쪽**에 위치한 상태로 화면이 회전
        4. Landscape Right: 기기의 위쪽이 **오른쪽**에 위치한 상태로 화면이 회전
        ```
        

### 2. AppIcon 적용

### 3. Launch Screen

- 어떤 기기에서든 화면에 꽉 차도록 설정
    - Add Alignment Constraint: Horizontally, Vertically in container
    - ImageView: Aspect Fill
- LaunchScreen 시간 설정
    
    `AppDelegate`
    
    ```swift
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            // Override point for customization after application launch.
            
            Thread.sleep(forTimeInterval: 3.0)
            return true
        }
    ```
    
## 1 Code
### 1 Tap Gesture

```swift
// 탭 제스처로 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){

         self.view.endEditing(true)

   }
```

### 2 TextField ReuturnKey

- 리턴키 누르면 키보드가 내려가게 구현
- TextField Action 연결 시 `DidEndOnExit`로 설정

```swift
// ReturnKey 누르면 전광판의 글씨 업데이트
    @IBAction func returnKeyClicked(_ sender: UITextField) {
        sendButtonClicked(contentTextFeild)
    }
```

### 3 View isHidden

- Tap Gesture에 추가
- 상단 뷰가 보이고 있으면 사라지게, 안보이면 보이도록 수정

```swift
// 탭 제스처로 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        var upperViewIsHidden = false
        
        self.view.endEditing(true)
				
				// 상단바 on/off
        if slideUIView.isHidden {
            upperViewIsHidden = false
        } else {
            upperViewIsHidden = true
        }
        slideUIView.isHidden = upperViewIsHidden
   }
```

→ 슬라이드로 내려가는 키보드와 다르게, 깜빡! 하고 없어져 버리는게 어색하다.
