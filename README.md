# React Native Template Opinionated

Template for opinionated boilerplate React Native project.

## Usage

```
npx react-native init MyProject --template react-native-template-opinionated
```

Note: make sure you don't have the global legacy CLI (`react-native-cli`) installed, as this version of the template only works with the new CLI. More details on legacy vs new CLI can be found [here](https://github.com/react-native-community/cli/blob/master/docs/init.md).

### Different Versions of React Native

| React Native | Template |
| ------------ | -------- |
| 0.63.3       | 3.5.\*   |
| 0.62.2       | 3.4.\*   |
| 0.61.5       | 3.3.\*   |

### Example with React Native v0.62

```
npx react-native init MyProject --template 'react-native-template-opinionated@3.4.*'
```

## Dependencies

Dependencies installed with this template are:

- day.js
- React Navigation (Stack)
- ESLint
- Flow
- Prettier
- import-sort
- husky + lint-staged

You can add more/remove them in `template/package.json`.

## Create Native App

This project initially started out as a collection of Bash scripts, with the same goal of automating the setup for a base React Native project. However, after React Native CLI added the ability to "templatise" a React Native project, this repo was adapted to conform to its template. You can check out the project's initial form [here](https://github.com/nictar/create-native-app/tree/v1.0.0).
