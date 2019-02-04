import Foundation
import XCTest
import Sencha

@testable import ExampleProject

class ViewDetailShould: XCTestCase {
    
    let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: MainViewController.self))
    let textFieldMatcher = Matcher.accessibilityID(DetailViewController.AccessibilityID.textField)
    let slider = Matcher.accessibilityID(DetailViewController.AccessibilityID.slider)
    let picker = Matcher.accessibilityID(DetailViewController.AccessibilityID.datePicker)
    
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
            text: "text",
            inElementWith: textFieldMatcher
        )

        assertVisible(.text("text"))
    }

    func test_show_a_switch_with_on_state_and_turn_onto_off_state() {
        assertSwitchIsOn(.accessibilityID(DetailViewController.AccessibilityID.switchOn))

        tap(.accessibilityID(DetailViewController.AccessibilityID.switchOn))

        assertSwitchIsOff(.accessibilityID(DetailViewController.AccessibilityID.switchOn))
    }
    
    func test_clear_text_from_a_filled_text_field() {
        type(
            text: "text",
            inElementWith: textFieldMatcher
        )
        
        clearTextInElement(with: textFieldMatcher)
        
        assertNotVisible(.text("text"))
    }

    func test_be_able_to_slide_a_slider() {
        assertSlider(slider, hasValue: .equalTo(0.5))
        moveSlider(slider, to: 1)
        assertSlider(slider, hasValue: .equalTo(1))
    }

    func test_be_able_to_validate_a_slider_value() {
        assertSlider(slider, hasValue: .greaterThan(0.0))
        assertSlider(slider, hasValue: .equalTo(0.5))
        assertSlider(slider, hasValue: .lessThan(1.0))
    }

    func test_be_able_to_change_a_pickers_value() {
        movePicker(picker, to: Date(timeIntervalSince1970: 0))
    }
}
