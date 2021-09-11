# double_tap_to_exit

Double tap to exit widget. Allow you to implement the tap back twice to exit the app behavior on your mobile app.

## Stack
This package uses:
- WillPopScope widget
- Eyrotoast (to display the warning toast)
- native **exit** method to exit the app

## Example
```dart
@override
Widget build(BuildContext context) {
  return DoubleTapToExit(
    message: "Tap again to exit",
    child: Center("Hello World"),
  );
}
```

## TODO
- Implement toast on the package to remove the eyro_toast dependency
