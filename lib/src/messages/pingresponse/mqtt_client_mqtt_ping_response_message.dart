/*
 * Package : mqtt_client
 * Author : S. Hamblett <steve.hamblett@linux.com>
 * Date   : 19/06/2017
 * Copyright :  S.Hamblett
 */

part of mqtt_client;

/// Implementation of an MQTT ping Request Message.
class MqttPingResponseMessage extends MqttMessage {
  /// Initializes a new instance of the MqttPingResponseMessage class.
  MqttPingResponseMessage() {
    this.header = new MqttHeader().asType(MqttMessageType.pingResponse);
  }

  /// Initializes a new instance of the MqttPingResponseMessage class.
  MqttPingResponseMessage.fromHeader(MqttHeader header) {
    this.header = header;
  }

  String toString() {
    final StringBuffer sb = new StringBuffer();
    sb.write(super.toString());
    return sb.toString();
  }
}
