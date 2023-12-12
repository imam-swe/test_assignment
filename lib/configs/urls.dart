/*
Company application details controller
@Author Soton Ahmed <soton.m360ict@gmail.com>
Start Date: 02-11-2023
Last Update: 12-11-2023
*/


class AppUrls{
  static const baseUrl = "https://server.babservices.online/api/v1";
  static const login = "$baseUrl/auth/member/login";
  static const sendEmailOtp = "$baseUrl/common/send-email-otp";
  static const matchEmailOtp = "$baseUrl/common/match-email-otp";
  static const changePassword = "$baseUrl/auth/member/change-password";
  static const forgetPassword = "$baseUrl/auth/member/forget-password";
  static const due = "$baseUrl/member/due";
  static const memberField = "$baseUrl/member/member-field";
  static const notice = "$baseUrl/member/notice";
  static const bankInfo = "$baseUrl/member/bank-info";
  static const committee = "$baseUrl/member/committee";
  static const certificate = "$baseUrl/member/certificate";
  static const invoice = "$baseUrl/member/invoice";
  static const recentTraining = "$baseUrl/member/training?status=upcoming";
  static const training = "$baseUrl/member/training";
  static const trainee = "$baseUrl/member/training/trainee-request";


  static const fileUrl = "https://m360ict.s3.ap-south-1.amazonaws.com/bab-storage";
}