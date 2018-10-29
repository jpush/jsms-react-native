* [Common API](#common-api)
  * [init](#init)
  * [getVerificationCode](#getverificationcode)
  * [getVoiceVerificationCode](#getvoiceverificationcode)
  * [checkverificationcode](#checkverificationcode)
  * [checkVerificationCode](#checkverificationcode)
  * [setMinimumTimeInterval](#setminimumtimeinterval)

### Common API

Android 和 iOS 通用 API。

### init

初始化 JSMS 插件，必须先调用这个接口，其他功能才能正常使用。

##### 参数说明

- {String} appKey: 极光官网注册的应用 appkey。

##### 示例

```javascript
JSMSModule.init('输入你的 appkey');
```
### getVerificationCode

获取短信验证码。

##### 示例

```javascript
JSMS.getVerificationCode({
  number: '136********', 
  templateId: ''
}, () => {}, (error) => {})
```

### getVoiceVerificationCode

获取语音验证码。

##### 参数说明

- {String} number: 接收验证码的手机号码。
- {String} language: 语言选项：
  - 'zh': 中文。
  - 'en': 英文。

##### 示例

```javascript
JSMS.getVoiceVerificationCode({
  number: '136********', 
  language: 'zh'
}, () => {}, (error) => {})
```

### checkVerificationCode

检查验证码是否正确。

##### 参数说明

- {String} number: 接收验证码的手机号码。
- {String} code: 接收到的短信(或语音)验证码。

##### 示例

```javascript
JSMS.checkVerificationCode({
  number: '136********', 
  code: '输入收到的验证码'
}, () => {}, (error) => {})
```

### setMinimumTimeInterval

设置获取验证码的时间间隔 （有效间隔 0~3600s），在设置间隔时间内只能发送一次获取验证码的请求，SDK 默认是 30s。

##### 参数说明

- {number} seconds: 时间间隔，单位：秒。

##### 示例

```javascript
JSMSModule.setMinimumTimeInterval(30);
```




