
class ApiSettings {

  static const _baseUrl = 'https://service-mate.mr-dev.tech/';
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

  static const String articels = "${_baseUrl}articels/{id}";
  static const String services = "${_baseUrl}services/{id}";
  static const String specialists = "${_baseUrl}specialists/{id}";
  static const String workTimes = "${_baseUrl}work_times/{id}";
  static const String faqs = "${_baseUrl}faqs/{id}";
  static const String attachments = "${_baseUrl}attachments/{id}";
  static const String attachmentTypes = "${_baseUrl}attachment_types/{id}";
}