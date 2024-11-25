# Infinite Scroll

Page size of 20 items

- API: `GET` https://island-bramble.glitch.me/data?page=1
- Website: https://island-bramble.glitch.me

--- 
![Simulator Screen Recording - iPhone 16 - 2024-11-25 at 13 34 22](https://github.com/user-attachments/assets/62fef943-cb47-430b-8537-44c6da7d40d3)


**ViewModel method**

The way to decide if load more or not is the following condition 

```swift
 var numbers: [Int] = []

   ...

  func shouldLoadMoreData(from page: Int) -> Bool {
        page == numbers.count - 2
    }
```
