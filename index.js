import { 
    DeviceEventEmitter, 
    NativeModules,
    Platform
   } from 'react-native'

const JSMSModule = NativeModules.JSMSModule


    /**
     * 获取当前连接状态
     * @param {Fucntion} cb = (Boolean) => {}
     * 如果连接状态变更为已连接返回 true
     * 如果连接状态变更为断开连接连接返回 false
     */
export default class JSMS {
    /**
     * 初始化 JSMS 插件
     * @param {string} appKey 
     */
    static init(appKey) {
        JPush.setup(appKey)
      }

    /**
     * 获取验证码
     * @param {Object} params = { 
     *  number: string, // 电话号码
     *  templateID: string // 短信模板 ID
     * }
     * @param {Function} success = (result) => {}
     * @param {Function} fail = (error) => {}
     */
    static getVerificationCode(params, success, fail) {
        JPush.getVerificationCode(params, success, fail);
    }

    /**
     * 获取语言验证码
     * @param {Object} params = {
     *  number: string,  // 电话号码
     *  options: 'zh' | 'en' // 语言选项 'zh' 为中文，'en' 为英文，默认为 'zh'。
     * }
     * @param {Function} success = (result) => {}
     * @param {Function} fail = (error) => {}
     */
    static getVoiceVerificationCode(params, success, fail) {
        JPush.getVoiceVerificationCode(params, success, fail);
    }

    /**
     * 检查验证码是否正确。
     * @param {*} params = {
     *  number: string, // 电话号码
     *  code: string, // 要检查的验证码
     * }
     * @param {Function} success = (result) => {}
     * @param {Function} fail = (error) => {}
     */
    static checkVerificationCode(params, success, fail) {
        JPush.checkVerificationCode(params, success, fail);
    }

    /**
     * 设置获取验证码的时间间隔 （有效间隔 0~3600s）
     * @param {number} seconds 
     */
    static setMinimumTimeInterval(seconds) {
        JPush.setMinimumTimeInterval(seconds);
    }
}