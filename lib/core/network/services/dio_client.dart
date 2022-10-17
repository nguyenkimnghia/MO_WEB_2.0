import 'dart:collection';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:moffice_web/constants/constants.exports.dart';
import 'package:moffice_web/core/network/exceptions/exceptions.exports.dart';
import 'package:moffice_web/core/network/models/model.export.dart';
import 'package:moffice_web/core/security/security.exports.dart';
import 'package:moffice_web/helpers/store/store.exports.dart';
import 'package:moffice_web/helpers/user/user.exports.dart';
import 'package:moffice_web/ui/widget/toast_common/toast_utils.exports.dart';

class DioClient {
  late final Dio _dio;
  late final BaseOptions options;
  final Map<String, CancelToken> listCancelToken = HashMap();

  DioClient() {
    options = BaseOptions(
        baseUrl: EnvConstants.getEnvValue(Config.baseUrlAuthen),
        connectTimeout: Config.connectTimeout,
        receiveTimeout: Config.receiveTimeout,
        headers: <String, String>{
          "Content-Type": "application/json;charset=UTF-8",
        },
        responseType: ResponseType.json);
    _dio = Dio(options);
    _dio.interceptors.add(InterceptorsWrapper(onRequest:
        (RequestOptions options, RequestInterceptorHandler handler) async {
      final cancelToken = CancelToken();
      listCancelToken[options.path] = cancelToken;
      // add public key
      BodyCommonParams bodyCommonParams = BodyCommonParams();
      bodyCommonParams = BodyCommonParams(strPublicKey: StorageCached.localStorage.getString(StorageCached.serverPublicKey));
      options.headers['Authorization'] = 'Bearer ${StorageCached.localStorage.getString(StorageCached.accessToken)}';

      if (options.data != null) {
        if (options.data is BodyCommonParams) {
          bodyCommonParams = (options.data as BodyCommonParams)
              .copyWith(strPublicKey: bodyCommonParams.strPublicKey);
        }
      }
      options = options.copyWith(
          cancelToken: cancelToken,
          data: bodyCommonParams.toJson(),
          baseUrl: ApiConst.getEndPointService(options.path));
      handler.next(options);
    }, onResponse: (Response response, ResponseInterceptorHandler handler) {
      if (response.requestOptions.responseType == ResponseType.json) {
        response.data = ResponseCommon.fromJson(response.toString());
      }
      handler.next(response);
    }, onError: (DioError dioError, ErrorInterceptorHandler handler) {
      cleanError(dioError);
      handleException(dioError, handler);
    }));
  }

  Future<Response> download(String uri, String path, String fileName,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      Function(int, int)? callback}) async {
    Response res = await _dio.download(uri, "$path/$fileName",
        data: data,
        queryParameters: queryParameters,
        options: Options(method: 'POST', responseType: ResponseType.bytes),
        onReceiveProgress: (received, total) {
      callback!(received, total);
    });
    return res;
  }

  void cleanResponse(Response response) {
    cleanCancelToken(response.requestOptions.path);
  }

  void cleanError(DioError e) {
    cleanCancelToken(e.requestOptions.path);
  }

  void cleanCancelToken(String key) {
    if (listCancelToken.containsKey(key)) {
      listCancelToken.removeWhere((_key, _value) => _key == key);
    }
  }

  void stopRequest(String key) {
    if (listCancelToken.containsKey(key)) {
      listCancelToken[key]!.cancel('Cancel request $key');
    }
  }

  void stopAllRequest() {
    listCancelToken.forEach((String key, CancelToken value) {
      stopRequest(key);
    });
  }

  Future<dynamic> handleException(
      DioError e, ErrorInterceptorHandler handler) async {
    e.message;
    switch (e.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.receiveTimeout:
      case DioErrorType.sendTimeout:
        RequestException ex = RequestException(
            message: e.message, dioE: e, code: ExceptionCode.requestConnect);
        handler.next(ex);
        break;
      case DioErrorType.other:
        if (e.error is SocketException) {
          RequestException ex = RequestException(
              message: e.message,
              dioE: e,
              code: ExceptionCode.requestNoInternet);
          handler.next(ex);
          break;
        }
        RequestException ex = RequestException(
            message: e.message, dioE: e, code: ExceptionCode.requestUnknow);
        handler.next(ex);
        break;
      case DioErrorType.response:
        if (e.response?.statusCode == 403 || e.response?.statusCode == 401) {
          UserHelper.logoutMO();
          ToastUtils.showToastError('Phiên đăng nhập hết hạn');
        }
        RequestException ex = RequestException(
            message: e.message,
            dioE: e,
            code: ExceptionCode.requestErrorResponse);
        handler.next(ex);
        break;
      case DioErrorType.cancel:
        break;
      default:
        RequestException ex = RequestException(
            message: e.message, dioE: e, code: ExceptionCode.requestUnknow);
        handler.next(ex);
        break;
    }
  }

  Future<ResponseCommon> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    final Response<ResponseCommon> response =
        await _dio.get(uri, queryParameters: queryParameters, options: options);
    return _handleResponse(response, uri);
  }

  Future<ResponseCommon> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    final Response<ResponseCommon> response = await _dio.post(uri,
        data: data, queryParameters: queryParameters, options: options);
    return _handleResponse(response, uri);
  }

  // Put:-----------------------------------------------------------------------
  Future<ResponseCommon> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    final Response<ResponseCommon> response = await _dio.put(uri,
        data: data, queryParameters: queryParameters, options: options);
    return _handleResponse(response, uri);
  }

  // Delete:--------------------------------------------------------------------
  Future<ResponseCommon> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    final Response<ResponseCommon> response = await _dio.delete(uri,
        data: data, queryParameters: queryParameters, options: options);
    return _handleResponse(response, uri);
  }

  ResponseCommon _handleResponse(
      Response<ResponseCommon> response, String url) {
    if (response.data!.isSecurity) {
      String dataEncrpty = response.data!.data;
      response.data!.data = RequestHelper.decryptResponse(dataEncrpty);
    }
    return response.data!;
  }
}
