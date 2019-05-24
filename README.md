# Create Native App
Bash script to bootstrap an opinionated React Native project.

### Dependencies
- `bash`
- `node` + `npm`
- `yarn`


### How to run
```
bash create.sh [name_of_project]
```

### Packages installed
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
- babel-preset-flow (`--dev`)
- prettier (`--dev`)
- reactotron-react-native (`--dev`)

## Todo
- [ ] Complete checklist items in `create.sh`
- [ ] Redirect output from `npm`/`react-native-cli`/`yarn` to logfiles
- [ ] Render error messages in red (optional)
