# Popular Movie App

[![CI][passing_badge]][passing_link] [![License: MIT][license_badge]][license_link]

---

## Getting Started 🚀

In order to run the project, you first need to get an authorization token from [The Movie Database (TMDB) API](https://developer.themoviedb.org/reference/intro/getting-started). After getting the token, you need to add the following line in the .env file in the root directory:

```sh
Authorization = Bearer <your token>
```

After adding the token, you can run the project with the following command:

```sh
flutter run
```

To run the tests, you can use the following command:

```sh
flutter test
```

_\*This project is tested on iOS and Android._

---

## Summary of the Project

- This project uses The Movie Database (TMDB) API to retrieve popular movies and display them in a list. You can view popular movies on the homepage. By clicking on the movie card you can go to the movie detail, see the movie details and watch the trailer. The app supports orientation so you can use it in landscape or portrait.
- This is a project that mainly uses Provider with MVVM pattern.
- API tests are written using Mockito.
- Github Actions is used for testing and analysis. You can see the results [here][passing_link].

## Used Packages

- [dio](https://pub.dev/packages/dio) and [retrofit](https://pub.dev/packages/retrofit) for network calls.
- [fancy_dio_inspector](https://pub.dev/packages/fancy_dio_inspector) for network call inspection _(It's written by [me](https://github.com/yakupemeksiz) and [Gökhan Çavuş](https://github.com/gokhancvs))_.

- [provider](https://pub.dev/packages/provider) for state management.
- [get_it](https://pub.dev/packages/get_it) and [injectable](https://pub.dev/packages/injectable) for dependency injection.
- [mockito](https://pub.dev/packages/mockito) for mocking.
- [either_dart](https://pub.dev/packages/either_dart) for error handling.
- [flutter_screenutil](https://pub.dev/packages/flutter_screenutil) for responsive UI.
- [hive_flutter](https://pub.dev/packages/hive_flutter) for local storage.
- [auto_route](https://pub.dev/packages/auto_route) for navigation.

[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[passing_badge]: https://img.shields.io/badge/CI-passing-brightgreen?logo=github
[passing_link]: https://github.com/yakupemeksiz/movie_list/actions
