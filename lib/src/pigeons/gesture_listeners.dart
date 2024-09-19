// Autogenerated from Pigeon (v18.0.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import, no_leading_underscores_for_local_identifiers

part of mapbox_maps_flutter;

/// Enumeration of gesture states.
enum GestureState {
  /// Gesture has started.
  started,

  /// Gesture is in progress.
  changed,

  /// Gesture has ended.
  ended,
}

/// A structure that defines additional information about map content gesture.
class MapContentGestureContext {
  MapContentGestureContext({
    required this.touchPosition,
    required this.point,
    required this.gestureState,
  });

  /// The location of gesture in Map view bounds.
  ScreenCoordinate touchPosition;

  /// Geographical coordinate of the map gesture.
  Point point;

  /// The state of the gesture.
  GestureState gestureState;

  Object encode() {
    return <Object?>[
      touchPosition,
      point,
      gestureState,
    ];
  }

  static MapContentGestureContext decode(Object result) {
    result as List<Object?>;
    return MapContentGestureContext(
      touchPosition: result[0]! as ScreenCoordinate,
      point: result[1]! as Point,
      gestureState: result[2]! as GestureState,
    );
  }
}

class _GestureListenerCodec extends StandardMessageCodec {
  const _GestureListenerCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is MapContentGestureContext) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is Point) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else if (value is ScreenCoordinate) {
      buffer.putUint8(130);
      writeValue(buffer, value.encode());
    } else if (value is MapContentGestureContext) {
      buffer.putUint8(131);
      writeValue(buffer, value.encode());
    } else if (value is GestureState) {
      buffer.putUint8(132);
      writeValue(buffer, value.index);
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128:
        return MapContentGestureContext.decode(readValue(buffer)!);
      case 129:
        return Point.decode(readValue(buffer)!);
      case 130:
        return ScreenCoordinate.decode(readValue(buffer)!);
      case 131:
        return MapContentGestureContext.decode(readValue(buffer)!);
      case 132:
        final int? value = readValue(buffer) as int?;
        return value == null ? null : GestureState.values[value];
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

abstract class GestureListener {
  static const MessageCodec<Object?> pigeonChannelCodec =
      _GestureListenerCodec();

  void onTap(MapContentGestureContext context);

  void onLongTap(MapContentGestureContext context);

  void onScroll(MapContentGestureContext context);

  static void setUp(
    GestureListener? api, {
    BinaryMessenger? binaryMessenger,
    String messageChannelSuffix = '',
  }) {
    messageChannelSuffix =
        messageChannelSuffix.isNotEmpty ? '.$messageChannelSuffix' : '';
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<
              Object?>(
          'dev.flutter.pigeon.mapbox_maps_flutter.GestureListener.onTap$messageChannelSuffix',
          pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        __pigeon_channel.setMessageHandler(null);
      } else {
        __pigeon_channel.setMessageHandler((Object? message) async {
          assert(message != null,
              'Argument for dev.flutter.pigeon.mapbox_maps_flutter.GestureListener.onTap was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final MapContentGestureContext? arg_context =
              (args[0] as MapContentGestureContext?);
          assert(arg_context != null,
              'Argument for dev.flutter.pigeon.mapbox_maps_flutter.GestureListener.onTap was null, expected non-null MapContentGestureContext.');
          try {
            api.onTap(arg_context!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          } catch (e) {
            return wrapResponse(
                error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<
              Object?>(
          'dev.flutter.pigeon.mapbox_maps_flutter.GestureListener.onLongTap$messageChannelSuffix',
          pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        __pigeon_channel.setMessageHandler(null);
      } else {
        __pigeon_channel.setMessageHandler((Object? message) async {
          assert(message != null,
              'Argument for dev.flutter.pigeon.mapbox_maps_flutter.GestureListener.onLongTap was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final MapContentGestureContext? arg_context =
              (args[0] as MapContentGestureContext?);
          assert(arg_context != null,
              'Argument for dev.flutter.pigeon.mapbox_maps_flutter.GestureListener.onLongTap was null, expected non-null MapContentGestureContext.');
          try {
            api.onLongTap(arg_context!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          } catch (e) {
            return wrapResponse(
                error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> __pigeon_channel = BasicMessageChannel<
              Object?>(
          'dev.flutter.pigeon.mapbox_maps_flutter.GestureListener.onScroll$messageChannelSuffix',
          pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        __pigeon_channel.setMessageHandler(null);
      } else {
        __pigeon_channel.setMessageHandler((Object? message) async {
          assert(message != null,
              'Argument for dev.flutter.pigeon.mapbox_maps_flutter.GestureListener.onScroll was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final MapContentGestureContext? arg_context =
              (args[0] as MapContentGestureContext?);
          assert(arg_context != null,
              'Argument for dev.flutter.pigeon.mapbox_maps_flutter.GestureListener.onScroll was null, expected non-null MapContentGestureContext.');
          try {
            api.onScroll(arg_context!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          } catch (e) {
            return wrapResponse(
                error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
  }
}
