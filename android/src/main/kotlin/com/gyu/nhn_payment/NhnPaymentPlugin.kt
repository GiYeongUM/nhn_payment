package com.gyu.nhn_payment

import android.app.Activity
import android.content.Intent
import android.net.Uri
import android.util.Log
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** NhnPaymentPlugin */
class NhnPaymentPlugin: FlutterPlugin, MethodCallHandler, ActivityAware {

  private lateinit var channel : MethodChannel
  private lateinit var activity : Activity

  override fun onAttachedToActivity(@NonNull binding: ActivityPluginBinding) {
    this.activity = binding.activity
  }

  override fun onDetachedFromActivityForConfigChanges() {
    onDetachedFromActivity()
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    onAttachedToActivity(binding)
  }


  override fun onDetachedFromActivity() {
    activity = Activity()
  }

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "nhn_payment")
    channel.setMethodCallHandler { call, result ->
      when (call.method) {
        "intent" -> intentCall(call, result)
      }
    }
  }



  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    when (call.method) {
      "intent" -> {
        intentCall(call, result)
      }
      "getPlatformVersion" -> result.success("Android ${android.os.Build.VERSION.RELEASE}")
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  private fun intentCall(call: MethodCall, result: MethodChannel.Result) {
    val url: String = call.argument("url") ?: return

    try {
      val intent: Intent = Intent.parseUri(url, Intent.URI_INTENT_SCHEME)
      val existPackage = activity.packageManager.getLaunchIntentForPackage(intent.`package`.toString())
      if (existPackage != null) {
        activity.startActivity(intent)
      } else {
        val marketIntent = Intent(Intent.ACTION_VIEW)
        marketIntent.data = Uri.parse("market://details?id=" + intent.`package`)
        activity.startActivity(marketIntent)
      }
    } catch (e: Exception) {
      Log.e("error", e.printStackTrace().toString())
    }
  }
}
