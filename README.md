# YFUtils

## Author
***
yfben, benxyz.chen@gmail.com

## Usage
***
### Internationalization
1. Add `Localizable.strings` file and localize it with preferred language
2. Subclass `LocalizedViewController` class
3. Override `setupLocalizedText()` in the subclass
    ```swift
    override func setupLocalizedText() {
      // to localize "Localized title" string, append `.localized()` to it
      self.title = "Localized title".localized()
    }
    ```

### Display message and error
```swift
alert(message: "message_button_message".localized(), type: .error)
```

### Display loading view
```swift
// display localized string for "loading_view_title" for at least 2 seconds
LoadingView.show(message: "loading_view_title".localized(), duration: .milliseconds(Int(2.0 * 1000)))
LoadingView.hide()
```

### Reuse XIB in Strorybaord
1. Design your reusable xib and create the corresponding swift file
2. In the swift file
    - Subclass `CustomView` and mark it with `@IBDesignable` annotation
    - Mark designable property with `@IBInspectable`
    - Override `setupCustomNib()`
3. In the storyboard file, set the ***Custom Class*** as the corresponding class
4. In the xib file, set the ***Custom Class*** of ***File's Owner*** as the corresponding class
5. Enjoy it!!!