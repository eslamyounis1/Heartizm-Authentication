// To parse this JSON data, do
//
//     final ecg = ecgFromJson(jsonString);

import 'dart:convert';

Ecg ecgFromJson(String str) => Ecg.fromJson(json.decode(str));

String ecgToJson(Ecg data) => json.encode(data.toJson());

class Ecg {
  List<EcgReading> ecgReadings;

  Ecg({
    required this.ecgReadings,
  });

  factory Ecg.fromJson(Map<String, dynamic> json) => Ecg(
        ecgReadings: List<EcgReading>.from(
            json["ecgReadings"].map((x) => EcgReading.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ecgReadings": List<dynamic>.from(ecgReadings.map((x) => x.toJson())),
      };
}

class EcgReading {
  DateTime startTime;
  int averageHeartRate;
  String resultClassification;
  List<int> waveformSamples;
  int samplingFrequencyHz;
  int scalingFactor;
  int numberOfWaveformSamples;
  int leadNumber;
  String featureVersion;
  String deviceName;
  String firmwareVersion;

  EcgReading({
    required this.startTime,
    required this.averageHeartRate,
    required this.resultClassification,
    required this.waveformSamples,
    required this.samplingFrequencyHz,
    required this.scalingFactor,
    required this.numberOfWaveformSamples,
    required this.leadNumber,
    required this.featureVersion,
    required this.deviceName,
    required this.firmwareVersion,
  });

  factory EcgReading.fromJson(Map<String, dynamic> json) => EcgReading(
        startTime: DateTime.parse(json["startTime"]),
        averageHeartRate: json["averageHeartRate"],
        resultClassification: json["resultClassification"] ?? "",
        waveformSamples: List<int>.from(json["waveformSamples"].map((x) => x)),
        samplingFrequencyHz: json["samplingFrequencyHz"],
        scalingFactor: json["scalingFactor"],
        numberOfWaveformSamples: json["numberOfWaveformSamples"],
        leadNumber: json["leadNumber"],
        featureVersion: json["featureVersion"] ?? "",
        deviceName: json["deviceName"] ?? "",
        firmwareVersion: json["firmwareVersion"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "startTime": startTime.toIso8601String(),
        "averageHeartRate": averageHeartRate,
        "resultClassification": resultClassification,
        "waveformSamples": List<dynamic>.from(waveformSamples.map((x) => x)),
        "samplingFrequencyHz": samplingFrequencyHz,
        "scalingFactor": scalingFactor,
        "numberOfWaveformSamples": numberOfWaveformSamples,
        "leadNumber": leadNumber,
        "featureVersion": featureVersion,
        "deviceName": deviceName,
        "firmwareVersion": firmwareVersion,
      };
}
