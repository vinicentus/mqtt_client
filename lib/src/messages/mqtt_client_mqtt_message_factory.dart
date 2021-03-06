/*
 * Package : mqtt_client
 * Author : S. Hamblett <steve.hamblett@linux.com>
 * Date   : 15/06/2017
 * Copyright :  S.Hamblett
 */

part of mqtt_client;

/// Factory for generating instances of MQTT Messages
class MqttMessageFactory {
  /// Gets an instance of an MqttMessage based on the message type requested.
  static MqttMessage getMessage(MqttHeader header,
      MqttByteBuffer messageStream) {
    MqttMessage message;
    switch (header.messageType) {
      case MqttMessageType.connect:
        message = new MqttConnectMessage.fromByteBuffer(header, messageStream);
        break;
      case MqttMessageType.connectAck:
        message =
        new MqttConnectAckMessage.fromByteBuffer(header, messageStream);
        break;
      case MqttMessageType.publish:
        message = new MqttPublishMessage.fromByteBuffer(header, messageStream);
        break;
      case MqttMessageType.publishAck:
        message =
        new MqttPublishAckMessage.fromByteBuffer(header, messageStream);
        break;
      case MqttMessageType.publishComplete:
        message =
        new MqttPublishCompleteMessage.fromByteBuffer(header, messageStream);
        break;
      case MqttMessageType.publishReceived:
        message =
        new MqttPublishReceivedMessage.fromByteBuffer(header, messageStream);
        break;
      case MqttMessageType.publishRelease:
        message =
        new MqttPublishReleaseMessage.fromByteBuffer(header, messageStream);
        break;
      case MqttMessageType.subscribe:
        message =
        new MqttSubscribeMessage.fromByteBuffer(header, messageStream);
        break;
      case MqttMessageType.subscribeAck:
        message =
        new MqttSubscribeAckMessage.fromByteBuffer(header, messageStream);
        break;
      case MqttMessageType.unsubscribe:
        message =
        new MqttUnsubscribeMessage.fromByteBuffer(header, messageStream);
        break;
      case MqttMessageType.unsubscribeAck:
        message =
        new MqttUnsubscribeAckMessage.fromByteBuffer(header, messageStream);
        break;
      case MqttMessageType.pingRequest:
        message = new MqttPingRequestMessage.fromHeader(header);
        break;
      case MqttMessageType.pingResponse:
        message = new MqttPingResponseMessage.fromHeader(header);
        break;
      case MqttMessageType.disconnect:
        message = new MqttDisconnectMessage.fromHeader(header);
        break;
      default:
        throw new InvalidHeaderException(
            "The Message Type specified ($header.messageType) is not a valid "
                "MQTT Message type or currently not supported.");
    }
    return message;
  }
}
