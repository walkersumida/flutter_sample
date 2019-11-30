# flutter_sample

A new Flutter project.

## Dirs

```
┣ lib
┃  ┣ blocs(Business logic, Manage streams, Called from the UI)
┃  ┃  ┗ user_bloc.dart
┃  ┣ models(Define object types)
┃  ┃  ┃ user.dart
┃  ┃  ┗ user_response.dart
┃  ┣ resources
┃  ┃  ┣ providers(Call external requests, Called from the Repository)
┃  ┃  ┃  ┗ user_provider.dart
┃  ┃  ┗ repositories(Called from the BloC)
┃  ┃     ┗ user_repository.dart
┃  ┣ ui
┃  ┃  ┣ screens(Main views per page)
┃  ┃  ┗ widgets(Called from the Screen)
┃  ┗ main.dart
┣ android
┗ ios
```

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Run
### Open file

```
open ios/Runner.xcworkspace/
```

### Run simulator

Click `▶` button on Xcode

### Run flutter

```
flutter run
```
