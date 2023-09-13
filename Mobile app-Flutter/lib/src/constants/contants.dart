import 'package:ecg_auth_app_heartizm/src/features/authentication/models/ecg.dart';

class Constants {
  Constants._();
  static EcgReading emptyECG = EcgReading(
      averageHeartRate: 0,
      deviceName: '',
      featureVersion: '',
      firmwareVersion: '',
      leadNumber: 0,
      numberOfWaveformSamples: 0,
      resultClassification: '',
      samplingFrequencyHz: 0,
      scalingFactor: 0,
      startTime: DateTime.now(),
      waveformSamples: []);
}
