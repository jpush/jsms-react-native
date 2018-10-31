import React from 'react';
import { StyleSheet, Text, View, TouchableHighlight, ScrollView, TextInput, Alert  } from 'react-native';
import JSMS from 'jsms-react-native'

var styles = StyleSheet.create({
  parent: {
    padding: 35,
    
    flexDirection: 'column',
    justifyContent: 'center',
    alignItems: 'center',
  },
  setBtnStyle: {
    width: 180,
    marginTop: 10,
    borderWidth: 1,
    borderColor: '#3e83d7',
    borderRadius: 8,
    backgroundColor: '#3e83d7',
    padding: 10
  },
  textStyle: {
    textAlign: 'center',
    fontSize: 25,
    color: '#ffffff'
  },
  inputText: {
    width: 180,
    fontSize: 15,
    marginLeft: 5,
    marginRight: 5,
    color: '#000000',
    padding: 10,
    textAlign: 'left'
  }
})

class Button extends React.Component {
  render() {
    return <TouchableHighlight
              style={styles.setBtnStyle}
              onPress={this.props.onPress}
              underlayColor='#e4083f'
              activeOpacity={0.5}
            >
              <Text style={styles.textStyle}>{this.props.title}</Text>
            </TouchableHighlight>
  }
}
export default class App extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      number: '',
      code: ''
    }
  }
  render() {
    return (
      <ScrollView contentContainerStyle={styles.parent}>
        <TextInput 
          style={styles.inputText}
          placeholder='请输入电话号码'
          onChangeText={ text => this.setState({number: text}) }
        />
        <TextInput 
          style={styles.inputText}
          placeholder='请输入收到的验证码'
          onChangeText={ text => this.setState({code: text}) }
        />
        <Button title="init" 
          onPress={() => JSMS.init('a1703c14b186a68a66ef86c1')}/>
        <Button title="getVerificationCode" 
        onPress={() => JSMS.getVerificationCode({number: this.state.number, templateId: ''}, () => {
          console.log(`getVerificationCode success`)
        }, 
          (error) => {
            console.log(`getVerificationCode ${error}`)
          })}/>
        <Button title="getVoiceVerificationCode" 
        onPress={() => JSMS.getVoiceVerificationCode({number: this.state.number, language: 'zh'}, () => {
          console.log(`getVoiceVerificationCode success`)
        }, 
          (error) => {
            console.log(`getVoiceVerificationCode ${error}`)
          })}/>
        <Button title="检查验证码是否正确" 
        onPress={() => JSMS.checkVerificationCode({number: this.state.number, code: this.state.code}, () => {
          // console.log(`checkVerificationCode success`)
          Alert.alert('checkVerificationCode','success')
        }, 
          (error) => {
            // console.log(`checkVerificationCode ${error}`)
            Alert.alert('checkVerificationCode','error')
          })}/>
        <Button title="置获取验证码的时间间隔" 
        onPress={() => JSMS.setMinimumTimeInterval(60)}/>
      </ScrollView>
    );
  }
}