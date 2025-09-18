# Quiz App Flutter (MVVM + Riverpod)

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Flutter](https://badges.frapsoft.com/os/v1/flutter.svg?v=103)](https://flutter.dev/)
[![Riverpod](https://img.shields.io/badge/Riverpod-2.0.0-blue.svg)](https://riverpod.dev/)

## Table of Contents
- [Overview](#overview)
- [Architecture](#architecture)
- [Diagrammatic Representation](#diagrammatic-representation)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Setup](#setup)
- [Future Tasks](#future-tasks)
- [License](#license)

## Overview
Quiz App Flutter is a cross-platform mobile application, built as a replica of the [Quiz App Android](https://github.com/mrkivan/quiz-app-playground/tree/main/quiz_app_android) project, reimagined in Flutter to explore and learn modern Flutter libraries and scalable architecture. Designed as a learning tool, it showcases the integration of Riverpod for state management, Dio for networking, Freezed for immutable data models, and GoRouter for navigation, all within a robust MVVM and Clean Architecture framework. The app allows users to select quiz sets, answer multiple-choice questions, skip questions, and review results, serving as a practical example for developers to discover scalable Flutter practices, modular design, and efficient state management. It emphasizes clean code, separation of concerns, and extensibility, making it an ideal project for experimenting with new libraries and building maintainable Flutter applications.

## Architecture
The app follows **MVVM + Clean Architecture** principles, structured into three layers:

- **Data Layer**:
    - **QuizApi**: Handles HTTP requests using Dio to fetch quiz data from a remote server.
    - **QuizRepository**: The single repository that abstracts data access, fetching quiz data from `QuizApi` or cache (using `shared_preferences` for local storage).
    - **Cache**: Stores quiz data locally using `shared_preferences` for offline access or quick retrieval.

- **Domain Layer**:
    - **Use Cases**: Encapsulate core business logic (e.g., `GetQuizDataUseCase`, `SaveResultDataUseCase`), interacting with `QuizRepository` to fetch data from the API or cache and save results.

- **Presentation Layer**:
    - **Main Screen**: The entry point (`main.dart`) that initializes the app and routes to other screens.
    - **Routing**: Managed by GoRouter, handling navigation between screens like `QuizScreen` and `ResultScreen`.
    - **Screens**: Flutter widgets (e.g., `QuizScreen`, `ResultScreen`, `QuizBody`) that display UI and interact with ViewModels.
    - **ViewModels/Notifiers**: Riverpod notifiers (e.g., `QuizDataNotifier`, `QuizInteractionNotifier`, `QuizResultNotifier`) manage state and business logic, fetching or saving data via use cases.
    - **State Management**: Uses Riverpod’s `AsyncValue` for reactive updates, handling loading, data, and error states.

Data flows as follows: API/Cache → `QuizRepository` → Use Cases → Notifiers → UI.

## Diagrammatic Representation
```
+---------------------+     +----------------------+     +--------------------+
| Presentation Layer  |<--->| ViewModels/Notifiers |<--->|   Use Cases        |
| - Main Screen       |     | - QuizDataNotifier   |     | - GetQuizDataUC    |
| - QuizScreen        |     | - QuizInteractionN   |     | - SaveResultDataUC |
| - ResultScreen      |     | - QuizResultNotifier |     +--------------------+
| - QuizBody          |     +----------------------+              ^
+---------------------+               |                          |
          ^                          v                          |
          |                +----------------------+              |
          |                |   QuizRepository     |              |
          |                +----------------------+              |
          |                          |                          |
          v                          v                          |
+---------------------+     +----------------------+              |
|  Riverpod State     |<--->|   Data Layer         |              |
| - AsyncValue<Quiz>  |     | - QuizApi (Dio)      |              |
| - QuizState         |     | - Cache (SharedPrefs)|              |
+---------------------+     +----------------------+              |
                                                                 |
                                                                 v
                                        +----------------------+
                                        |      Data Source     |
                                        | - Remote API         |
                                        | - Local Cache        |
                                        +----------------------+
```

## Tech Stack
- **Framework**: Flutter 3.24.x
- **State Management**: Riverpod 3.0.0 (with `riverpod_annotation` and `riverpod_generator`)
- **Networking**: Dio 5.7.0
- **Data Classes**: Freezed 3.2.3 + json_serializable 6.9.0
- **Navigation**: GoRouter 16.2.1
- **Architecture**: MVVM + Clean Architecture
- **Other**: easy_localization 3.0.7, shared_preferences 2.5.3

## Project Structure
```
lib/
├── di/                          # Dependency Injection (Riverpod providers)
│   └── flutter_riverpod.dart
├── domain/
│   ├── entities/                # Domain models (QuizData, ResultData)
│   │   ├── quiz/
│   │   └── result/
│   └── usecase/                 # Use cases (GetQuizDataUseCase)
│       ├── quiz/
│       └── result/
├── presentation/
│   ├── quiz/
│   │   ├── intent/
│   │   ├── notifiers/           # Riverpod notifiers (QuizDataNotifier)
│   │   ├── state/
│   │   └── ui/                  # Widgets (QuizScreen, QuizBody)
│   ├── result/
│   │   ├── notifiers/           # ResultNotifier
│   │   └── ui/                  # ResultScreen, ResultItemRow
│   └── utils/                   # Shared utilities (QuizAppToolbar, ConfirmDialog)
└── main.dart                    # App entry point
```

## Setup
### Prerequisites
- Flutter SDK 3.24.x or later
- Dart 3.5.x or later
- Android Studio / VS Code with Flutter extension

### Installation
1. Clone the specific subfolder from the repository:
   ```
   git clone --no-checkout https://github.com/mrkivan/quiz-app-playground.git
   cd quiz-app-playground
   git sparse-checkout init --cone
   git sparse-checkout set quiz_app_flutter
   git checkout main
   cd quiz_app_flutter
   ```
2. Install dependencies:
   ```
   flutter pub get
   ```
3. Generate code:
   ```
   flutter pub run build_runner build --delete-conflicting-outputs
   ```
4. Run the app:
   ```
   flutter run
   ```

### API Configuration
- Update the API base URL in `lib/di/network_module.dart` (e.g., modify the Dio configuration to point to your API endpoint).
- Add environment variables if using `.env` files for sensitive configurations.

## Future Tasks
- Fine-tune business logic for improved performance and accuracy.
- Enhance UI/UX with refined designs and animations.
- Replace hardcoded strings with proper localization using `easy_localization`.
- Clean up code by removing redundant logic and improving modularity.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.