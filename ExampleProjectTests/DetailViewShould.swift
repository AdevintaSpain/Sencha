import Foundation
import XCTest
import Sencha

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

    func test_show_a_placeholder_text() {

        assertVisible(.text("Some placeholder text"))
    }

    func test_show_an_interactable_text_field() {

        type(
            text: "I am typing stuff!!",
            inElementWith: .accessibilityID(DetailViewController.AccessibilityID.textField)
        )

        assertVisible(.text("I am typing stuff!!"))
    }

    func test_show_a_swicth_with_on_state_and_turn_onto_off_state() {
        assertSwitchIsOn(.accessibilityID(DetailViewController.AccessibilityID.switchOn))

        tap(.accessibilityID(DetailViewController.AccessibilityID.switchOn))

        assertSwitchIsOff(.accessibilityID(DetailViewController.AccessibilityID.switchOn))
    }
}
