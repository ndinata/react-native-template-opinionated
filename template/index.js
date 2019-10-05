/**
 * @format
 */

import { AppRegistry } from 'react-native';
import App from './src/App';
import { name as appName } from './app.json';

// eslint-disable-next-line
if (__DEV__) {
  import('./ReactotronConfig');
}

AppRegistry.registerComponent(appName, () => App);
