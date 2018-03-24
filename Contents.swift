//用 if else 述說一個動人故事 (ex: 童話故事，鬼故事，自己的初戀 )
//至少要用到以下兩種型別的比較 :字串的比較與數字的比較
var numberOfPig = 3
var firstPigName = "豬大哥"
var secondPigName = "豬二哥"
var thirdPigName = "豬小弟"
var beginEat = "豬小弟"
var wolfName = "大野狼"
var story = "故事開始："


if numberOfPig > 0 {    // 判斷有幾隻小豬
    if beginEat == thirdPigName {   // 判斷要去吃的那隻小豬是不是豬小弟
        story += "\(wolfName)掉到火鍋裡，故事完結。oink-oink..."
    }else if beginEat == secondPigName {    // 判斷要去吃的那隻小豬是不是豬二哥
        story += "\(wolfName)吹倒了\(secondPigName)的小木屋，快跑到\(thirdPigName)的紅磚屋"
    }else { // 不是吃豬小弟與豬二哥，那就只能是豬大哥
        story += "\(wolfName)吹倒了\(firstPigName)的茅草屋，快跑到\(secondPigName)的小木屋"
    }
}else {
    story += "\(wolfName)沒東西吃，餓死了....howl howl howl"
}
story

// 算全部格子的總合
var totalSum = 0
for row in 0...7 {  // 先處理0到7行 (Row)
    for columns in 0...7 {  // 在處理0到7列（Columns）
        totalSum += row * columns   // 從圖上分析出，每一格都是Row＊Columns，然後將結果累加儲存
    }
}
print(totalSum)

// 奇數行的數字總合
// 方法一：在行的For迴圈內判斷，利用where
var oddSum = 0
for row in 0...7 where row % 2 != 0 {   // 先處理0到7行 (Row)，並判斷是否為奇數
    for columns in 0...7 {  // 在處理0到7列（Columns）
        oddSum += row * columns // 因為只有奇數行會符合條件，所以是奇數的Row＊Columns，然後將結果累加儲存
    }
}
print(oddSum)
// 方法二：進入行的For迴圈內判斷，利用if
oddSum = 0
for row in 0...7 {  // 先處理0到7行 (Row)
    if row % 2 != 0 {   // 判斷該行是否為奇數，若是奇數則進入下一個列的For迴圈
        for columns in 0...7 {  // 在處理0到7列（Columns）
            oddSum += row * columns // 因為只有奇數行會符合條件，所以是奇數的Row＊Columns，然後將結果累加儲存
        }
    }
}
print(oddSum)

// 所有格⼦的總合，除了列數>=⾏數的格⼦
// 方法一：在行的For迴圈內判斷，利用where
var sum = 0
for row in 0...7 {  // 先處理0到7行 (Row)
    for columns in 0...7 where columns < row {  // 在處理0到7列（Columns），並判斷列數是否小於行數
        sum += row * columns    // 因為列數小於行數會符合條件，所以是符合條件的Row＊Columns並將結果累加儲存
    }
}
print(sum)

// 方法二：進入行的For迴圈內判斷，利用if
sum = 0
for row in 0...7 {  // 先處理0到7行 (Row)
    for columns in 0...7 {  // 在處理0到7列（Columns）
        if columns < row {  // 判斷該列是否小於行數，若小於行數則進入下一個列的For迴圈
            sum += row * columns    // 因為列數小於行數會符合條件，所以是符合條件的Row＊Columns並將結果累加儲存
        }
    }
}
print(sum)

// 定義function，接受3個參數，起始值，最大值和決定數字倍數的number， 回傳運算結果  比方起始值3，最大值98，決定數字倍數的number為5時，(只包含5的倍數)  運算結果為 5 + 10 + 15 + ..... + 95

func calculateMultipleFive( start: Int, max: Int, multiple: Int) -> Int{
    var sum = 0
    for value in start ... max where value % multiple == 0{ // 利用for迴圈判斷與執行當前的值是否整除數字倍數
        sum += value    // 累加符合條件的數字總和
    }
    return sum
}

print (calculateMultipleFive(start: 3, max: 98, multiple: 5))   // 呼叫執行calculateMultipleFive()

// 定義function，接受3個參數，起始值，最大值和決定數字倍數的number， 回傳運算結果  比方起始值3，最大值11，決定數字倍數的number為5時，(不包含5的倍數)  運算結果為 3 + 4 + 6 + 7 + 8 + 9 + 11
func calculateNonMultipleFive( start: Int, max: Int, multiple: Int) -> Int{
    var sum = 0
    for value in start ... max where value % multiple != 0{ // 利用for迴圈判斷與執行當前的值是否整除數字倍數
        sum += value    // 累加符合條件的數字總和
    }
    return sum
}

