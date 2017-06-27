#  Matcha
**What cool people drink**

Earl Grey is a great tool to test our iOS apps via instrumental tests. With them, we can mimic user actions like tapping a button, scrolling, or typing. Then, we can assert that a text appears in the screen, a view is visible or invisible, or a button is enabled or not.

On the other hand, if you tried Earl Grey, you’ll agree that its API is not discoverable or friendly.

Matcha introduces a discoverable API for the Earl Grey features. So, you and all the iOS team will write instrumental tests with no effort.


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
