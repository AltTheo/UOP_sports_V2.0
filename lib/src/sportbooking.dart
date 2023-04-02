import 'package:json_annotation/json_annotation.dart';
import 'package:sport_test/util/app_util.dart';

@JsonSerializable()
class SportBooking {
  final String userId;
  final String userName;
  final String placeId;
  final String serviceName;
  final int serviceDuration;
  final int servicePrice;

  @JsonKey(
      fromJson: AppUtil.timeStampToDateTime,
      toJson: AppUtil.dateTimeToTimeStamp)
  final DateTime bookingStart;

  @JsonKey(
      fromJson: AppUtil.timeStampToDateTime,
      toJson: AppUtil.dateTimeToTimeStamp)
  final DateTime bookingEnd;

  final String email;
  final String phoneNumber;
  final String placeAddress;

  SportBooking({
    required this.userId,
    required this.userName,
    required this.placeId,
    required this.serviceName,
    required this.serviceDuration,
    required this.servicePrice,
    required this.bookingStart,
    required this.bookingEnd,
    required this.email,
    required this.phoneNumber,
    required this.placeAddress,
  });
}