print (calculateNonMultipleFive(start: 3, max: 11, multiple: 5))   // 呼叫執行calculateNonMultipleFive()

// 奇數行的數字總合, 定義function，接受2個參數，分別代表行數和列數
func calculateOddSum(numRow: Int, numColumns: Int) {
    var oddSum = 0
    for row in 0...numRow-1 where row % 2 != 0 {   // 因為從0開始，所以傳入的行(Row)需要-1
        for columns in 0...numColumns-1 {  // 因為從0開始，所以傳入的列Columns）需要-1
            oddSum += row * columns // 因為只有奇數行會符合條件，所以是奇數的Row＊Columns，然後將結果累加儲存
        }
    }
    print (oddSum)
}

calculateOddSum(numRow: 8, numColumns: 8)   // 呼叫執行calculateOddSum()

// 所有格子的總合，除了列數>=行數的格子, 定義function，接受2個參數，分別代表行數和列數。
func calculateSum(numRow: Int, numColumns: Int) {
    var sum = 0
    for row in 0...7 {  // 先處理0到7行 (Row)
        for columns in 0...7 where columns < row {  // 在處理0到7列（Columns），並判斷列數是否小於行數
            sum += row * columns    // 因為列數小於行數會符合條件，所以是符合條件的Row＊Columns並將結果累加儲存
        }
    }
    print(sum)
}
calculateSum(numRow: 8, numColumns: 8)   // 呼叫執行calculateSum()

// 判斷閏年
func isLeapYear(_ year: Int) -> Bool {
    if year % 400 == 0 || (year % 4 == 0 && year % 100 != 0) {  // 計算閏年的公式
        return true // 閏年
    } else {
        return false    // 平年
    }
}

// 定義一個 function ，在 function 裡印出對喜歡的人告白的訊息。請記得要呼叫 function 一萬次，這樣她才會被你的真心感動呀。
func myLover(name: String, myTimes: Int) {
    for _ in 0...myTimes{   // 因為只是單純的印出訊息，所以使用_
        print("I hope life treats you kind.")
        print("And I hope you have all you dreamed off.")
        print("And I wish to you joy & happiness.")
        print("But above all this I wish to you love.")
        print("And I will always love you !")
        print("I will always love you !")
        print("\(name) I love you !")   // 替換成傳入的名字
        print("Always love you !")
    }
}
// 用 function 印出歌詞:
func 門前老樹長新芽() {
    print("門前老樹長新芽")
    print("院裡枯木又開花")
    print("半生存了好多話")
    print("藏進了滿頭白髮")
}
func 記憶中的小腳丫() {
    print("記憶中的小腳丫")
    print("肉嘟嘟的小嘴巴")
    print("一生把愛交給他")
    print("只為那一聲爸媽")
}
func 時間都去哪兒了(){
    print("時間都去哪兒了")
}

func 滿腦子都是孩子哭了笑了() {
    時間都去哪兒了()
    print("還沒好好感受年輕就老了")
    print("生兒養女一輩子")
    print("滿腦子都是孩子哭了笑了")
}
func 轉眼就只剩下滿臉的皺紋了() {
    時間都去哪兒了()
    print("還沒好好看看你眼睛就花了")
    print("柴米油鹽半輩子")
    print("轉眼就只剩下滿臉的皺紋了")
}

門前老樹長新芽()
記憶中的小腳丫()
滿腦子都是孩子哭了笑了()
轉眼就只剩下滿臉的皺紋了()
記憶中的小腳丫()
滿腦子都是孩子哭了笑了()
轉眼就只剩下滿臉的皺紋了()


func 改_記憶中的小腳丫() {
    print("記憶中的小腳丫")
    print("肉嘟嘟的小嘴巴")
    print("一生把愛交給亮亮")
    print("只為那一聲爸媽")
}

func 改_轉眼就只剩下滿臉的皺紋了() {
    時間都去哪兒了()
    print("還沒好好看看你眼睛就花了")
    print("努力賺錢半輩子")
    print("轉眼就只剩下滿臉的皺紋了")
}
門前老樹長新芽()
改_記憶中的小腳丫()
滿腦子都是孩子哭了笑了()
改_轉眼就只剩下滿臉的皺紋了()
改_記憶中的小腳丫()
滿腦子都是孩子哭了笑了()
改_轉眼就只剩下滿臉的皺紋了()


