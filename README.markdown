
![Sencha logo](HeaderImage.png)

[EarlGrey](https://github.com/google/EarlGrey) is a great tool to test our iOS apps via instrumental tests. With them, we can mimic user actions like tapping a button, scrolling, or typing. Then, we can assert that a text appears in the screen, a view is visible or invisible, or a button is enabled or not.

On the other hand, if you tried EarlGrey, you’ll agree that its API is not discoverable or friendly.

Sencha introduces a discoverable API for the EarlGrey features. So, you and all the iOS team will write instrumental tests with no effort.

Benefits of using EarlGrey (via Sencha) over other UI testing libraries:

* From EarlGrey's own README:

 > EarlGrey’s synchronization features help to ensure that the UI is in a steady state before actions are performed. This greatly increases test stability and makes tests highly repeatable.

 * Thanks to the strict behaviour of EarlGrey's matchers, you may discover some retain cycles in the UI code of your application. Eg: if your application is leaking a view that is being tested, EarlGrey will launch a "multiple elements found" exception (`kGREYMultipleElementsFoundException`) as soon as more than one instance of the same view is found in memory.

 * Unlike with Apple's own XCUITest framework you will be able to interact with your application's code in order to mock/stub any dependency.

## Installation

### Cocoapods

EarlGrey [installation instructions](https://github.com/google/EarlGrey/blob/master/docs/install-and-run.md) are unconventional to say the least. They require you to install a gem that, in turn, monkey patches your local cocoapods gem (!) to perform some changes every time a `pod install` is invoked in your system.

We have found that there is no need to do that, and that's why in order to install Sencha (and with it, EarlGrey) you only need to create a **unit test** target and add the following line to your Podfile under the dependencies of your new target:

```
pod 'Sencha'
```

That's it!

## Sencha's actions

### Tapping

```swift

tap(.accessibilityID("AnythingTappableID"))
tap(.text("ButtonTitle"))

tap(.text("CellTitle"), inScrollableElementWith: .accessibilityID("TableViewID"))

//Tapping the back button contained in a UINavigationBar when using push navigation mode
tapBackButton()

```
### Scrolling

```swift

scrollTo(.accessibilityID("AnythingTappableID"), inElementWith: .accessibilityID("TableViewID"))
scrollToBottom(in: .accessibilityID("TableViewID"))
scrollToTop(in: .accessibilityID("TableViewID"))
scrollToLeft(in: .accessibilityID("TableViewID"))
scrollToRight(in: .accessibilityID("TableViewID"))

```

### Text actions

⚠️ Use this method if you need the delegate methods of the text input to be triggered (otherwise use insertText below)
This method uses the simulator's keyboard to type, and depending on the text it might fail.
```swift

type("Username", inElementWith: .accessibilityID("UsernameTextFieldID"))

```
⚠️ Use this method if you don't need the delegate methods of the text input to be triggered.
```swift

insertText("Username", inElementWith: .accessibilityID("UsernameTextFieldID"))

```
```swift

clearTextInElement(.accessibilityID("UsernameTextFieldID"))

```
### Interacting with the keyboard

```swift

tapKeyboardReturnKey()

```

### Interacting with sliders

```swift

moveSlider(.accessibilityID("SliderID"), to: 0.5)

```

### Interacting with pickers

```swift

movePicker(.accessibilityID("PickerID"), to: Date())
movePicker(.accessibilityID("PickerID"), column: 1, to: "10")

```

## Sencha's assertions

```swift

assertVisible(.text("EmptyStateText"))
assertVisible(.accessibilityID("EmptyStateID"))
assertVisible(.class(UIActivityIndicator.class))

assertVisible(.text("EmptyStateText"), inScrollableElementWith: .accessibilityID("TableViewID"))
assertVisible(.text("EmptyStateText"), inScrollableElementWith: .accessibilityID("RegularScrollViewID"))

assertNotVisible(.text("EmptyStateText"))
assertNotVisible(.text("EmptyStateText"), inScrollableElementWith: .accessibilityID("TableViewID"))

```

### Verifying TableView content

```swift

assert(tableViewWith: .accessibilityID("TableViewID"), hasRowCount: 30)
assert(tableViewWith: .accessibilityID("TableViewID"), hasRowCount: 30, inSection: 1)
assert(tableViewWith: .accessibilityID("TableViewID"), hasSectionCount: 2)
assertTableViewIsEmpty(with: .accessibilityID("TableViewID"))
assertTableViewIsNotEmpty(with: .accessibilityID("TableViewID"))

```

### Verifying CollectionView content

```swift

assert(collectionViewWith: .accessibilityID("CollectionViewID"), hasCellCount: 30)
assert(collectionViewWith: .accessibilityID("CollectionViewID"), hasCellCount: 30, inSection: 1)
assert(collectionViewWith: .accessibilityID("CollectionViewID"), hasSectionCount: 2)
assertCollectionViewIsEmpty(with: .accessibilityID("CollectionViewID"))
assertCollectionViewIsNotEmpty(with: .accessibilityID("CollectionViewID"))

```

### Verifying Switch state
```swift

assertSwitchIsOn(.accessibilityID("SwitchID"))
assertSwitchIsOff(.accessibilityID("SwitchID"))
 
```

### Verifying Slider value
```swift

assertSlider(.accessibilityID("SliderID"), hasValue: .equalTo(0.5))
assertSlider(.accessibilityID("SliderID"), hasValue: .greaterThan(0.0))
assertSlider(.accessibilityID("SliderID"), hasValue: .lessThan(1.0))

```

### Verifying Picker value

```swift 

assertPicker(.accessibilityID("pickerID"), hasValue: Date())
assertPicker(.accessibilityID("pickerID"), hasValue: "10", inColumn: 1)

```

## Sencha's matchers

In order to find interface elements and perform actions on them, we need some matchers. In other libraries this is achieved by finding an element via the _accessibilityLabel_ property of a view, but this property is meant for VoiceOver, and shouldn't be used for testing.
Or yes, it's completely up to you, but at least you can choose :)

The most important matchers are:

```swift

Matcher.text(String)
Matcher.accessibilityID(String)
Matcher.accessibilityLabel(String)
Matcher.class(AnyClass)

```
Using the _.accessibilityLabel(String)_ matcher is not recommended. It can interfere with the user experience when using VoiceOver i.e.; if you put internal element identifiers, VoiceOver will read them.
