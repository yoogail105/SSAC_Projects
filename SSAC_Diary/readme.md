### 1. 필수1: 셀의 갯수 설정: numberOfRowInSections

```swift
//필수1. 셀의 갯수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
```

### 2. 필수2: 셀의 데이터 및 디자인 설정: `cellForRowAt`

1. **dequeueReusableCell로 선언해 주기**

`dequeueReusableCell`: 재사용 매커니즘을 사용, 재사용할 cell의 identifier 전달해 준다.

```swift
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView. dequeueReusableCell(withIdentifier: "setCell")
				
				return cell!
    }
```

→ `cell!`을 반환하는 이유는 dequeueReusableCell이 `UITableViewCell?`을 반환하기 때문이다.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/ceaeebe9-c62a-4fa9-b037-d0a109405d19/Untitled.png)

→ A UITableViewCell object with the associated identifier or nil if no such object exists in the reusable-cell queue.

→ 리유저블 셀 큐에 있는 것이 없으면 Nil을 반환한다? 더 만들 셀(에 들어갈 데이터)이 없으면 nil이라는 건가,,?

1. **cell에 들어갈 데이터 넣어 주기**
- 내가 설정한 데이터는 이렇다.

```swift
let dataSet = [["공지사항", "실험실", "버전 정보"], ["개인/보안","알림", "채팅", "멀티프로필"], ["고객센터/도움말"]]
```

```swift
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "setCell")
        
        cell?.textLabel?.text = dataSet[indexPath.section][indexPath.row]
        
        return cell!
    }
```

- dataSet[indexPath.section][indexPath.row]
    
    → dataSet[0][0] = "공지사항", dataSet[0][0] = "실헙실" ... 이므로 위와 같이 설정해 준다.
    

### 3. Header 설정

```swift
override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {

        return header[section]
    }
```

- `String?`을 반환한다. → header 리스트를 만들었다.

### #시행착오들,,

1. 섹션의 수를 설정하지 않아서 dataSet[0]만 뜸.
    
    ```swift
    //섹션의 수 설정해 주기
        override func numberOfSections(in tableView: UITableView) -> Int {
            return 3
        }
    ```
    
    → dataSet에 따라서 섹션의 수가 자동으로 결정되게 하고 싶었지만 못했다,,
    
2. 셀의 갯수
    
    ```swift
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
             dataSet[section].count
        }
    ```
    
    → 섹션의 수를 받아오기 때문에, 섹션 인덱스를 활용하여 셀의 갯수가 나타나게 했다.
    
3. 헤더 글자 크기
    
    ```swift
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header")
            header?.textLabel?.font = UIFont.boldSystemFont(ofSize: 30)
            return header
    ```
    
    `header를 어디에 설정하는거지`..? 어떠헥 하는지 모르겠다,,
