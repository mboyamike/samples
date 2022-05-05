# samples

A flutter project to demonstrate how to create a project and save it on firebase

## Getting Started

To run this project, you will need to have Flutter installed on your computer.
For instructions on how to install Flutter, [check this link](https://docs.flutter.dev/get-started/install)

You will also need an IDE (The software that you use to write the Flutter App). 
A personal preference is vs code. You can [download here](https://code.visualstudio.com)

Once you have set up the IDE and Flutter, you can run the project either by clicking on the
play icon on your IDE or typing the following command on the terminal:

```
    Flutter run -d chrome
```

## Project Structure

Whenever flutter runs, it first searches for the main.dart file inside the 
lib folder. This is the entry point to the code. There is a main function
that gets called, which sets up Firebase, GetIt Locators (which are used
within the app to access resources that have already been set up) and the
widget tree that flutter uses. We also set up the router, which is used to
tell Flutter which screen to open on which web URL.



