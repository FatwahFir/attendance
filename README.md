# 📍 Mobile Attendance App

**Mobile Attendance App** is a simple mobile application designed to meet the criteria of a job application test. The application allows users to perform attendance check-ins and check-outs using GPS, ensuring that they are within a predefined radius from a geo-tagged location.

---

## 📝 Features

- **Location Geo-Tagging**: 
  - Tagging locations on a map (not just coordinates) with the ability to set multiple sample locations.
- **Configurable Radius**: 
  - Set a maximum radius for each location to control the permissible distance for attendance.
- **Attendance Validation**: 
  - GPS-based validation for checking whether the user is within the allowed radius before performing check-in or check-out. If the user is outside the radius, the attendance attempt will be rejected; if within, the process succeeds.

---

## ⚠️ Disclaimer

This application was developed as a simple prototype to meet the requirements of the test. It has **no authentication** or **authorization** (such as token management), **no localization** settings, and does not follow any specific **design references**. The main focus is on demonstrating technical functionality. It is not optimized for production environments and is meant solely as a demonstration of my technical understanding.

---

## 🛠️ Technology Stack

- **Flutter** v3.24: Used for mobile application development.
- **Dart** v3.5: Programming language used with Flutter.
- **GetX** v4.6: State management solution.
- **Laravel** v10: Backend framework for data management and API integration.
- **PHP** v8.1: Programming language used for backend development.
- **MySQL**: Database used for storing master data and attendance records.

---

## 🚀 How to Run

### 1. Clone the repository:
```bash
git clone https://github.com/FatwahFir/attendance.git
```

### 2. Insert Your API Key:
Before running the app, you need to add your API key to the project.

- Create a file named `.env` in the root directory of the project.
- Inside the `.env` file, add your Google Maps API key like this:
  ```bash
  MAPS_API_KEY=your_api_key_here
  ```

Or, if using `local.properties`:
- Add the following line to the `local.properties` file:
  ```bash
  MAPS_API_KEY=your_api_key_here
  ```

Ensure that the file is not committed to the repository by adding it to `.gitignore`.

### 3. Install dependencies:
```bash
flutter pub get
```

### 4. Run the application:
```bash
flutter run
```

Make sure to have a connected device or an emulator running.

---

## 📦 APK and Source Code

You can download the APKs and explore the full source code by visiting the following links:

- **[Download Mobile APK and Source Code](https://drive.google.com/file/d/1hoOSr6j-WKgCtw3bY34gD1jFADfzBgF1/view?usp=sharing)**
- **[Download Backend (BE) APK and Source Code](https://github.com/FatwahFir/be-attendance)**
- **[See The Demo](https://drive.google.com/file/d/10r7G_IyxTXqnFRsD7_Uf1bXmD7xlgV5y/view?usp=sharing)**

---

## 📝 License

This project is open source and available under the [MIT License](LICENSE).
