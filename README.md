# WalkerTestApp
A test project to assess the skills of a candidate for the iOS developer position.

# Description
<p>
This is a simple pedometer project designed to demonstrate the developer's skills and coding style<br>
building a user interface, writing business logic, and structuring the project effectively.<br>

The app can effectively display users' step counts and show step count statistics for the week.<br>
Additionally, you can set a goal and track whether the goal has been reached.<br>
Any errors are handled appropriately and displayed on the screen.<br>
</p>

# Getting started
<p>
1. The app requires a minimum deployment target of iOS 17, so ensure your Xcode version supports this target to proceed with the build and testing.<br>
2. No additional packages or pods are required for this app.<br>
3. Open the project files in Xcode.<br>
4. Run the active scheme.<br>

Now you can explore how this app works.<br>
</p>

# Usage
<p>
You should first see the splash screen, and then the app will ask for the required permissions.<br>  
On the main view, today's step count and the weekly step count statistics should appear.<br> 
You can choose to view the step statistics as a list or a chart.<br> 
Also in tool bar you can add goal.<br> 
</p>

# Architecture
<p>
* WalkerTestApp project is implemented using the <strong>Model-View-ViewModel (MVVM)</strong> architecture pattern.
* The view models implement the logic related to preparing data for display and provide the data handling logic associated with user interaction on the screen.
* The views are responsible for displaying data on the screen. They react to changes in the view models and update the screen accordingly.
* The project does not have a database. Only simple UserDefaults storage.
* For previews, mock data is used.
</p>

# Structure 
* "Extensions": Files that extend native classes with additional functionality.
* "Models": Contains the data models used throughout the project. 
* "Utils": Utility files and classes.
* "Entitlements": Contains entitlements file that are used across multiple parts of the project.
* "PreviewContent": Any content for previews.
* "Resources": Non-code files that are used by the project. These include images, colors, and other types of assets.
* "Views": Views are used to display data and additional view models.

# Running the tests
<p>The app does not implement any tests.</p>

# Dependencies
<p>The app has no dependencies.</p>
