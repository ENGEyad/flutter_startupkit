# 🚀 Premium Flutter Startup Kit

Welcome to the **Premium Flutter Startup Kit**! This is a production-ready template designed for scalable, enterprise-grade applications. It implements **Feature-First Clean Architecture**, a modern reactive state stack, full local caching, robust error mapping, and a premium glassmorphic UI system right out of the box.

---

## 🏛️ Architecture Layout

This project follows a **Feature-First Clean Architecture** design. Logic is organized by individual feature modules rather than technical layers, allowing teams to scale seamlessly without merge conflicts.

```
lib/
├── core/                     # Shared global layers
│   ├── di/                   # Dependency Injection (GetIt)
│   ├── error/                # Custom failures & exceptions
│   ├── network/              # Robust Dio HTTP Client & error mapping
│   ├── routes/               # Declarative GoRouter routing definitions
│   ├── services/             # LocalStorage (SharedPreferences wrapper)
│   ├── theme/                # Curated dynamic Light & Dark themes (Inter)
│   └── widgets/              # Reusable premium widgets (animated buttons, loaders)
└── features/                 # Modular, encapsulated domain features
    ├── dashboard/            # Dynamic landing showing network fetches & theme toggling
    │   ├── data/             # Models and API Data sources
    │   ├── domain/           # Entities, Usecases, and Repository contracts
    │   └── presentation/     # BLoC State controllers & Screens
    └── splash/               # Animated entrance screen
```

---

## 🛠️ The Tech Stack

We select high-performance, industry-standard packages to power the app:

| Layer | Technology | Description |
| :--- | :--- | :--- |
| **State Management** | `flutter_bloc` | Fully decoupled, predictable, and highly testable state control. |
| **Declarative Router** | `go_router` | Smooth transition screens, deep linking support, and simple path routing. |
| **HTTP Client** | `dio` | Powerful REST request engine with customizable timeouts and interceptors. |
| **Dependency Injection** | `get_it` | Inversion of Control (IoC) service locator. |
| **Caching Engine** | `shared_preferences` | High speed key-value storage for app configurations (e.g. Light/Dark theme). |
| **UI Aesthetics** | `google_fonts` | Standardizes sleek modern typefaces (`Inter`). |
| **Micro-Animations** | `flutter_spinkit` & scale custom curves | Dynamic load states and tactile physical scaling widgets. |

---

## ⚡ Core Features Highlight

### 1. Persistent Dark & Light Mode Toggling
An intelligent, global `ThemeCubit` coordinates visual configurations. Theme states are automatically persisted locally via `LocalStorageService` so user preferences are retained across sessions.

### 2. High-Fidelity Tactile Click Animations
Standard buttons are wrapped in a physics-based scale-animation script (`AppButton`) that responds seamlessly to gesture taps:
- Gently shrinks by **4%** on press down (`Tween<double>(begin: 1.0, end: 0.96)`).
- Springs back instantly on release or cancel, giving an incredibly satisfying mechanical tactile click feel.

### 3. Decoupled Network Mapping
The customized `DioClient` automatically detects network connection losses, timeouts, or bad server payloads and maps them instantly into robust, presentation-ready domain errors (`NetworkFailure` / `ServerFailure`).

---

## 🚀 Getting Started

### Prerequisites
Make sure you have [Flutter SDK](https://docs.flutter.dev/get-started/install) installed.

### Setup and Install
1. Clone or copy this kit into your workspace directory.
2. In your terminal, download dependencies:
   ```bash
   flutter pub get
   ```

3. Run the development static analysis to ensure code integrity:
   ```bash
   flutter analyze
   ```

4. Launch the application:
   ```bash
   flutter run
   ```

### Running Tests
Execute unit and widget smoke tests:
```bash
flutter test
```
