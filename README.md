# React Native Template Opinionated

Opinionated template for boilerplate React Native projects.

## Usage

```sh
npx react-native init MyProject --template react-native-template-opinionated
```

Note: make sure you don't have the global legacy CLI (`react-native-cli`) installed, as this version of the template only works with the new CLI. More details on legacy vs new CLI can be found [here](https://github.com/react-native-community/cli/blob/master/docs/init.md).

#### Different Versions of React Native

| React Native | Type-check             | Template |
| ------------ | ---------------------- | -------- |
| 0.63.4       | Typescript<sup>1</sup> | 4.0.\*   |
| 0.63.4       | Flow                   | 3.5.\*   |
| 0.62.2       | Flow                   | 3.4.\*   |
| 0.61.5       | Flow                   | 3.3.\*   |

<sup>1</sup>Only Typescript is going to be supported from v4 onwards. The last supported React Native version that uses Flow is v0.63.4.

#### Usage with different versions of React Native

```sh
# latest React Native version
npx react-native init MyProject --template react-native-template-opinionated

# e.g. React Native v0.62.2
npx react-native init MyProject --template 'react-native-template-opinionated@3.4.*'
```

## Dependencies

Additional dependencies installed with this template include:

- Day.js
- React Navigation
- Typescript (Flow on older versions)
- Prettier
- Import-sort
- Husky + lint-staged

You can add more/remove them in `template/package.json`.

## Create Native App

This project initially started out as a collection of Bash scripts, with the same goal of automating the setup for a base React Native project. However, after React Native CLI added the ability to "templatise" a React Native project, this repo was adapted to conform to its template. You can check out the project's initial form [here](https://github.com/nictar/create-native-app/tree/v1.0.0).
