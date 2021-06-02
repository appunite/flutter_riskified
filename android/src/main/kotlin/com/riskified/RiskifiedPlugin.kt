package com.riskified

import android.content.Context
import androidx.annotation.NonNull
import com.riskified.android_sdk.RiskifiedBeaconMain
import com.riskified.android_sdk.RiskifiedBeaconMainInterface
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

class RiskifiedPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {

  private lateinit var context: Context
  private lateinit var channel : MethodChannel
  private lateinit var xXBeacon: RiskifiedBeaconMainInterface

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "riskified")
    channel.setMethodCallHandler(this)

    context = flutterPluginBinding.applicationContext
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "startBeacon") {
      val shop = call.argument<String>("shop")
      val token = call.argument<String>("token")
      
      xXBeacon = RiskifiedBeaconMain()
      xXBeacon.startBeacon(shop, token, false, context)
      
      result.success(token)
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
    xXBeacon.removeLocationUpdates()
  }

  override fun onDetachedFromActivity() {}

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {}

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {}

  override fun onDetachedFromActivityForConfigChanges() {}
}
