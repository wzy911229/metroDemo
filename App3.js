/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 *
 * @format
 * @flow
 */

import React, {Component} from 'react';
import {TouchableOpacity, StyleSheet, Text, View} from 'react-native';

export class App3_1 extends Component {
  render() {
    return (
      <View style={styles.container}>
        <TouchableOpacity onPress={() => this.props.navigation.push('App2')}>
          <Text style={[styles.navBtn]}>导航到js页面2</Text>
        </TouchableOpacity>
        <Text style={styles.welcome}>hello world for 3 page</Text>
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
  navBtn: {
    fontSize: 20,
    textAlign: 'center',
    margin: 40,
    padding: 15,
    backgroundColor: 'red',
    borderRadius: 6,
  },
});
