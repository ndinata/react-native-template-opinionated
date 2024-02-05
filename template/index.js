// [template] react-native-gesture-handler
// https://reactnavigation.org/docs/stack-navigator#installation
import "react-native-gesture-handler";

import { AppRegistry } from "react-native";

import { name as appName } from "./app.json";
import App from "./src/App";

AppRegistry.registerComponent(appName, () => App);
