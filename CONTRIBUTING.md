# Prerequsites

* git
* Java 17 (OpenSDK)

## Getting the source

First, create a fork of this repository and clone the fork:

```
git clone https://github.com/<<<your-github-account>>>/TODO.git
```

Add the upstream repository as a second remote, so you can incorporate upstream changes into your fork:

```
git remote add upstream https://github.com/Fraunhofer-AISEC/cpg-contract-checker.git
```

# Build and Run


Make sure you can build the repository

```
./gradlew clean spotlessApply installDist
```

This project requires Java 17. If Java 17 is not your default Java version, make sure to configure gradle to use it by setting its java.home variable:

```
./gradlew -Dorg.gradle.java.home="/usr/lib/jvm/java-17-openjdk-amd64/" build
```

You can test analyzing a file with:

```
./cpg-contract-checker-app/build/install/cpg-contract-checker-app/bin/cpg-contract-checker-app <<<Contractfile.sol>>>
```


## Copyright Notice

This project has the convention of including a license notice header in all source files:
```java
/*
 * Copyright (c) 2024, Fraunhofer AISEC. All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * ╔═╗╔═╗╔═╗   ╔═╗┌─┐┌┐┌┌┬┐┬─┐┌─┐┌─┐┌┬┐  ╔═╗┬ ┬┌─┐┌─┐┬┌─┌─┐┬─┐
 * ║  ╠═╝║ ╦───║  │ ││││ │ ├┬┘├─┤│   │───║  ├─┤├┤ │  ├┴┐├┤ ├┬┘
 * ╚═╝╩  ╚═╝   ╚═╝└─┘┘└┘ ┴ ┴└─┴ ┴└─┘ ┴   ╚═╝┴ ┴└─┘└─┘┴ ┴└─┘┴└─
 *
 */
```

If you are using IntelliJ IDEA, you can import `style/copyright.xml` as a copyright profile to automate the header creation process.
Click [here](https://www.jetbrains.com/help/idea/copyright.html) for further information on copyright profiles.

## Code Guidelines

Most of our code is written in Kotlin and if you develop new nodes, one should follow the example of other implemented nodes or the guidelines of the cpg library project.

# Pull Requests

Before we can accept a pull request from you, you'll need to sign a Contributor License Agreement (CLA). It is an automated process and you only need to do it once.

:warning:
We are currently discussing the implementation of a Contributor License Agreement (CLA). Unfortunately, we cannot merge external pull requests until this issue is resolved.
:warning:

Pull requests will be considered after the project is aligned with the main branch of the cpg property.

To enable us to quickly review and accept your pull requests, always create one pull request per issue and link the issue in the pull request.
Never merge multiple requests in one unless they have the same root cause. Be sure your code is formatted correctly using the respective formatting task.
Keep code changes as small as possible. 
Pull requests should contain tests whenever possible.

# Language

Please stick to English for all discussions and comments. This helps to make the project accessible for a larger audience.
