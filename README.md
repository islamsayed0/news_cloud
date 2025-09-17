<div align="center">

# NewsApp

Arabic news reader built with Flutter. Browse categorized news by country, with a smooth UI, guided onboarding, and robust network handling.

[![Flutter](https://img.shields.io/badge/Flutter-3.x-blue?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](#license)

</div>

## Demo Video
![Demo Gif](https://s3.ezgif.com/tmp/ezgif-3f24c6809c0d77.gif)
---

## Features

- Country-based news browsing (Egypt, Palestine, Saudi Arabia) with a reusable screen pattern
- Smooth horizontal country collection with image tiles
- Guided onboarding using TutorialCoachMark (shows on first launch only)
- Robust loading, empty, and error states for API calls
- Right-to-left optimized UI for Arabic content
- Clean navigation with Material routes

## Tech Stack

- Flutter, Dart
- HTTP client: `dio`
- Onboarding: `tutorial_coach_mark`
- Local storage: `shared_preferences`

## Badges (Packages)

- `dio` – Fast, composable HTTP client
- `tutorial_coach_mark` – Interactive guided tours
- `shared_preferences` – Lightweight key-value storage

## Architecture & Structure

```
lib/
  Screens/
    categorysScreens/
      CountryNewsScreen.dart   # Reusable screen, parameterized by source & title
      Saudi.dart               # Legacy screen (optional)
      palestine_screen.dart    # Legacy screen (optional)
    home_Screen.dart           # Home with coach marks and country collection
  Services/
    News_Services.dart         # Network layer using Dio
  models/
    ArticlesModle.dart         # News article model
  widgets/
    App_Bar.dart               # Custom AppBar with optional title and titleKey
    Colection_item_scroll.dart # Horizontal countries collection
    Colection_Items.dart       # Tile for a single collection item
    News_Tile_Scroll.dart      # Sliver list that fetches and renders news tiles
    News_Tile.dart             # Single news card UI
  const/
    strings.dart               # API key and URLs
```

## Getting Started

### Prerequisites

- Flutter SDK 3.x
- Dart SDK 3.x
- Android Studio / Xcode

### Install

```bash
flutter pub get
```

### Configure API

Edit `lib/const/strings.dart` and set your NewsAPI key:

```dart
class ConstString {
  static const String Api_kay = 'YOUR_NEWSAPI_KEY_HERE';
}
```

### Run

```bash
flutter run
```

## Usage Notes

- First app launch shows a guided tour. It sets `home_tutorial_seen=true` in SharedPreferences.
- To see the tour again, clear app data or remove that key.
- Horizontal country collection opens a reusable `CountryNewsScreen` with the corresponding `source`.

## Troubleshooting

- No news showing: check internet permissions and API quota/valid key.
- Tutorial not showing: ensure first launch (clear data) and cold start the app.
- Images not loading: some articles may have empty `urlToImage`; placeholders are shown instead.

## Roadmap

- Add more countries and categories
- In-app article viewer with WebView
- Pull-to-refresh and infinite scroll
- Dark mode

## Contributing

PRs are welcome. Please open an issue to discuss major changes.

## License

This project is licensed under the MIT License.
