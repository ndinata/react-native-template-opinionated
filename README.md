# react-native-template-opinionated

An opinionated template for new React Native projects in TypeScript (non-Expo).

## Usage

```sh
# Replace `MyProject` below with your project name!

# latest template version — needs Node >= 18
npx react-native init MyProject --template react-native-template-opinionated

# alternatively, use an older version of React Native (more info in table below)
npx react-native init MyProject --template 'react-native-template-opinionated@6.0.*'
```

#### Different Versions of React Native

| React Native version | Min. Node version | Template version |
| -------------------- | ----------------- | ---------------- |
| 0.72.10              | >= 18             | 9.0.\*           |
| 0.71.16              | >= 18             | 8.6.\*           |
| 0.70.6               | >= 16             | 7.0.\*           |
| 0.69.5               | >= 14             | 6.0.\*           |
| 0.68.2               | >= 14             | 5.0.\*           |

> Note: Starting from v5 of this template (React Native v0.68.2), files related to
> the [New Architecture](https://reactnative.dev/blog/2022/03/30/version-068#opting-in-to-the-new-architecture)
> have been added to the template, although it is kept **off** by default. Hermes,
> on the other hand, is **enabled** by default starting from v7 of this template
> (React Native v0.70.6).

## Configuration

In addition to the packages the default template comes with (ESLint, Jest, etc.),
this one also includes these ones out of the box:

- [async-storage](https://github.com/react-native-async-storage/async-storage)
- [husky](https://github.com/typicode/husky) + [lint-staged](https://github.com/okonet/lint-staged)
- [luxon](https://github.com/moment/luxon) (with intl variant of JSC enabled)
- [netinfo](https://github.com/react-native-netinfo/react-native-netinfo)
- [prettier plugin for import sorting](https://github.com/IanVS/prettier-plugin-sort-imports)
- [react-native-svg](https://github.com/software-mansion/react-native-svg) + [react-native-svg-transformer](https://github.com/kristerkari/react-native-svg-transformer)
- [react-native-testing-library](https://github.com/callstack/react-native-testing-library)
- [react-native-version-number](https://github.com/APSL/react-native-version-number)
- [react-navigation v6](https://github.com/react-navigation/react-navigation)
- [typescript](https://www.typescriptlang.org) with [strictest config](https://github.com/tsconfig/bases/blob/main/bases/strictest.json)

## License

Licensed under the [MIT license](./LICENSE).

## Create Native App

This project initially started out as a collection of Bash scripts, with the same
goal of automating the setup for a base React Native project. This repo was adapted
after React Native CLI added the ability to "templatise" a new project. You can check
out the project's initial form [here](https://github.com/ndinata/react-native-template-opinionated/tree/v1.0.0).
