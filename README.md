# my-news-app

> note: for authentication, user email is tyler@gmail.com and password is 1234.
> also, the app checks for internet connection. it doesn't really need the connecition, but it just checks to make it look like it's fetching some data from api. also it will throw exceptions if there is no connection.

## This is a flutter app UI made with stacked architecture.

> stacked architecture is an implementation of flutter. 
> it implements a good deal of separation of concerns, 
> and helps scalability 

## here is folder strucutre:
the folder structure follows the stacked architecture mvvm convention.
here lib folder is divided into 2 folders core and ui. those two as well
are divided into respective folders.

## notable files in the whole project include:
- `lib/locator.dart`: used to register api's and providers so that the views and viewmodels access them easily.
- `lib/core/viewModels/base/base_view_movel.dart`: this class abstracts the common attributes of all out view models. including the states and the methods that set the state and notify listeners.
- `lib/ui/views/base/base_view.dart` : the basic abstracted value of views. it wraps the scaffold widget with a `ChangeNotifierProvider` which takes a generic type `T`. `T` is a subclass of `BaseViewModel`.
- `lib/core/constants/app_contstants.dart`: contains the string values of the routes of all the screens in the app: i.e, "views" in the mvvm convention, and hence all the possible screens for navigation.
- `lib/ui/router.dart`: generates routes for the named navigator to use
- `lib/ui/shared/dummy_data.dart`: since we didn't implement real api and auth
functionalities, we will be using static data from this file
-  `lib/ui/widgets/bottom_nav_bar.dart`: custom implementation of nav bar

- lib
    - core
        - models => data models here
        - services => apis, auth etc
        - viewModels => the viewmodels that perform all business logic for the views(screens).
    - ui
        - shared => useful files shared across screens, ui helpers etc
        - views => views(screens of the app)
        - widgets => widget components

## 3rd party packages used in the project
- provider: for state management
- get_it: a locator utility that helps in the stacked mvvm archtecture
- google_fonts: for all the diverse fonts in the project
- smooth_page_indicator: page indicator for the custom page view implementation in the onboarding page
- carousel_slider: used in the custom page-view implementation, where the center image is larger than the others.
- flutter_svg: used to render the svg icons all over the project
- shimmer: for skeleton loading effect.
- mockito: to mock service and api classes for unit tests.


