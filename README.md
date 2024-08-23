# my-news-app

## This is a flutter app UI made with stacked architecture.

> stacked architecture is an implementation of flutter. 
> it implements a good deal of separation of concerns, 
> and helps scalability etc.

## here is folder strucutre:
the folder structure follows the stacked architecture mvvm convention.
here lib folder is divided into 2 folders core and ui. those two as well
are divided into respective folders.

## notable files in the whole project include:
- `lib/core/constants/app_contstants.dart`: contains the string values of the routes of all the screens in the app: i.e, "views" in the mvvm convention, and hence all the possible screens for navigation.
- `lib/ui/router.dart`: generates routes for the named navigator to use
- `lib/ui/shared/dummy_data.dart`: since we didn't implement real api and auth
functionalities, we will be using static data from this file
-  `lib/ui/widgets/bottom_nav_bar.dart`: custom implementation of nav bar

- lib
    - core
        - constants => different constatns like colors, text styles etc
        - models => data models here
        - services => apis, auth etc
    - ui
        - shared => useful files shared across screens, ui helpers etc
        - views => views(screens of the app)
        - widgets => widget components
        - viewModels => models of the views that manipulate state

## 3rd party packages used in the project(dependency injectioin):
  - provider: ^6.1.2
  - get_it: ^7.7.0
  - intl: ^0.19.0
  - google_fonts: ^6.2.1
  - smooth_page_indicator: ^1.2.0+3
  - carousel_slider: ^5.0.0
  - font_awesome_flutter: ^10.7.0
  - flutter_svg: ^2.0.10+1