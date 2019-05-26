# Create Native App
Bash script to bootstrap an opinionated boilerplate React Native project. Automates the installation and setting up of a bare-bones React Native project with several additional packages. The created project is placed in `$HOME/Desktop/`.


## Dependencies
- `bash`
- `npm` + `node@10` (for Realm)
- `yarn`
- `python`


## How to run
```
bash create.sh [name_of_project]
```


## Packages installed
The packages installed for the project with this script are:
- axios
- react-navigation
- react-native-screens
- react-native-gesture-handler
- eslint (`--dev`)
- babel-eslint (`--dev`)
- eslint-plugin-flowtype (`--dev`)
- eslint-plugin-import (`--dev`)
- eslint-plugin-jsx-a11y (`--dev`)
- eslint-plugin-react (`--dev`)
- eslint-config-airbnb (`--dev`)
- babel-cli (`--dev`)
- babel-preset-flow (`--dev`)
- prettier (`--dev`)
- reactotron-react-native (`--dev`)

## Todo
- [x] Redirect output from `npm`/`react-native-cli`/`yarn` to logfiles
- [x] Add `.vscode/settings.json` to created projecs
- [x] Automate creating `assets/img/` and `assets/fonts/` in project directory
- [ ] Handle message informing installation of `flow-bin` (`yarn add --dev flow-bin`)
