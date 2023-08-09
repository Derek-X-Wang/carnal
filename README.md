# carnal

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

One-time code generation
By running flutter pub run build_runner build --delete-conflicting-outputs in the project root, you generate JSON serialization code for your models whenever they are needed. This triggers a one-time build that goes through the source files, picks the relevant ones, and generates the necessary serialization code for them.

While this is convenient, it would be nice if you did not have to run the build manually every time you make changes in your model classes.

Generating code continuously
A watcher makes our source code generation process more convenient. It watches changes in our project files and automatically builds the necessary files when needed. Start the watcher by running flutter pub run build_runner watch --delete-conflicting-outputs in the project root.

It is safe to start the watcher once and leave it running in the background.

## macOS
App Sandbox disabled.

Sample logs
```
flutter: remove /Users/derekxwang/Downloads/buildspace-os-main/README.md
flutter: modify /Users/derekxwang/Downloads/buildspace-os-main/.DS_Store
# delete assets
flutter: remove /Users/derekxwang/Downloads/buildspace-os-main/assets/48.png
flutter: remove /Users/derekxwang/Downloads/buildspace-os-main/assets/128.png
flutter: remove /Users/derekxwang/Downloads/buildspace-os-main/assets/buildspace-logo.png
flutter: modify /Users/derekxwang/Downloads/buildspace-os-main/.DS_Store
# add assets
flutter: add /Users/derekxwang/Downloads/buildspace-os-main/assets/48.png
flutter: add /Users/derekxwang/Downloads/buildspace-os-main/assets/128.png
flutter: add /Users/derekxwang/Downloads/buildspace-os-main/assets/buildspace-logo.png
flutter: modify /Users/derekxwang/Downloads/buildspace-os-main/.DS_Store
```

## Next steps
- [ ] Add file_selector
- [ ] Scan all for the first time
- [ ] Check change from db records