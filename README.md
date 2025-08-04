# Flutter App Blueprint

Blueprint to quickstart app development

## Build & Generate

### Build Android

Update version in `pubspec.yaml` and run:

`fvm flutter build appbundle`

### Generate localization

Run the following command in app component:

`fvm flutter gen-l10n`

### Generate Source Code

A shell script is provided to generate the source code in all components.

`sh parallel_build_runner.sh`

### Generate App Icons

The package `flutter_launcher_icons` is used to generate the app icons. Run the following command in app component:

`flutter pub run flutter_launcher_icons`

### Splash Screen

The package `flutter_native_splash` is used to create the native splash screen. Run the following command in app component:

`flutter pub run flutter_native_splash:create`
