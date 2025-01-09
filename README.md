# Technical Test Talent Insider
Aplikasi berbasis mobile Flutter untuk kebutuhan technical test.

![Frame 3 (2)](https://github.com/user-attachments/assets/8a811081-bb57-4bd1-bfe2-8f95d14e1fe7)

## Instalasi
1. **Clone repository ini**:  
   Buka terminal dan jalankan perintah berikut:
   ```bash
   git clone <URL_REPOSITORY>

2. **Mengunduh semua dependency**
   ```dependency
   flutter pub get
   ```
3. **Jalankan aplikasi**
   ```dependency
   flutter run
   ```
## Third Party
- `BLoC`: Untuk manajemen state.
- `dio`: Untuk melakukan permintaan HTTP ke API.
- `shared_preferences`: Digunakan untuk menyimpan data secara lokal di perangkat..
- `get_it`: Mengelola dependency injection (DI)
- `etc`.

## Struktur Folder
```
lib/
└── app/
    ├── core/
    │   ├── const/
    │   ├── dependency/
    │   ├── utils/
    │   └── etc/
    ├── config/
    │   ├── router/
    │   ├── api_config/
    │   └── etc/
    ├── features/
    │   ├── feature_name/
    │   │   ├── data/
    │   │   │   ├── data_sources/
    │   │   │   ├── models/
    │   │   │   └── repositories/
    │   │   ├── domain/
    │   │   │   ├── entities/
    │   │   │   ├── repositories/
    │   │   │   └── use_case/
    │   │   └── presentation/
    │   │       ├── bloc/
    │   │       ├── pages/
    │   │       └── widgets/
    └── main.dart
```

## Credit
- [Github](https://github.com/dimasjayadi99)
- [Linekdin](https://www.linkedin.com/in/dimasjayadi99/)
