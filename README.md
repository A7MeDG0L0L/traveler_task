# Traveler Task

A Flutter web app for the coding task.

## Project Structure

```
lib/
  ├── constants/      # App-wide constants (colors, sizes, strings)
  ├── models/         # Data models
  ├── screens/        # UI screens
  ├── services/       # Services (Firebase, API)
  ├── utils/          # Utility functions
  ├── widgets/        # Reusable widgets
  └── main.dart       # Entry point
```

## Firebase Setup

1. Create a Firebase project at [Firebase Console](https://console.firebase.google.com/)
2. Register your app as a Web app
3. Copy the Firebase config values to:
   - `lib/main.dart` (for Flutter initialization)
   - `web/index.html` (for web initialization)
   - `.firebaserc` (project ID)

## Running the Project

```bash
# Get dependencies
flutter pub get

# Run in debug mode
flutter run -d chrome

# Build for production
flutter build web
```

## Deploying to Firebase Hosting

```bash
# Install Firebase CLI if not already installed
npm install -g firebase-tools

# Login to Firebase
firebase login

# Build the web app
flutter build web

# Deploy to Firebase Hosting
firebase deploy --only hosting
```

## Responsive Design

The app is designed to be responsive across different screen sizes:
- Mobile: < 650px width
- Tablet: 650px - 1100px width
- Desktop: > 1100px width

## Figma Implementation

Once the Figma design is provided, the UI will be implemented according to the design specifications.
