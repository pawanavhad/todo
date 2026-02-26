# 📱 Task Manager App --- Flutter REST CRUD

A modern **Task Manager mobile application** built using **Flutter**
that demonstrates complete **REST API integration** with full **CRUD
(Create, Read, Update, Delete)** functionality.

The app allows users to manage tasks efficiently while learning core
Flutter development concepts such as widgets, state management,
navigation, and clean project structure.

------------------------------------------------------------------------

## 🚀 Features

-   ✅ View tasks from REST API
-   ➕ Add new task
-   ✏️ Edit existing task
-   🗑️ Delete task with confirmation
-   ✔️ Mark task as completed
-   🔄 Pull-to-refresh task list
-   📡 Real-time API synchronization
-   🎨 Modern Material 3 UI

------------------------------------------------------------------------

## 🛠️ Tech Stack

  Technology           Usage
  -------------------- -------------------------
  **Flutter**          Mobile UI framework
  **Dart**             Programming language
  **REST API**         Backend communication
  **MockAPI**          Cloud backend service
  **HTTP Package**     API requests
  **Postman**          API testing
  **Android Studio**   Development environment

------------------------------------------------------------------------

## 🧠 Concepts Demonstrated

### Flutter

-   Widget Tree
-   Stateful & Stateless Widgets
-   Navigation (push / pop)
-   UI Composition
-   setState() state management
-   Material 3 theming

### REST API

-   CRUD lifecycle
-   HTTP Methods (GET, POST, PUT, DELETE)
-   JSON serialization & parsing
-   Client--Server communication

### Programming

-   Object-Oriented Programming (OOP)
-   Async/Await programming
-   Separation of Concerns
-   Clean Architecture basics

------------------------------------------------------------------------

## 📂 Project Structure

    lib/
    │
    ├── models/        # Data models
    ├── services/      # API service layer
    ├── screens/       # Application screens
    ├── widgets/       # Reusable UI components
    └── utils/         # Constants & configuration

------------------------------------------------------------------------

## 🏗️ Architecture Overview

    UI (Screens & Widgets)
            ↓
    API Service Layer
            ↓
    REST API (MockAPI)
            ↓
    Online Database

The project follows a layered architecture separating UI, business
logic, and data handling for better scalability and maintainability.

------------------------------------------------------------------------

## 🔄 App Workflow

1.  User performs an action (add/edit/delete task)
2.  Flutter sends HTTP request to REST API
3.  Server updates database
4.  Updated data is fetched again
5.  UI refreshes using `setState()`

------------------------------------------------------------------------

## ⚙️ Installation & Setup

### 1️⃣ Clone Repository

``` bash
git clone https://github.com/pawanavhad/task-manager-flutter.git
```

### 2️⃣ Navigate to Project

``` bash
cd task-manager-flutter
```

### 3️⃣ Install Dependencies

``` bash
flutter pub get
```

### 4️⃣ Add Your MockAPI URL

Update:

    lib/utils/constants.dart

``` dart
static const String baseUrl = "MOCKAPI_URL";
```

### 5️⃣ Run App

``` bash
flutter run
```

------------------------------------------------------------------------

## 📸 Screenshots

### 🏠 Home Screen
![Home Screen](https://github.com/pawanavhad/todo/blob/main/Screenshot_20260226_134654.png)


### ✏️ Edit Task
![Edit Task](https://github.com/pawanavhad/todo/blob/main/Screenshot_20260226_134751.png)


------------------------------------------------------------------------

## 🎓 Learning Outcomes

This project helped in understanding:

-   Real-world Flutter app development
-   REST API integration
-   CRUD operations
-   State-driven UI updates
-   Clean Flutter project structure

------------------------------------------------------------------------

## 🔮 Future Improvements

-   🌙 Dark Mode
-   🔔 Notifications
-   🔐 Authentication
-   📱 Offline storage
-   ✅ Task filtering & search

------------------------------------------------------------------------

## 👨‍💻 Author

**Pawan Avhad**

-   GitHub: https://github.com/pawanavhad


------------------------------------------------------------------------

## ⭐ Support

If you like this project, please ⭐ star the repository!
