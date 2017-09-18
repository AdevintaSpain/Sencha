
![Matcha logo](HeaderImage.png)

[EarlGrey](https://github.com/google/EarlGrey) is a great tool to test our iOS apps via instrumental tests. With them, we can mimic user actions like tapping a button, scrolling, or typing. Then, we can assert that a text appears in the screen, a view is visible or invisible, or a button is enabled or not.

On the other hand, if you tried EarlGrey, you’ll agree that its API is not discoverable or friendly.

Matcha introduces a discoverable API for the EarlGrey features. So, you and all the iOS team will write instrumental tests with no effort.

Benefits of using EarlGrey (via Matcha) over other UI testing libraries:

* From EarlGrey's own README:

 > EarlGrey’s synchronization features help to ensure that the UI is in a steady state before actions are performed. This greatly increases test stability and makes tests highly repeatable.

 * Thanks to the strict behaviour of EarlGrey's matchers, you may discover some retain cycles in the UI code of your application. Eg: if your application is leaking a view that is being tested, EarlGrey will launch a "multiple elements found" exception (`kGREYMultipleElementsFoundException`) as soon as more than one instance of the same view is found in memory.

 * Unlike with Apple's own XCUITest framework you will be able to interact with your application's code in order to mock/stub any dependency.

## Installation

### Cocoapods

EarlGrey [installation instructions](https://github.com/google/EarlGrey/blob/master/docs/install-and-run.md) are unconventional to say the least. They require you to install a gem that, in turn, monkey patches your local cocoapods gem (!) to perform some changes every time a `pod install` is invoked in your system.

We have found that there is no need to do that, and that's why in order to install Matcha (and with it, EarlGrey) you only need to create a **unit test** target and add the following line to your Podfile under the dependencies of your new target:

```
pod 'Matcha', '~> 1.0'
```

That's it!

## Matcha's actions

### Tapping

```swift

tap(.accessibilityID("AnythingTappableID"))
tap(.text("ButtonTitle"))

tap(.text("CellTitle"), inScrollableElementWith: .accessibilityID("TableViewID"))

```
### Scrolling

```swift

scrollTo(.accessibilityID("AnythingTappableID"), inElementWith: .accessibilityID("TableViewID"))

```

### Typing

```swift

type("Username", inElementWith: .accessibilityID("UsernameTextFieldID"))

```
### Interacting with the keyboard

```swift

tapKeyboardReturnKey()

```

## Matcha's assertions

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

//BEWARE: This also verifies that the table view has only one section, 2 good assertions in 1 :)
assert(tableViewWith: .accessibilityID("TableViewID"), hasRowCount: 30)

//This does the same as the previous assertion but you can specify the section.
assert(tableViewWith: .accessibilityID("TableViewID"), hasRowCount: 30, inSection: 1)

assert(tableViewWith: .accessibilityID("TableViewID"), hasSectionCount: 2)

```

## Matcha's matchers

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
