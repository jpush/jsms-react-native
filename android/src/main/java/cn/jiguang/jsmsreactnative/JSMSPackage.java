package cn.jiguang.jsmsreactnative;

import android.util.Log;

import com.facebook.react.ReactPackage;
import com.facebook.react.bridge.JavaScriptModule;
import com.facebook.react.bridge.NativeModule;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.uimanager.ViewManager;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;


public class JSMSPackage implements ReactPackage {

    @Override
    public List<NativeModule> createNativeModules(ReactApplicationContext reactContext) {
        List<NativeModule> modules = new ArrayList<>();

        modules.add(new JSMSModule(reactContext));
        Log.d("jsms" , "createNativeModules");
        return modules;
//        return Arrays.asList(new NativeModule[]{
//                new JSMSModule(reactContext),
//        });
    }

    @Override
    public List<ViewManager> createViewManagers(ReactApplicationContext reactContext) {
        return Collections.emptyList();
    }

    public List<Class<? extends JavaScriptModule>> createJSModules() {
        return Collections.emptyList();
    }
}

//public class JSMSPackage extends ReactPackage {
//
//    @Override
//    public List<NativeModule> createNativeModules(ReactApplicationContext reactContext) {
//        return Arrays.asList(new NativeModule[]{
//                new JSMSModule(reactContext)
//        });
//    }
//
//    public List<Class<? extends JavaScriptModule>> createJSModules() {
//        return Collections.emptyList();
//    }
//
//    @Override
//    public List<ViewManager> createViewManagers(ReactApplicationContext reactContext) {
//        return Collections.emptyList();
//    }
//}
