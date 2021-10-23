# TrendMedia

## 기능
### ✔︎선택한 종류의 영화관만 지도에 표시하기

- 전체 영화관을 영화관의 종류에 따라서 [MKAnnotation]에 분류하여 넣는다.

```swift
// MARK: - 전체 영화관 리스트 어노테이션 -> 어노테이션 분류
        for i in theaterData.theater {
            
            let theaterAnnotation = MKPointAnnotation()
            theaterAnnotation.title = i.theaterTitle
            print(i.theaterTitle)
            theaterAnnotation.coordinate = CLLocationCoordinate2D(latitude: i.location.0, longitude: i.location.1)
            
            switch i.type {
            case .megabox:
                megaBoxAnnotations.append(theaterAnnotation)
            case .lotteCinema:
                lotteCinemaAnnotations.append(theaterAnnotation)
            case .cgv:
                cgvAnnotations.append(theaterAnnotation)
            }
            
            movieMapView.addAnnotation(theaterAnnotation)
            allAnnotations.append(theaterAnnotation)
        }
```

- 선택된 버튼에 따라서 `view(for: annotaton)?.isHidden`에 따라서 숨기거나(`true`) 보이게 한다(`false`).

```swift
func showAllAnnotation() {
			for annotaton in allAnnotations {
				self.movieMapView.view(for: annotaton)?.isHidden = false
			}
}
    
func showAllAnnotation(selectedAnnotations: [MKAnnotation]) {
			for annotaton in allAnnotations {
				self.movieMapView.view(for: annotaton)?.isHidden = true
			}
        
			for selectedAnnotation in selectedAnnotations {
				self.movieMapView.view(for: selectedAnnotation)?.isHidden = false
			}
}
```
---
## 문제 해결 과정(과제중..작성중..)

### ✔︎tvShowData의 title이름이 실제 asset에 담긴 이름과 같은가?

<img width="720" alt="image" src="https://user-images.githubusercontent.com/53874628/137935588-636a4973-7dd8-4df4-a449-0cda72d6b1ca.png">

- 다르기 때문에 바꾸어 준다.
    
    → `title`의 **공백**을 **_언더바**로 바꾸는 작업을 한다.
    
    → 그런거 모르니까 찾기..
    

#### `replacingOccurrences(of:with:)`

: Returns a new string in which all occurrences of a target string in the receiver are replaced by another given string.<img width="720" alt="image" src="https://user-images.githubusercontent.com/53874628/137935659-c71d7f93-e1a3-4426-8fcb-4a8924d0a3c0.png">


```swift
func replacingOccurrences(of target: String, 
                     with replacement: String) -> String
```

⇒ 사용해 주면 다음과 같다.

```swift
let posterImageName = row.title.replacingOccurrences(of: " ", with: "_")
cell.posterImageView.image = UIImage(named: posterImageName)
```

오잉?

제대로 변하지 않았는지 print(posterImageName)을 통해 확인
아 대문자..`**lowercased()를 이용하여 모두 소문자로 바꾸어준다.**`

```swift
let posterImageName = row.title.replacingOccurrences(of: " ", with: "_").lowercased()
cell.posterImageView.image = UIImage(named: posterImageName)
```

하지만 여전히 나오지 않는 사진들이 많아서 이후에도 바뀌지 않는 것들은 asset을 확인하면서 바꿔주었다.

데이터가 엄~~~~~~~청 많다면 불가능할텐데..

**`→ 예외처리를 어떻게 해야 할까?`**

---
### ⛔️ Error: Terminating app due to uncaught exception 'NSUnknownKeyException', reason: '[<UIViewController 0x103412390> setValue:forUndefinedKey:]: this class is not key value coding-compliant for the key menuButtonView.
    
→ 스토리보드의 @IBOutlet이 컨트롤러에 제대로 연결이 안되었나? 하고 열심히 찾아보고, 삭제 후 다시 연결해 보았지만 해결이 안되고 있었다..!
<img width="778" alt="image" src="https://user-images.githubusercontent.com/53874628/138561403-bc460e16-2806-4d48-84e0-0883c93cbbfa.png">

    
    
❗️원인은 테이블 뷰 셀에 지정해둔 identifier와, 컨트롤뷰에에서 불러온 idenfier가 일치하지 않아서 런타임오류가 계속 발생했던 거였다.
    
→ 중간에 파일의 이름들은 파스칼 케이스로, 내부 변수의 이름들은 카멜케이스에 맞추어서 다시 지정해 주었는데, 꼼꼼하게 확인하고 바꾸었다고 생각했지만 놓친 부분이 있었다..!
    
✔︎ 앞으로는 처음부터 제대로 쓰자😅

---
### Annotation을 구성할 때 구조체 배열로 영화관 리스트를 받았다. 그런데 계속 지도에 표시되지 않는 문제가 발생했다. 어디가 문제인가 싶어서 하나씩 바꾸어 봤는데, 아래의 `i.title`을 `"영화관"`이라는 문자열로 바꾸니 정상적으로 화면에 표시가 되었다.

```swift
struct Theater {
    let title: String
    let location: (Double, Double)
    let type: Type
    let distance: Double
}

enum Type: String {
    case megabox = "메가박스"
    case lotteCinema = "롯데시네마"
    case cgv = "CGV"
}
```

```swift
for i in theaterData.theater {
            let theaterAnnotation = MKPointAnnotation()
						//theaterAnnotation.title = i.title
            theaterAnnotation.title = "영화관"
            print(i.theaterTitle)
            theaterAnnotation.coordinate = CLLocationCoordinate2D(latitude: i.location.0, longitude: i.location.1)
            movieMapView.addAnnotation(theaterAnnotation)
            //moviewMapView.addAnnotations(annotations) ?
        }
```

⛔️ 나는 영화관 리스트를 작성해 놓은 구조체에서, 영화관 이름을 상수 `title`에 저장해 두었는데, 이게 화근이었다.

annotation에는 애플이 지정해놓은 `예약어 title`이 있다. 그래서 내가 임의로 지정한 `상수 title`과 충돌하는 문제였다.

❗️해결 방법은, 구조체 배열의 title을, 예약어와 충돌하지 않도록 다른 이름으로( `theaterTitle`) 바꾸어 주는 것. 정상적으로 화면에 표시된다.
<img width="725" alt="어노테이션타이틀수정" src="https://user-images.githubusercontent.com/53874628/138416476-a8adec25-dc01-4793-95a7-cba7b45f1121.png">

image...

