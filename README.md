# tv-show-tracker

A simple TV show episode tracker app built with Flutter

## Table of Contents
* [Overview](#overview)
* [Features](#features)
* [Possible Improvements](#possible-improvements)
* [Main Packages Used](#main-packages-used)
* [Setup](#setup)

## Overview
A cross-platform application which lets users browse popular/top shows, search for shows, mark favourite shows and track watched episodes (data is persisted using Sembast). This application relies on the [TMDB API](https://www.themoviedb.org/documentation/api?language=en-GB) for retriving tv show information.

![TV show tracker demo](https://user-images.githubusercontent.com/72221490/187976633-a866e57e-26a2-4958-90f3-de7926e8e6f7.gif)

## Features
* Popular shows
* Top shows
* Search shows
* Show details and recommendataions
* Add shows to favourites
* Track watch progress

## Possible Improvements
* Improved UI
* More complex show discovery options e.g., filtering genres
* Make stored information accessible from any of the user's devices
* Help section or tutorial for new users
* Localisation e.g., tailoring shows to the user's location
* An episode release schedule for favourited shows which are still airing
* An aggregated page of unwatched episodes for favourited shows
* Rate watched shows and/or episodes
* A more detailed show information page e.g., user reviews, actors
* Prompts e.g., an alert before unfavouriting a show

## Main Packages Used
* [riverpod](https://pub.dev/packages/riverpod)
* [freezed](https://pub.dev/packages/freezed)
* [sembast](https://pub.dev/packages/sembast)
* [http](https://pub.dev/packages/http)

## Setup
1. Clone the project to get a local copy
``` bash
git clone https://github.com/kelvin589/tv-show-tracker
```
2. Change your directory to the project folder
``` bash
cd tv-show-tracker
```
3. Install dependencies
``` bash
flutter pub get
```
4. Update ``` /lib/services/api_keys.default.dart ``` with your tmdb api key and rename the file to ``` api_keys.dart ```
5. Open ``` main.dart ``` and run the project on an emulator
