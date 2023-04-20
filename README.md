# Boobalan-EACodingChallenge
## What is this repository for? ##
This repo contains a sample test app for EnergyAustralia Coding Challenge


## How do I get set up? ##
It doesn't much setup like Cocoapod installation.
Directly run the app based on the scheme like Debug or Release

## How API client works? ##
We are using Combine to support API web service communication.

## For UI design ##

Using SwiftUI for UI design

## Architecture ## 

Using MVVM Architecture 

## Assumptions ##

Assuming one record label for one band 
Handled the API failure by RETRY logic, assuming that is randomly triggered by API itself.

## Sorting ##

Sorted the elements in ascending order based on the "name" key provided by API.
