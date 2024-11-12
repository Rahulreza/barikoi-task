# BariKoi Task App

https://drive.google.com/drive/folders/1_1RucIcW6V-Umt2ZUHgRsg_1F0L0_fs2?usp=sharing


# Flutter and Dart Project Setup and GitHub Push Guide

**Author:** Md. Rahul Reza  
**Designation:** Software Engineer  
**Website:** [rahulreza.com](https://rahulreza.com)

This comprehensive guide provides step-by-step instructions for setting up a new Dart or Flutter project, initializing a Git repository, pushing it to GitHub, opening the project in various IDEs, updating SDK/packages, and preparing your app for release on the Google Play Store.

## Part 1: Dart Project Setup

### Step 1: Set Up a New Dart Project

1. **Create a New Dart Project:**
    - Open your terminal or command line.
    - Run the following command to create a new Dart project:
      ```bash
      dart create my_dart_project
      ```
    - Navigate into your project directory:
      ```bash
      cd my_dart_project
      ```

2. **Verify Project Structure:**
    - Ensure your project contains the following files:
        - `lib/`: Contains your Dart source files.
        - `pubspec.yaml`: The configuration file for your Dart project.

### Step 2: Initialize a Git Repository

1. **Initialize Git:**
    - In the root directory of your project, initialize a Git repository:
      ```bash
      git init
      ```

2. **Add All Files to Git:**
    - Add all the project files to the Git staging area:
      ```bash
      git add .
      ```

3. **Commit the Initial Setup:**
    - Commit your changes with an initial commit message:
      ```bash
      git commit -m "Initial commit"
      ```

### Step 3: Create a New Repository on GitHub

1. **Create a New GitHub Repository:**
    - Go to [GitHub](https://github.com) and log in to your account.
    - Click on the `+` icon in the top right corner and select `New repository`.
    - Name your repository (e.g., `my_dart_project`) and click `Create repository`.

2. **Link Your Local Repository to GitHub:**
    - In your terminal, add the GitHub repository as a remote:
      ```bash
      git remote add origin https://github.com/your-username/my_dart_project.git
      ```

3. **Push the Local Repository to GitHub:**
    - Push your changes to GitHub:
      ```bash
      git push -u origin master
      ```
    - If your default branch is `main`, use `main` instead of `master`:
      ```bash
      git push -u origin main
      ```

### Step 4: Ensure Dart Files are Highlighted Correctly on GitHub

1. **Create a `.gitattributes` File:**
    - In your project’s root directory, create a `.gitattributes` file:
      ```bash
      touch .gitattributes
      ```

2. **Edit the `.gitattributes` File:**
    - Open the `.gitattributes` file in a text editor and add the following line:
      ```text
      *.dart linguist-language=Dart
      ```

3. **Add and Commit the `.gitattributes` File:**
    - Add the `.gitattributes` file to Git:
      ```bash
      git add .gitattributes
      ```
    - Commit your changes:
      ```bash
      git commit -m "Add .gitattributes to specify Dart language"
      ```

4. **Push the Changes to GitHub:**
    - Push the changes to GitHub:
      ```bash
      git push
      ```

5. **Verify Dart Language Recognition:**
    - Go to your GitHub repository and verify that Dart is correctly recognized in the language breakdown at the top of the repository page.

## Part 2: Flutter Project Setup

### Step 1: Set Up a New Flutter Project

1. **Create a New Flutter Project:**
    - Open your terminal or command line.
    - Run the following command to create a new Flutter project:
      ```bash
      flutter create my_flutter_project
      ```
    - Navigate into your project directory:
      ```bash
      cd my_flutter_project
      ```

2. **Verify Project Structure:**
    - Ensure your project contains the following files and directories:
        - `lib/`: Contains your Flutter/Dart source files.
        - `pubspec.yaml`: The configuration file for your Flutter project.
        - `android/` and `ios/`: Platform-specific files for Android and iOS.

### Step 2: Open the Project in Your Preferred IDE

1. **VS Code:**
    - Open VS Code and select "File" > "Open Folder...".
    - Navigate to your project directory and click "Open".
    - Ensure you have the Flutter and Dart extensions installed for a better development experience.

2. **Android Studio:**
    - Open Android Studio and select "Open an existing Android Studio project".
    - Navigate to your project directory and click "Open".
    - Android Studio will automatically recognize the Flutter project structure.

3. **IntelliJ IDEA:**
    - Open IntelliJ IDEA and select "Open" from the welcome screen.
    - Navigate to your project directory and click "Open".
    - Ensure you have the Flutter and Dart plugins installed.

4. **Xcode (for iOS development):**
    - Open the `ios` folder within your Flutter project using Xcode.
    - Navigate to the `ios/Runner.xcworkspace` file and open it in Xcode.
    - You can manage signing, capabilities, and other iOS-specific settings here.

### Step 3: Run and Debug the Flutter App

1. **Run the App:**
    - To run the app on an emulator or connected device, use:
      ```bash
      flutter run
      ```

2. **Debug the App:**
    - You can debug the app using an IDE like VS Code, Android Studio, or IntelliJ. Set breakpoints, inspect variables, and step through the code as needed.
    - Use the `flutter analyze` command to analyze the Dart code for potential issues:
      ```bash
      flutter analyze
      ```

### Step 4: Update SDK and Packages in `pubspec.yaml`

1. **Open `pubspec.yaml`:**
    - Open the `pubspec.yaml` file located at the root of your Flutter project.

2. **Update the Flutter SDK:**
    - In the `environment` section, specify the Flutter SDK version you want to use:
      ```yaml
      environment:
         sdk: ^3.5.4
      ```

3. **Update Dependencies:**
    - In the `dependencies` section, list the packages your project depends on and specify the desired versions:
      ```yaml
      dependencies:
        flutter:
          sdk: flutter
        cupertino_icons: ^1.0.2
        http: ^0.13.3
      ```

4. **Install or Update Packages:**
    - After updating the `pubspec.yaml` file, run the following command to install or update the dependencies:
      ```bash
      flutter pub get
      ```
    - This command will fetch the latest compatible versions of the specified packages.

### Step 5: Prepare a Release Build

1. **For Android:**
    - Navigate to `android/app/` and open the `build.gradle` file.
    - Ensure that `signingConfigs` and `buildTypes` are properly configured for release.
    - Build the release APK:
      ```bash
      flutter build apk --release
      ```
    - For an app bundle (recommended for Play Store):
      ```bash
      flutter build appbundle --release
      ```

2. **For iOS:**
    - Navigate to the `ios/` directory and open the project in Xcode.
    - Configure the signing and capabilities for release.
    - Build the release version by selecting the "Archive" option from the "Product" menu in Xcode.

### Step 6: Upload to Google Play Store

1. **Prepare Your Play Console:**
    - Go to [Google Play Console](https://play.google.com/console/) and create a new app.
    - Follow the setup process, including providing the app name, description, and necessary assets (like the app icon and screenshots).

2. **Upload the APK or App Bundle:**
    - Navigate to the "Release" section of the Play Console.
    - Upload the APK or app bundle generated in the previous step.
    - Complete the release process by setting up pricing, distribution, and content rating.

3. **Submit for Review:**
    - Once everything is set up, submit your app for review.
    - Google will review your app and, once approved, it will be available on the Play Store.

## Conclusion

By following these steps, you’ve successfully set up a Dart or Flutter project, initialized a Git repository, pushed it to GitHub, opened it in your preferred IDE, updated the SDK and packages, prepared the app for release, and uploaded it to the Google Play Store.

For further queries, please contact **Md. Rahul Reza** at [rahulreza.com](https://rahulreza.com).
