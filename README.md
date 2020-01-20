# React Native Template Opinionated
Template for opinionated boilerplate React Native project. Supports React Native v0.61.x.

## Usage
#### `react-native@0.61.x`
Note: make sure you don't have the global legacy CLI (`react-native-cli`) installed, as this version of the template only works with the new CLI. More details on legacy vs new CLI can be found [here](https://github.com/react-native-community/cli/blob/master/docs/init.md).
```
npx react-native init MyProject --template react-native-template-opinionated
```

## Dependencies installed
Dependencies installed with this template are:
- Axios
- Day.js
- ESLint
- Flow
- Prettier
- Import-sort
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
