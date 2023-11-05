# React Native Template Opinionated

(Slightly) Opinionated template for new React Native projects.

## Usage

```sh
# latest template version — needs Node >= 18
npx react-native init MyProject --template react-native-template-opinionated

# alternatively, use an older version of React Native (more info in table below)
npx react-native init MyProject --template 'react-native-template-opinionated@4.1.*'
```

> Note: make sure you don't have the legacy global CLI (`react-native-cli`) installed,
> as this template only works with the new CLI. More details on legacy vs new CLI can
> be found [here](https://github.com/react-native-community/cli/blob/master/docs/init.md).

#### Different Versions of React Native

| React Native | Node  | Type-check | Template |
| ------------ | ----- | ---------- | -------- |
| 0.71.14      | >= 18 | Typescript | 8.4.\*   |
| 0.70.6       | >= 16 | Typescript | 7.0.\*   |
| 0.69.5       | >= 14 | Typescript | 6.0.\*   |
| 0.68.2       | >= 14 | Typescript | 5.0.\*   |
| 0.67.1       | >= 12 | Typescript | 4.3.\*   |
| 0.66.3       | >= 12 | Typescript | 4.2.\*   |
| 0.64.2       | >= 12 | Typescript | 4.1.\*   |

> Note: Starting from v5 of this template (React Native v0.68.2), files related to
> the [New Architecture](https://reactnative.dev/blog/2022/03/30/version-068#opting-in-to-the-new-architecture)
> have been added to the template, although it is kept **off** by default. Hermes,
> on the other hand, is **enabled** by default starting from v7 of this template
> (React Native v0.70.6).

## Configuration

In addition to the packages the default template comes with (ESLint, Jest, etc.),
this template also includes these ones out of the box:

- [async-storage](https://github.com/react-native-async-storage/async-storage)
- [detox v19](https://github.com/wix/Detox) (basic config — doesn't support Proguard, AOSP emulators)
- [husky](https://github.com/typicode/husky) + [lint-staged](https://github.com/okonet/lint-staged)
- [luxon](https://github.com/moment/luxon) (with intl variant of JSC enabled)
- [netinfo](https://github.com/react-native-netinfo/react-native-netinfo)
- [prettier plugin for import sorting](https://github.com/IanVS/prettier-plugin-sort-imports)
- [react-native-svg](https://github.com/react-native-svg/react-native-svg)
- [react-native-testing-library](https://github.com/callstack/react-native-testing-library)
- [react-native-version-number](https://github.com/APSL/react-native-version-number)
- [react-navigation v6](https://github.com/react-navigation/react-navigation)

## License

Licensed under the [MIT license](./LICENSE).

## Create Native App

This project initially started out as a collection of Bash scripts, with the same
goal of automating the setup for a base React Native project. This repo was adapted
after React Native CLI added the ability to "templatise" a new project. You can check
out the project's initial form [here](https://github.com/nictar/create-native-app/tree/v1.0.0).
