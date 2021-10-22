# TrendMedia

### 해결 과정(과제중..작성중..)

#### #tvShowData의 title이름이 실제 asset에 담긴 이름과 같은가?

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

<img width="694" alt="image" src="https://user-images.githubusercontent.com/53874628/137935537-26199b7f-9f0c-4e6d-b317-fb5a5f5242e9.png">

아 대문자..`**lowercased()를 이용하여 모두 소문자로 바꾸어준다.**`

```swift
let posterImageName = row.title.replacingOccurrences(of: " ", with: "_").lowercased()
cell.posterImageView.image = UIImage(named: posterImageName)
```

하지만 여전히 나오지 않는 사진들이 많아서 이후에도 바뀌지 않는 것들은 asset을 확인하면서 바꿔주었다.

데이터가 엄~~~~~~~청 많다면 불가능할텐데..

**`→ 예외처리를 어떻게 해야 할까?`**


image...
<img width="725" alt="어노테이션타이틀수정" src="https://user-images.githubusercontent.com/53874628/138416476-a8adec25-dc01-4793-95a7-cba7b45f1121.png">
