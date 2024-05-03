# tenders_app

# Tenders in Poland App

## Overview
This repository hosts a Flutter application designed for a technical assessment. It utilizes the "Tenders in Poland API" to display a paginated list of tenders and a details for summary information. The focus is on demonstrating effective data and state management using the Repository design pattern.

### Technologies Used
- **Flutter**: Used for building the cross-platform mobile application.
- **API**: Data fetched from [Tenders in Poland API](https://tenders.guru/pl/api)

## Architecture
This project implements the **Repository design pattern** for decoupling to abstract the data layer from the business logic, ensuring better maintainability and scalability. The architecture components include:

- **/lib**:
  - **/di**: Directory for setting up dependency injection, ensuring that the app components receive their dependencies properly.
  - **/features**: Contains all the app-specific features.
    - **/tenders**: Module dedicated to the tenders feature.
      - **/data**: Data layer containing API calls, data models, and repositories.
      - **/domain**: Domain layer with business logic and use cases.
      - **/presentation**: Presentation layer with all UI components like screens and widgets related to tenders.
  - **/utils**: Utility functions and classes used throughout the app.
  - **constants.dart**: File containing all the global constants used across the app.
  - **helpers.dart**: Helper functions that provide commonly used functionalities.
  - **main.dart**: The entry point of the Flutter application which sets up dependency injection and runs the app.

## Setup and Installation
Follow these instructions to set up the project locally.

### Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/konuleminova/tenders_app_assignment.git

<img width="335" alt="Screenshot 2024-05-03 at 03 21 24" src="https://github.com/konuleminova/tenders_app_assignment/assets/24622616/11582ef2-6fb3-43e7-92b6-096640dcbbed">

<img width="341" alt="Screenshot 2024-05-03 at 03 25 42" src="https://github.com/konuleminova/tenders_app_assignment/assets/24622616/ca00dfd2-673e-48b1-9a43-0fa2b34ca3e3">

**NOTE:** The API may sometimes experience slow response times or temporarily not work.
