# Create Native App
Bash script to bootstrap an opinionated boilerplate React Native project. Automates the installation and setting up of a barebones React Native project with several additional packages. The created project is placed in `$HOME/Desktop/`.

## Dependencies
- `bash`
- `npm` + `node@10` (for Realm)
- `yarn`
- `python`

## How to run
```
bash create.sh [name_of_project]
```

__NOTE__: `name_of_project` has to be alphanumeric only (no hyphens etc.)

## Packages installed
The packages installed for the project with this script are:
- axios
- react-navigation
- react-native-screens
- react-native-gesture-handler
- realm
- eslint (`--dev`)
- babel-eslint (`--dev`)
- eslint-plugin-flowtype (`--dev`)
- eslint-plugin-import (`--dev`)
- eslint-plugin-jsx-a11y (`--dev`)
- eslint-plugin-react (`--dev`)
- eslint-config-airbnb (`--dev`)
- babel-cli (`--dev`)
- @babel/preset-flow (`--dev`)
- prettier (`--dev`)
- reactotron-react-native (`--dev`)

You can add/remove packages in `dependencies.txt` and `dev-dependencies.txt`.

## To-do
- [ ] Add more configurations:
    - [Intro to ESlint CLI and Jest](https://blog.aurity.co/creating-react-native-app-boilerplate-with-flow-jest-enzyme-prettier-and-eslint-cefdbce3b3d)
    - [ESLint CLI](https://eslint.org/docs/user-guide/command-line-interface)
    - [Git hooks with Husky and lint-staged](https://medium.com/gits-apps-insight/utilizing-git-hook-by-using-eslint-husky-and-lint-staged-18b6f6f60f1e)
    - [Prettier pre-commit](https://prettier.io/docs/en/precommit.html)
- [ ] Allow multiple entry points into the script (optional)
- [ ] Turn this project into an executable/package (optional)
