# HubX Example

A Flutter plant identification and care application example.

## Features

- **Plant Categories**: Organizes different plant types into categories
- **Plant Questions**: Informative questions about plant care
- **Search Function**: Search plants by name
- **Clean Architecture**: Layered architecture structure
- **Dependency Injection**: Dependency management with GetIt

## Technologies

- **Flutter**: UI framework
- **Bloc/Cubit**: State management
- **Dio**: HTTP client
- **Auto Route**: Navigation
- **GetIt**: Dependency injection
- **Flutter ScreenUtil**: Responsive design

## Project Structure

```
lib/
├── core/
│   ├── di/           # Dependency injection
│   ├── network/      # API client
│   ├── router/       # Navigation
│   ├── theme/        # UI theme
│   └── utils/        # Utility functions
├── features/
│   ├── home/         # Home page
│   ├── onboarding/   # Onboarding pages
│   └── paywall/      # Premium features
└── shared/           # Shared widgets
```

## Installation

1. Install Flutter SDK
2. Clone the project
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the application:
   ```bash
   flutter run
   ```

## API

The application uses the following endpoints:

- `GET /getCategories` - Plant categories
- `GET /getQuestions` - Plant questions

## Contributing

1. Fork the project
2. Create a feature branch
3. Commit your changes
4. Submit a pull request

## License

This project is licensed under the MIT License.
