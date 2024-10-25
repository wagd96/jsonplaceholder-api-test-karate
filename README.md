# Jsonplaceholder-API-test-karate

## Description
API tests using Karate for jsonplaceholder - API for testing and prototyping. Automation of tests for the functionalities of the jsonplaceholder API: GET, POST, PUT, DELETE, and inclusion of E2E scenarios that utilize the mentioned functions.

## Requirements
- Java 17
- Gradle 8.2

## Installation
1. **Install Java 17**:
    - Make sure you have Java 17 installed on your machine. You can verify the installation by running the following command in your terminal:
      ```bash
      java -version
      ```
    - If you don't have Java installed, you can download it from [Oracle](https://www.oracle.com/java/technologies/javase-jdk17-downloads.html) or [AdoptOpenJDK](https://adoptopenjdk.net/).

2. **Install Gradle 8.2**:
    - Verify that Gradle is installed by running:
      ```bash
      gradle -v
      ```
    - If Gradle is not installed, you can follow the instructions on [the official Gradle website](https://gradle.org/install/) to install it.

3. **Clone the Repository**:
    - Clone your project repository to your local machine. Open a terminal and run:
      ```bash
      Using SSH: git clone git@github.com:wagd96/jsonplaceholder-api-test-karate.git 
      
      Using HTTPS: git clone https://github.com/wagd96/jsonplaceholder-api-test-karate.git
      ```

4. **Navigate to the Project Directory**:
    - Change to the cloned project directory:
      ```bash
      cd jsonplaceholder-api-test-karate
      ```

5. **Build the Project**:
    - Once inside the project directory, run the following command to build the project and download dependencies:
      ```bash
      gradle build
      ```

## Usage
After installation, you can run the tests using the following command in the project directory:

```bash
gradle test
```

## Project Structure

The project structure follows the standard convention for Karate projects. Below is the organization of the main folders and files:

```bash

jsonplaceholder-api-test-karate/
├── src
│   └── test
│       ├── java                # Java code (optional, if using hooks or Java configurations)
│       ├── features            # Karate feature files defining test scenarios
│       └── karate-config.js    # Karate configuration file (optional)
└── build.gradle                # Gradle configuration file
```
- **features:** Contains `.feature` files where test scenarios are defined in Gherkin language.
- **karate-config.js:** Optional file where global configurations for Karate tests can be defined.
- **build.gradle:** Gradle configuration file that specifies dependencies and project configurations.
## Contact

If you have any questions or suggestions, feel free to reach out to me:

- **LinkedIn:** [Alejandro Gallego Durango](https://www.linkedin.com/in/alejandro-gallego-durango/)
- **Email:** wagd96@gmail.com
