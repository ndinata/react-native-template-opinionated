# React Native Template Opinionated
Template for opinionated boilerplate React Native project. Supports React Native versions ^0.59.10 and ^0.61.2.

## Usage
#### `react-native@0.61.x`
Note: make sure you don't have the global legacy CLI (`react-native-cli`) installed, as this version of the template only works with the new CLI. More details on legacy vs new CLI can be found [here](https://github.com/react-native-community/cli/blob/master/docs/init.md).
```
npx react-native init MyProject --template react-native-template-opinionated
```

#### `react-native@0.59.x`
Note: this version requires the legacy CLI (`react-native-cli`)
```
react-native init MyProject --version 0.59.10 --template react-native-template-opinionated@2.1.1
```

## Dependencies installed
Dependencies installed with this template are:
- Axios
- Day.js
- ESLint (with several plugins)
- Flow
- Prettier
- Reactotron React Native
- Husky + Lint-staged

You can add more/remove them in `template/package.json`.

## Extras
The setup process also:
- initialises an empty Git repo,
- handles setup of Husky + lint-staged,
- adds `npm` scripts for Prettier and ESLint, and
- prepares `./assets/` directory for asset files

## Create Native App
This project initially started out as a collection of Bash scripts, with the same goal of automating the setup for a base React Native project. However, being able to "templatise" a React Native project means that there's a much simpler and cleaner way of doing this. You can check out the project's initial form [here](https://github.com/nictar/create-native-app/tree/v1.0.0).
