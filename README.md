# Food Delivery App 🍔

A premium food delivery application built with Flutter, offering a seamless experience for browsing restaurants, managing carts, and tracking orders.

## 📱 Features

-   **Discovery & Browsing**:
    -   Explore popular foods and top-rated restaurants.
    -   Filter by cuisine categories (Italian, Mexican, Spanish, Brazilian, etc.).
    -   Search functionality for finding specific cravings.
-   **Food Details**:
    -   Rich food presentations with images, prices, and detailed descriptions.
    -   Ingredient lists and preparation time.
    -   User reviews and rating system.
-   **Ordering System**:
    -   Add items to cart with ease.
    -   Secure checkout process.
    -   Real-time Order Tracking with status updates (Preparing, On the way, Delivered).
-   **User Experience**:
    -   **Favorites**: Save dishes you love for quick access.
    -   **Profile Management**: Edit profile details and settings.
    -   **Location Integration**: View restaurant locations on a map.
    -   **Notifications**: Get updates on your order status.

## 📸 Screenshots

### Home & Discovery
| Home Page | Scrolled View | Restaurant Menu |
|:---:|:---:|:---:|
| <img src="assets/imgReadme/homePage.png" width="250" /> | <img src="assets/imgReadme/homePage2.png" width="250" /> | <img src="assets/imgReadme/RestaurantFood.png" width="250" /> |
| **Main Dashboard** | **Browsing Feeds** | **Restaurant Details** |

### Product & ordering
| Food Details | Cart | Checkout |
|:---:|:---:|:---:|
| <img src="assets/imgReadme/foodDetalis.png" width="250" /> | <img src="assets/imgReadme/Cart.png" width="250" /> | <img src="assets/imgReadme/checkout.png" width="250" /> |
| **Product View** | **Shopping Cart** | **Order Summary** |

### User Features
| Favorites | Order Tracking | Profile |
|:---:|:---:|:---:|
| <img src="assets/imgReadme/favoriteFood.png" width="250" /> | <img src="assets/imgReadme/tracking.png" width="250" /> | <img src="assets/imgReadme/editProfile.png" width="250" /> |
| **Saved Items** | **Live Tracking** | **User Profile** |

### More Views
| Location | Notifications | Order Complete |
|:---:|:---:|:---:|
| <img src="assets/imgReadme/restauLocation.png" width="250" /> | <img src="assets/imgReadme/notificarionOrder.png" width="250" /> | <img src="assets/imgReadme/checkoutOrder.png" width="250" /> |
| **Map View** | **Alerts** | **Success Screen** |

## 🛠 Tech Stack

-   **Framework**: Flutter
-   **Language**: Dart
-   **State Management**: Provider
-   **Animations**: animate_do
-   **Location**: geolocator, geocoding

## 🚀 Getting Started

1.  **Clone the repository**:
    ```bash
    git clone https://github.com/your-username/food-delivery-app.git
    ```
2.  **Install Dependencies**:
    ```bash
    flutter pub get
    ```
3.  **Run the App**:
    ```bash
    flutter run
    ```
    *Note: If running on Web, make sure to use `flutter run -d chrome`.*

## 📂 Project Structure

-   `lib/features`: Contains all feature-based code (Auth, Food, Cart, etc.).
-   `lib/core`: Core utilities, constants (colors, text styles), and themes.
-   `assets/images`: Image assets for UI and categories.
