package com.xiaofeng07.flutter_douyin

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.BasicMessageChannel
import io.flutter.plugin.common.StringCodec
import kotlinx.coroutines.delay
import kotlin.coroutines.coroutineContext

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        val channel = BasicMessageChannel(
            flutterEngine.dartExecutor.binaryMessenger, "messageChannel",
            StringCodec.INSTANCE
        )

        channel.setMessageHandler { message, reply ->
            println("receive message: $message")

            reply.reply("ACK from Android")

        }

        channel.send("Hello From Android")
    }
}
