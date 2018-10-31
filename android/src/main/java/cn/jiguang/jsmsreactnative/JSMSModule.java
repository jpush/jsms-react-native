package cn.jiguang.jsmsreactnative;

import cn.jpush.sms.SMSSDK;
import cn.jpush.sms.listener.SmscheckListener;
import cn.jpush.sms.listener.SmscodeListener;

import android.util.Log;
import android.util.SparseArray;
import android.widget.Toast;

import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.LifecycleEventListener;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.ReadableArray;
import com.facebook.react.bridge.ReadableMap;
import com.facebook.react.bridge.WritableArray;
import com.facebook.react.bridge.WritableMap;

import java.util.HashMap;
import java.util.List;


public class JSMSModule extends ReactContextBaseJavaModule{

    private static final String JSMS_NAME = "JSMSModule";

    public JSMSModule (ReactApplicationContext reactContext) {

        super(reactContext);

    }

    @Override
    public void initialize() {
        super.initialize();
    }

    @Override
    public String getName() {

        return JSMS_NAME;
    }

    @Override
    public void onCatalystInstanceDestroy() {
        super.onCatalystInstanceDestroy();
    }

    @ReactMethod
    public void setup(String message) {
        SMSSDK.getInstance().setDebugMode(true);
        SMSSDK.getInstance().initSdk(getReactApplicationContext());
    }

    @ReactMethod
    public void getVerificationCode(ReadableMap map, final Callback success, final Callback fail) {
        String phoneNumber = map.getString("number");
        String templateId = map.getString("templateId");

        SMSSDK.getInstance().getSmsCodeAsyn(phoneNumber, templateId, new SmscodeListener() {
            @Override
            public void getCodeSuccess(final String uuid) {
                success.invoke();
            }

            @Override
            public void getCodeFail(int errCode, final String errmsg) {
                fail.invoke();
            }
        });
    }

    @ReactMethod
    public void getVoiceVerificationCode(ReadableMap map, final Callback success, final Callback fail) {
        String phoneNumber = map.getString("number");
        String language = map.getString("language");
        int languageOptions = 0;
        if (language.equals("zh")) {
            // 中文
            languageOptions = 0;
        } else {
            // 英文
            languageOptions = 1;
        }
        SMSSDK.getInstance().getVoiceCodeAsyn(phoneNumber, languageOptions ,new SmscodeListener() {
            @Override
            public void getCodeSuccess(final String uuid) {
                success.invoke();
            }

            @Override
            public void getCodeFail(int errCode, final String errmsg) {
                fail.invoke();
            }
        });
    }

    @ReactMethod
    public void checkVerificationCode(ReadableMap map, final Callback success, final Callback fail) {
        String phoneNumber = map.getString("number");
        String code = map.getString("code");

        SMSSDK.getInstance().checkSmsCodeAsyn(phoneNumber, code, new SmscheckListener() {
            @Override
            public void checkCodeSuccess(final String code) {
                // 验证码验证成功，code 为验证码信息。
                success.invoke();
            }

            @Override
            public void checkCodeFail(int errCode, final String errMsg) {
                // 验证码验证失败, errCode 为错误码，详情请见文档后面的错误码表；errMsg 为错误描述。
                success.invoke();
            }
        });
    }

    @ReactMethod
    public void setMinimumTimeInterval(int interval) {
        SMSSDK.getInstance().setIntervalTime(interval * 1000);
    }




}