# Flutter Playground

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://www.apache.org/licenses/LICENSE-2.0)
[![build](https://github.com/jaredsburrows/flutter-app-playground/actions/workflows/build.yml/badge.svg?branch=main)](https://github.com/jaredsburrows/flutter-app-playground/actions/workflows/build.yml)
[![Twitter Follow](https://img.shields.io/twitter/follow/jaredsburrows.svg?style=social)](https://twitter.com/jaredsburrows)

## Setup

**Flutter**

```shell
rm pubspec.lock
rm ios/Podfile.lock
flutter upgrade
flutter pub get
flutter pub upgrade
```

**Build All**

```shell
flutter build apk --debug
flutter build ios --debug --no-codesign
flutter build web
```

## Build the Android app

**Debug**

```shell
flutter build apk --debug
```

**Release APK**

```shell
flutter build apk --release --obfuscate --split-debug-info build/app/outputs/symbols-apk/ --target-platform android-arm64
```

**Release Bundle**

```shell
flutter build appbundle --release --obfuscate --split-debug-info build/app/outputs/symbols-appbundle --target-platform android-arm64
```

## Build the iOS app

**Debug**

```shell
flutter build ios --debug --no-codesign
```

**Release**

```shell
flutter build ios --release --obfuscate --split-debug-info build/ios/outputs/symbols
```

## Build the Web app

**Debug**

```shell
flutter build web
```

**Release**

```shell
flutter build web --base-href /flutter-app-playground/
```

## Testing

**Run unit tests with coverage**

```shell
flutter test --coverage
```

## Reports

**Run analyzer**

```shell
flutter analyze
```

## Local Debug Run

```shell
rm -f pubspec.lock && \
flutter clean && \
flutter upgrade && \
flutter pub get && \
flutter pub upgrade --major-versions && \

osv-scanner -r . && \

dart fix --dry-run && \
dart fix --apply && \
dart format . && \

flutter analyze && \

flutter test --platform=chrome --test-randomize-ordering-seed=random  && \

flutter build ios --debug --no-codesign && \
flutter build apk --debug && \
flutter build web
```
