# <img width="250" height="167" alt="SpeedyNewsLogoTextY" src="https://github.com/user-attachments/assets/802a6111-cbdb-4a96-bd5a-349c8b5dc8b6" />

**SpeedyNews** is a mobile news application developed using Flutter with the primary goal of creating a user-friendly, visually pleasing, and highly accessible news-reading experience.

While the app integrates real-time news data and Firebase authentication, the core focus of this project is on delivering smooth UI/UX, intuitive navigation, and a clean interface that enhances readability and user engagement.

## 🎯 Main Objective

[cite_start]The main objective of this application is to design and implement a modern, simple, and efficient user interface that allows users to browse news comfortably[cite: 31]. The UI/UX was prioritized to ensure:
* **Fast and smooth interactions** 
* **Clear layout hierarchy** 
* **Comfortable reading environment** 
* **Minimal user effort to navigate articles**
* 
### Figma Screens
<img width="1068" height="747" alt="Screenshot 2025-12-06 174447" src="https://github.com/user-attachments/assets/e196a971-590e-4e2c-96a4-ff91d36996db" />


* ## 🧠 UI/UX & HCI Principles

SpeedyNews applies key HCI principles by designing the interface around how users see, think, and interact.

### Cognitive Load Reduction
We implemented specific "UX Hacks" to reduce cognitive load[cite: 76]:
* **Chunking:** News articles are displayed in cards with sections separated by whitespace to make content digestible.
* **Autosuggest:** Implemented in the search bar to prioritize recognition over recall.
* **Minimalist Options:** Reduced decision fatigue by showing only one category list and sources related to that selection.

### Interface Type
The app utilizes a **Multiple-Type Interface**:
* **WIMP Interface:** Uses Windows (screens), Icons (categories), Menus (navigation drawer), and Pointers (touch interaction).
* **Point-and-Click:** Users can tap and navigate between screens freely.

### Visual Hierarchy
* **High Contrast:** Primary color backgrounds with white text ensure strong contrast.
* **Large Touch Targets:** Large category cards and icons help users immediately recognize and choose topics.

## 📱 Features

* **Real-Time News:** Fetches the latest headlines via News API.
* **Secure Authentication:** Firebase Authentication for Login, Register, and Forgot Password flows.
* **Smart Search:** Live search filtering with autosuggestion.
* **Category Filtering:** Browse by topics like Science, Entertainment, and General.
* **Drawer Navigation:** A slide-out menu that allows users to switch contexts without losing their plac.

## 🛠️ Tech Stack

* **Design & Prototype:** [Figma]([https://www.figma.com/](https://www.figma.com/file/RWkHNpjHoIx7BVRqi6E89F?node-id=0-1&p=f&t=jJenouP6nRuiMV1Q-0&type=design&mode=design)) (UI Design and Prototype) 
* **Framework:** [Flutter](https://flutter.dev/) (Dart) for UI and cross-platform development 
* **State Management:** [Provider](https://pub.dev/packages/provider) (To keep UI responsive) 
* **Backend:** [Firebase Authentication](https://firebase.google.com/) (Secure login flows) 
* **Data Source:** [News API](https://newsapi.org/) 

## 🚀 Getting Started

Follow these steps to get a local copy of the project up and running.

### Prerequisites

* [Flutter SDK](https://docs.flutter.dev/get-started/install) installed on your machine.
* An IDE (VS Code, Android Studio, or IntelliJ).
* A valid API Key from [NewsAPI.org](https://newsapi.org/).

### Installation

1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/kariimjr/SpeedyNews.git](https://github.com/kariimjr/SpeedyNews.git)
    cd SpeedyNews
    ```

2.  **Install dependencies:**
    ```bash
    flutter pub get
    ```

3.  **Firebase Setup:**
    * This project uses Firebase. You may need to configure your own Firebase project.
    * Place your `google-services.json` (for Android) in `android/app/`.
    * Place your `GoogleService-Info.plist` (for iOS) in `ios/Runner/`.

4.  **Configure API Keys:**
    * Update the constant file/environment variable with your NewsAPI key to fetch real-time data.

5.  **Run the app:**
    ```bash
    flutter run
    ```

## 📂 Project Structure

```text
lib/
├── models/         # Data models (News, User)
├── screens/        # UI Screens (Home, Login, News Page, Search)
├── services/       # API and Firebase Auth services
├── widgets/        # Reusable UI components (Cards, Drawer)
└── main.dart       # Entry point of the application
