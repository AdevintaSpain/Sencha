
import Foundation
import XCTest
import Matcha

@testable import ExampleProject

class ViewDetailShould: XCTestCase {
    
    let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: MainViewController.self))
    
    override func setUp() {
        super.setUp()
        open(viewController: storyboard.instantiateViewController(withIdentifier: "DetailViewController"))
    }
    
    func test_show_one_enabled_button_and_one_disabled_button() {
        assertEnabled(.text("This is an enabled button"))
        assertDisabled(.text("This is a disabled button"))
    }

    func test_show_an_interactable_text_field() {

        assertVisible(.text("Some placeholder text"))

        type(
            text: "I am typing stuff!!",
            inElementWith: .accessibilityID(DetailViewController.AccessibilityID.textField)
        )

        /*  
         Some UI elements have unintuitive view hieracies, i.e.: The UITextField contains a UITextView for typing and
         a UILabel for displaying text, in this case, if we search the view hieracy with only the text, it finds
         multiple elements.
         
         In this case we can use the .allOf matcher in combination with .firstElement matcher, because we know there
         are multiple elements, but we don't care as long as the text exists.
        */
        assertVisible(
            .allOf([.text("I am typing stuff!!"), .firstElement])
        )

        /*
         Also, we can specify the exact element where we want to serach for the text, using the primitive select
         and assert functions:
        */
        select(
            matcher: .accessibilityID(DetailViewController.AccessibilityID.textField)
        ).assert(
            .text("I am typing stuff!!")
        )
    }
}
