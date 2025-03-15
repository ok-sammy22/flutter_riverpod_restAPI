# Flutter User Search App

A simple Flutter app that fetches user data from an API, displays usernames and emails, and provides search functionality using **Riverpod** for state management.

---

## 🚀 Features

✅ Fetch users from `https://jsonplaceholder.typicode.com/users` using `http` package  
✅ Display usernames and emails in a **ListView**  
✅ Show the **first letter of the username** as an avatar placeholder  
✅ **Search users by username** dynamically  
✅ **Pull-to-refresh** functionality using `RefreshIndicator`  
✅ State management with **Riverpod**

---

## 🛠️ Tech Stack

- **Flutter** (UI Framework)
- **Riverpod** (State Management)
- **http** (Networking)

---

## 📥 Installation & Setup

### 1️⃣ Clone the repository

```sh
git clone https://github.com/ok-sammy22/flutter_riverpod_restAPI.git
cd repo-name
```

### 2️⃣ Install dependencies

```sh
flutter pub get
```

### 3️⃣ Run the app

```sh
flutter run
```

---

## 📝 Usage

🔹 Open the app, and it will fetch user data automatically.  
🔹 **Pull down** to refresh the user list.  
🔹 Use the **search bar** to filter users by username.

---

## 📌 Folder Structure

```
/lib
  ├── models/             # User model
  ├── providers/          # Riverpod providers
  ├── services/           # API service class
  ├── ui/widgets/         # Reusable widgets
  ├── ui/screens/         # Main app screens
  ├── main.dart           # Entry point
```

---

## 💡 Contributing

👥 Contributions are welcome! To contribute:

1. Fork the repo
2. Create a new branch: `git checkout -b feature-name`
3. Commit changes: `git commit -m "Add new feature"`
4. Push branch: `git push origin feature-name`
5. Open a pull request

---

## 📜 License

📜 This project is licensed under the MIT License.

---

## 👤 Author

🔹 **Okunola Iyanujesu**  
📧 Contact: `samuelokunola02@gmail.com`
