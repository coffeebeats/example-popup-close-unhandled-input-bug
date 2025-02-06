# example-popup-close-unhandled-input-bug

A repository demonstrating an issue where `Popup` nodes do not set `ui_cancel` input events as handled.

## Issue description

**EDIT:**

This turned out to not be a bug. The first `ui_cancel` action event is correctly consumed by the `Popup`, it's the release of the `ui_cancel` key that was being detected here (and misinterpreted by me as a "leaking" event). Simply checking for `event.is_action_pressed` in `control.gd` would have prevented the issue. 

~When closing a `Popup` node via the `ui_cancel` action (e.g. when navigating an `OptionButton` item list with a keyboard), the `ui_cancel` action is not set as handled, causing it to continue to propagate through the scene tree.~

~This is problematic when the developer would like to listen for `ui_cancel` events, such as when trying to close a non-`Popup`-based menu, but a nested `OptionButton` will allow a consumed `ui_cancel` event to propagate.~

## Reproduction steps

1. Clone this repository:

    ```sh
    git clone https://github.com/coffeebeats/example-popup-close-unhandled-input-bug.git
    ```

2. Run the `main.tscn` scene via the editor (it's set as the project's default scene).

3. Click on the `OptionButton` in the scene then trigger the `ui_cancel` action by pressing `Escape` on a keyboard. Observe that the ancestor `Control` node receives the event in its `_unhandled_input` callback.
