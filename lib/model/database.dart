// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:json_annotation/json_annotation.dart';
// import 'package:sport.bp/util/app_util.dart';
// part 'sport_booking.g.dart';

// @JsonSerializable(explicitToJson: true)
// class SportBooking {
//   /// The generated code assumes these values exist in JSON.
//   final String? userId;
//   final String? userName;
//   final String? placeId;
//   final String? serviceName;
//   final int? serviceDuration;
//   final int? servicePrice;

//   //Because we are storing timestamp in Firestore, we need a converter for DateTime
//   static DateTime timeStampToDateTime(Timestamp timestamp) {
//     return DateTime.parse(timestamp.toDate().toString());
//   }

//   static Timestamp dateTimeToTimeStamp(DateTime? dateTime) {
//     return Timestamp.fromDate(dateTime ?? DateTime.now()); //To TimeStamp
//   }

//   @JsonKey(fromJson: AppUtil.timeStampToDateTime, toJson: AppUtil.dateTimeToTimeStamp)
//   final DateTime? bookingStart;
//   @JsonKey(fromJson: AppUtil.timeStampToDateTime, toJson: AppUtil.dateTimeToTimeStamp)
//   final DateTime? bookingEnd;
//   final String? email;
//   final String? phoneNumber;
//   final String? placeAddress;

//   SportBooking(
//       {this.email,
//       this.phoneNumber,
//       this.bookingStart,
//       this.bookingEnd,
//       this.placeId,
//       this.userId,
//       this.userName,
//       this.serviceName,
//       this.serviceDuration,
//       this.servicePrice});

//   /// Connect the generated [_$SportBookingFromJson] function to the `fromJson`
//   /// factory.
//   factory SportBooking.fromJson(Map<String, dynamic> json) => _$SportBookingFromJson(json);

//   /// Connect the generated [_$SportBookingToJson] function to the `toJson` method.
//   Map<String, dynamic> toJson() => _$SportBookingToJson(this);
// }