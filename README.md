# WeatherApp
---

### What

This is a simple implementation of a forecast app that uses the free World Weather Online's API ([More information here](http://www.worldweatheronline.com/api/free-api-terms.aspx)) to fetch forecast informations. This app allows the user to search a city to see its forecast, and also save cities for further forecast preview

### App's architecture

This app was developed using the VIPER (backronym for View, Interactor, Presenter, Entity and Routing) architecture (check the [References](##References) section for more information), which is an alternative to the MVC (model-view-controller) architecture. The advantage of this architecture is that it allow us to divide the app's logic into distinct layers of responsibility, and fits perfect when developing  using TDD.

#### VIPER's briefly explanation

Each module of the app (in this case, each screen) consists in at least four different layers:
- Interactor: Contains all the business logic as specified by a use case. It potentially communicates with a data source (webservice, database...) to obtain the data.
- Presenter: The presenter drives the view controller. It has all the logic to obtain the data from the interactor and prepare the content to display. This layer also reacts to user inputs and actions, and does the needed decision
- View: Display what is told by the presenter. It doesn't hold any business logic, it is just prepared to display content when asked by the presenter
- Wireframe: Holds all the app's navigation logic. Its role is instantiate, prepare, and present view controllers.


## App structure explanation
---
 This section will provide a briefly explanation about the app's implementation, talking a bit about the main screen (`ForecastViewController`).

#### `AppDelegate`: 
This class holds a reference of the `AppWireframe` class. The `AppDelegate` will create a `UIWindow` and ask the app wireframe to present the root view controller in its window.

#### `AppWireframe`:
It knows who is the root wireframe. It creates an instance of the root wireframe, and ask it to present the view in its window. This object also holds a reference of the root wireframe, in case the app wants to know who is main presented view.

#### `ForecastViewWireframe`: 
Will create, prepare, and present the `ForecastViewController`. It also injects all the dependencies onto the view (adding the presenter the view, the interactor and wireframe to the presenter). This class is also responsible to know how to navigate/present views from the `ForecastViewController`.

#### `ForecastViewInteractor`
Holds the forecast business logic. It contains a delegate, fetches the data asynchronously, and notify its delegate when the data is fetched, or if an error getting the data happens. It also has a data manager (`WorldWeatherDataManager`) which is the place where the data will get from.

#### `WorldWeatherDataManager`
This class basically provides a communication with the World Weather API, holding logics such as authentication, figuring out the right API's endpoint and executing the webservice request.

#### `ForecastViewPresenter`
Drives and reacts to events from the `ForecastViewController`. When something happens in the view, it knows how and which data it must obtain. It will ask and receive models from its interactors, and through a data collector (`ForecastDisplayDataCollector`) will prepare the data to send out to the view present it. This class holds not only a `ForecastViewInteractor`, but also a `SavedCitiesInteractor` in order to ask the view to present city's informations.

#### `ForecastDisplayDataCollector`
It collects models in the format they come from the database, and convert them into display data objects. Since we don't want to tie our view to our model, it converts the models to how they should be presented in the view. This layer provides an awesome flexibility, because once we have to modify models due to a database structure change, or even have different types of models being presented in the same way in our view, this class will abstract all this logic.

#### `ForecastViewController`
This is our presentation layer itself. It holds only User Interface logic. It holds an instance of `ForecastDisplayData`, which provides all the data in a way that it should be presented.

<br />
All other views along the app will follow the same structure/logic. All the files such as models, presenters, data collectors and views are separated in distinct folders. After reading this short explanation, the understanding of other modules is pretty straightforward.

## More
---
#### Saved cities storage:
The user's favorite cities are the only objects that must be persisted within the app. Due to the fact the amount of stored data will not be so large, and the app doesn't required complex query filters, all the cities are being stored using the `NSKeyedArchiver` and fetched using the `NSKeyedUnarchiver`. In order to make it work properly, the model `City`conforms to the `NSCoding` protocol, and overrides the `encodeWithCoder:` and `initWithCoder:` methods.

This storage method was chosen not only because of the arguments mentioned above, but also because after conforming to the `NSCoding` protocol, we can persist and retrieve our models through an array.

<br />


## Third party libraries

This project uses two dependencies only, the `AFNetworking`, which is one of the most popular networking library for iOS, and the `OCMock` library, which is an Objective-C implementation of mock objects library used for writing tests. All the libraries are installed and maintained using `Cocoapods`.

<br />

## Backlog

In order to achieve a MVP, some features couldn't be completed and were added to the backlog for further implementation:

- Fetch the user's location to present the forecast of his current location
- Writing more unit testing for the most important app's classes
   - Only one unit testing has been written. 

<br />
## References
---

[Objc.io - Issue 13 ](https://www.objc.io/issues/13-architecture/viper/)<br />
[Mutual Mobile - Viper Introduction](http://mutualmobile.github.io/blog/2013/12/04/viper-introduction/) <br />
[World Weather API Docs](http://www.worldweatheronline.com/api/docs/)
<br />
[AFNetwroking Github's repository](https://github.com/AFNetworking/AFNetworking)
[Cocoapods official website](https://cocoapods.org/)