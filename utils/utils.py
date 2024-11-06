# utils.py
from robot.libraries.BuiltIn import BuiltIn

class Utils:
    def __init__(self):
        self.selenium = BuiltIn().get_library_instance("SeleniumLibrary")
        self.builtin = BuiltIn()

    def wait_for_element_to_be_visible(self, locator, timeout=10):
        """Wait for an element to be visible."""
        self.selenium.wait_until_element_is_visible(locator, timeout)

    def input_text_into_field(self, locator, text):
        """Input text into a field and validate the input."""
        self.wait_for_element_to_be_visible(locator)
        self.selenium.input_text(locator, text)
        actual_value = self.selenium.get_value(locator)
        self.builtin.should_be_true(
            actual_value == text,
            f"Expected value: {text}, but got: {actual_value}"
        )

    def validate_element_text(self, locator, expected_text):
        """Validate that the text of an element matches the expected text."""
        self.wait_for_element_to_be_visible(locator)
        actual_text = self.selenium.get_text(locator)
        self.builtin.should_be_true(
            actual_text == expected_text,
            f"Expected text: {expected_text}, but got: {actual_text}"
        )

# Variable For passing throught method Robot Framework
UTILS_INSTANCE = None

def get_utils_instance():
    global UTILS_INSTANCE
    if UTILS_INSTANCE is None:
        UTILS_INSTANCE = Utils()
    return UTILS_INSTANCE

def input_text_into_field(locator, text):
    return get_utils_instance().input_text_into_field(locator, text)

def validate_element_text(locator, expected_text):
    return get_utils_instance().validate_element_text(locator, expected_text)