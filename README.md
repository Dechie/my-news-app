# my-news-app

## This is a flutter app UI made with stacked architecture.

> stacked architecture is an implementation of flutter. 
> it implements a good deal of separation of concerns, 
> and helps scalability etc.

here is folder strucutre:
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