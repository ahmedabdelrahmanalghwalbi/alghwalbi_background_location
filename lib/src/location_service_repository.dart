part of '../alghwalbi_background_location.dart';

class LocationServiceRepository {
  static const String isolateName = 'LocatorIsolate';
  static final LocationServiceRepository _instance =
      LocationServiceRepository._();
  LocationServiceRepository._();
  factory LocationServiceRepository() => _instance;

  Future<void> init(Map<dynamic, dynamic> params) async =>
      IsolateNameServer.lookupPortByName(isolateName)?.send(null);

  Future<void> dispose() async =>
      IsolateNameServer.lookupPortByName(isolateName)?.send(null);

  Future<void> callback(LocationDto locationDto) async =>
      IsolateNameServer.lookupPortByName(
        isolateName,
      )?.send(locationDto.toJson());
}
