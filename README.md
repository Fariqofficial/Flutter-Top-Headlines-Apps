## Features
- Google Sign-In with Firebase Auth
- Offline-reader with SQFLite
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
│   └── widgets (global widgets)/
└── injection.dart
└── main.dart
```

## Installation Instructions
1. Clone repository ini
```bash
git clone https://github.com/username/imperial-article.git
cd flutter_top_headlines_apps
```
## IMPORTANT - Environment Setup
1. Di dalam project ada file dev.env
2. Rename dev.env menjadi .env
3. Konfigurasi sesuai dengan API Key punya anda
4. Setelah rename dev.env → .env lakukan flutter clean && flutter pub get, kemudian langsung flutter run
```bash
Examaple :
BASE_URL=ttps://newsapi.org/v2/
API_KEY=your_api_key_here
```

## How To Run
```bash
flutter run
```

## Tambahan
Sorry, for now I am using the API from the US because there is no data “Top Headlines” for Indonesia. Here is a screenshot from the website newsapi.org/v2/

## Response API with US code
<img width="2880" height="1506" alt="result api us (1)" src="https://github.com/user-attachments/assets/00beaf21-4b1a-4082-af6a-c66a74481b4b" />


## Response API with ID code
<img width="2880" height="766" alt="result api id (1)" src="https://github.com/user-attachments/assets/29759284-f3cb-4b03-bfca-e5104e872c62" />




   
