package com.example.weather_ffi

import io.flutter.embedding.android.FlutterActivity
import go_lib.DataProcessor
import android.os.Bundle
import io.flutter.plugins.GeneratedPluginRegistrant;
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
  var goNativeDataProcessor:DataProcessor  = DataProcessor();
  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)
      MethodChannel(flutterEngine.dartExecutor.binaryMessenger,"tzzChannel").setMethodCallHandler {
        call, result -> 
          print("call from kotlin")
          val data:Integer? = call.argument<Integer>("data")
          if (data != null){
            result.success(goNativeDataProcessor.increment(data.toLong()))
          }else{
            result.error("UNAVAILABLE", "Battery level not available.", null)
          }
        
      }
  }
}
