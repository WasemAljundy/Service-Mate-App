class ApiSettings {

  static const _baseUrl = 'https://service-mate.mr-dev.tech/';
  // static const _baseUrl = 'https://10.0.2.2:8000/';


  static const _apiUrl = '${_baseUrl}api/';
  static const register = '${_apiUrl}auth/client/register';
  static const login = '${_apiUrl}auth/client/login';
  static const logout = '${_apiUrl}auth/client/logout';
  static const forgotPassword = '${_apiUrl}auth/client/forgot-password';
  static const resetPassword = '${_apiUrl}auth/client/reset-password';
  static const changePassword = '${_apiUrl}auth/client/change-password';

  static const categories = '${_apiUrl}categories';
  static const String experiences = "${_apiUrl}experiences";
  static const String clients = "${_apiUrl}clients/{id}";

  static const String articels = "${_apiUrl}articles/{id}";
  static const String services = "${_apiUrl}services/{id}";
  static const String specialists = "${_apiUrl}specialists/{id}";
  static const String workTimes = "${_apiUrl}work_times/{id}";
  static const String faqs = "${_apiUrl}faqs/{id}";
  static const String attachments = "${_apiUrl}attachments/{id}";
  static const String attachmentTypes = "${_apiUrl}attachment_types/{id}";
  static const String reservations = "${_apiUrl}reservations";
  static const String contactUs = "https://10.0.2.2:8000/api/contact_us_requests";
  static const String address = "${_apiUrl}addresses/{id}";
}