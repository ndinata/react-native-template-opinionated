# React Native Template Opinionated

(Slightly) Opinionated template for new React Native projects.

## Usage

```sh
# latest template version — needs Node >= 14
npx react-native init MyProject --template react-native-template-opinionated

# alternatively, use an older version of React Native (more info in table below)
npx react-native init MyProject --template 'react-native-template-opinionated@3.5.*'
```

> Note: make sure you don't have the legacy global CLI (`react-native-cli`) installed, as this template only works with the new CLI. More details on legacy vs new CLI can be found [here](https://github.com/react-native-community/cli/blob/master/docs/init.md).

#### Different Versions of React Native

| React Native | Node  | Type-check             | Template |
| ------------ | ----- | ---------------------- | -------- |
| 0.69.5       | >= 14 | Typescript             | 6.0.\*   |
| 0.68.2       | >= 14 | Typescript             | 5.0.\*   |
| 0.67.1       | >= 12 | Typescript             | 4.3.\*   |
| 0.66.3       | >= 12 | Typescript             | 4.2.\*   |
| 0.64.2       | >= 12 | Typescript             | 4.1.\*   |
| 0.63.4       | >= 10 | Typescript<sup>1</sup> | 4.0.\*   |
| 0.63.4       | >= 10 | Flow                   | 3.5.\*   |
| 0.62.2       | >= 10 | Flow                   | 3.4.\*   |
| 0.61.5       | >= 10 | Flow                   | 3.3.\*   |

<sup>1</sup>Only Typescript is going to be supported from v4 onwards. The last supported React Native version that uses Flow in this template is v0.63.4.

> Note: Starting from v5 of this template (React Native v0.68.2), files related to the [New Architecture](https://reactnative.dev/blog/2022/03/30/version-068#opting-in-to-the-new-architecture) have been added to the template, although it is kept off by default.

## Configuration

In addition to the packages the default template comes with (ESLint, Jest, etc.), this template also includes these ones out of the box:

- [async-storage](https://github.com/react-native-async-storage/async-storage)
- [dayjs](https://github.com/iamkun/dayjs/)
- [detox v19](https://github.com/wix/Detox) (basic config — doesn't support Proguard, AOSP emulators)
- [husky](https://github.com/typicode/husky) + [lint-staged](https://github.com/okonet/lint-staged)
- [import-sort-style-rn](https://github.com/nictar/import-sort-style-rn)
- [netinfo](https://github.com/react-native-netinfo/react-native-netinfo)
- [react-native-svg](https://github.com/react-native-svg/react-native-svg)
- [react-native-version-number](https://github.com/APSL/react-native-version-number)
- [react-navigation v6](https://github.com/react-navigation/react-navigation)

## Create Native App

This project initially started out as a collection of Bash scripts, with the same goal of automating the setup for a base React Native project. This repo was adapted after React Native CLI added the ability to "templatise" a new project. You can check out the project's initial form [here](https://github.com/nictar/create-native-app/tree/v1.0.0).
