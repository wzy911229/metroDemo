import {AppRegistry} from 'react-native';
import {createStackNavigator} from 'react-navigation';
import {App3_1} from './App3';
import App2 from './App2';

const App3 = createStackNavigator(
  {
    App3_1: {screen: App3_1},
    App2: {screen: App2},
  },
  {
    navigationOptions: {
      showIcon: true,
      swipeEnabled: false,
      animationEnabled: false,
      lazy: true,
    },
    mode: 'card',
  },
);

AppRegistry.registerComponent('reactnative_multibundler3', () => App3);
