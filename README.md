## Features
- Google Sign-In with Firebase Auth
- Clean Architecture
- Offline-first user cache (SQFLite)
- Modern UI with GetX state management
- Fully typed with strict null-safety

## Project Structure (Clean Architecture)
```bash
lib/
├── common/
│   ├── routes/
│   ├── utils/
├── core/
│   ├── error/
│   ├── network/
├── features/
│   └── guest/
│       ├── data/
│       ├   ├── datasource/
│       ├   ├── mapper/
│       ├   ├── repositories_impl/
│       ├── domain/
│       ├   ├── entities/
│       ├   ├── repositories/
│       ├   ├── usecase/
│       └── presentation/
│       ├   ├── screen/
│       ├   ├── controller/
│   └── news/
│       ├── data/
│       ├   ├── datasource/
│       ├   ├── mapper/
│       ├   ├── repositories_impl/
│       ├── domain/
│       ├   ├── entities/
│       ├   ├── repositories/
│       ├   ├── usecase/
│       └── presentation/
│       ├   ├── screen/
│       ├   ├── controller/
│       ├   ├── widgets/
└── injection.dart
└── main.dart
```

## Installation Instructions
1. Clone repository ini
```bash
git clone https://github.com/username/imperial-article.git
cd imperial-article
```
## IMPORTANT - Environment Setup
1. Di dalam project ada file dev.env
2. Rename dev.env menjadi .env

## How To Run
```bash
flutter run
```

Setelah rename dev.env → .env dan flutter clean && flutter pub get, langsung flutter run

## PS
Sorry, for now I am using the API from the US because there is no data for “Top Headlines” for Indonesia. Here is a screenshot from the website newsapi.org/v2/

## Response API with US code
<img width="1440" height="753" alt="result api us" src="https://github.com/user-attachments/assets/38337275-aab8-4786-8a39-50c889ddae69" />

## Response API with ID code
<img width="1440" height="383" alt="result api id" src="https://github.com/user-attachments/assets/7a75c699-bbc5-4373-b3d8-1ee9833056d5" />



   
