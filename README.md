# Minimart

**Minimart**  
A modern and responsive e-commerce application built with Flutter and GetX for efficient state management and navigation. This app showcases a seamless user experience for browsing products, managing favorites, adding items to a cart, and more.

---

## 📚 Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Project Structure](#project-structure)
- [Key Components & Technologies](#key-components--technologies)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

---

## ✨ Features

This application offers a range of functionalities designed to provide a smooth shopping experience:

- **Product Browse**: Explore a variety of products with detailed information.
- **Favorite Products Management**:
    - Add and remove products from your "Favourites" list.
    - Visually indicates favorited items with a heart icon.
    - Dedicated "Your Favourites" screen to view all liked products.
- **Shopping Cart System**:
    - Add products to your shopping cart with a simple tap.
    - **Dynamic Cart Badge**: The cart icon in the bottom navigation displays a real-time counter showing the number of items in your cart.
    - **Cart Page Navigation**: Tap the cart icon to instantly navigate to the detailed "Cart" page.
- **Bottom Navigation**:
    - Intuitive and customizable bottom navigation bar.
    - Active tab indication with a distinct background.
- **User Profile**:
    - A dedicated section for user profile information (currently a placeholder).
- **Responsive UI**:
    - Designed to adapt across various screen sizes.
- **GetX State Management**:
    - Efficient and reactive state management, dependency injection, and routing.
- **Custom App Bar**:
    - Reusable app bar component with delivery location and notification functionality.
- **System Exit Confirmation**:
    - Prompts the user before exiting the app from the home screen.

---

## 🚀 Getting Started

Follow these instructions to get a copy of the project up and running on your local machine for development and testing purposes.

---

### ✅ Prerequisites

- **Flutter SDK**: Install Flutter (Stable channel recommended)
- **Dart SDK**: Included with Flutter
- **IDE**: VS Code or Android Studio with Flutter/Dart plugins
- **Git**: For cloning the repository

---

### 📥 Installation

1. Clone the repository:

```bash
git clone https://github.com/Lekwacious/MiniMart
cd minimart
flutter pub get
flutter run
```
minimart/
├── lib/
│   ├── component/            # Reusable UI widgets (e.g., AppBar)
│   ├── controllers/          # GetX controllers (e.g., CartController)
│   ├── models/               # Data models (e.g., CartItemModel)
│   ├── screens/              # Screens/pages
│   │   ├── cart/             # Cart related screens
│   │   ├── home/             # Home and navigation
│   │   ├── product/          # Product details and favorites
│   │   └── profile/          # User profile
│   ├── utils/                # Utility files (colors, snackbars, etc.)
│   └── main.dart             # Entry point
├── assets/
│   └── pngs/                 # Image assets
├── pubspec.yaml              # Dependencies and metadata
└── README.md                 # Documentation

🛠 Key Components & Technologies
Flutter: UI toolkit for building cross-platform applications.

GetX: State management, dependency injection, and navigation.

Google Fonts: Custom typography.

BottomNavigationBar: Navigation with dynamic active indicators.

Stack & Positioned: Overlay for cart counter badge.

Obx: GetX widget for reactive variables.

PopScope: Handle Android back button events.

🧑‍💻 Usage
Navigate: Use the bottom navigation bar to switch between screens.
Product Details: from the home screen click on a particular product to view product details.

Add to Favorites: Tap the heart icon on products to favorite/unfavorite.

Add to Cart: Tap "Add to cart" on product pages.

View Cart: Tap the cart icon to view selected items.

Exit App: Pressing the back button on the home screen prompts a confirmation dialog.