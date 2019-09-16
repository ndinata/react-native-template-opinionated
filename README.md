# React Native Template Opinionated
Template for opinionated boilerplate React Native project. Currently only supports React Native ^0.59.

## Usage
`react-native init MyProject --version 0.59.10 --template opinionated`

## Dependencies installed
Dependencies installed with this template are:
- Axios
- Day.js
- React Navigation
- Realm
- ESLint (with several plugins)
- Flow
- Prettier
- Reactotron React Native
- Husky + Lint-staged

You can add more/remove them in `dependencies.json` and `devDependencies.json`.

## Extras
The setup process also:
- initialises an empty Git repo,
- adds `npm` scripts for Prettier and ESLint, and
- prepares `./assets/` directory for asset files

## Create Native App
This project initially started out as a collection of Bash scripts, with the same goal of automating the setup for a base React Native project. However, being able to "templatise" a React Native project means that there's a much simpler and cleaner way of doing this. You can check out the project's initial form [here](https://github.com/nictar/create-native-app/tree/v1.0.0).
