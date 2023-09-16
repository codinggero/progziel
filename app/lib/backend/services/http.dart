import '/package.dart';
import 'package:path/path.dart';

class Json {
  int code;
  String message;
  dynamic data;
  dynamic error;

  Json({
    this.code = 500,
    this.message = "Something we'nt Wrong!",
    this.data,
    this.error,
  });

  factory Json.response(
    Response<dynamic> response, {
    required String path,
    required String method,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
  }) {
    int code = response.statusCode ?? 500;
    String message = response.statusText ?? "Something we'nt Wrong!";
    dynamic data = response.body;

    // Informational responses (100 – 199)
    if (code >= 100 && code <= 199) {
      message = message;
      data = data['data'];
    }
    // Successful responses (200 – 299)
    if (code >= 200 && code <= 299) {
      message = data['message'];
      data = data['data'];
    }
    // Redirection messages (300 – 399)
    if (code >= 300 && code <= 399) {
      message = data['message'];
      data = data['data'];
    }
    // Client error responses (400 – 499)
    if (code >= 400 && code <= 499) {
      message = data['message'];
      data = data['data'];
    }
    // Server error responses (500 – 599)
    if (code >= 500 && code <= 599) {
      message = data['message'];
      data = data['data'];
    }

    console.log({
      'method': method,
      'path': path,
      'query': query,
      'body': body,
      'code': code,
      'data': data,
    });

    return Json(
      code: code,
      message: message,
      data: data,
    );
  }

  factory Json.timeout(
    int seconds, {
    required String path,
    required String method,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
  }) {
    console.log({
      'path': path,
      'query': query,
      'body': body,
      'timeout': seconds,
    });

    return Json(
      message: "Request Timeout: $seconds seconds",
    );
  }

  factory Json.error(
    error,
    stackTrace, {
    required String path,
    required String method,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
  }) {
    console.log({
      'path': path,
      'query': query,
      'body': body,
      'error': error,
    });

    return Json(
      error: error,
    );
  }
}

class Https extends GetConnect {
  static Duration duration = const Duration(seconds: 5);
  static String contentType = 'application/json';
  static String ip = "192.168.10.11";
  static String port = "8000";

  Https() {
    super.timeout = duration;
    super.baseUrl = 'http://$ip:$port/api';
  }

  Map<String, String> get headers => {
        "Keep-Alive": "timeout=30, max=1000",
        "Content-Type": contentType,
        "Authorization": "Bearer ${api.token ?? ''}",
      };

  Future<Json> getx(
    String path, {
    Map<String, dynamic>? query,
  }) {
    return get(
      path,
      query: query,
      headers: headers,
    ).then((response) {
      return Json.response(response, method: 'GET', path: path, query: query);
    }).timeout(duration, onTimeout: () {
      return Json.timeout(duration.inSeconds,
          method: 'GET', path: path, query: query);
    }).onError((error, stackTrace) {
      return Json.error(error, stackTrace,
          method: 'GET', path: path, query: query);
    });
  }

  Future<Json> postx(
    String path, {
    bool isFormData = false,
    Map<String, dynamic> query = const {},
    Map<String, dynamic> body = const {},
    dynamic Function(double)? progress,
  }) {
    if (isFormData) {
      contentType = 'application/x-www-form-urlencoded';
      Map<String, dynamic> map = {};
      body.forEach((key, value) {
        if (value.runtimeType.toString() == '_File') {
          map.addAll(
            {
              key: MultipartFile(
                value,
                filename: basename(value.path),
              ),
            },
          );
        } else {
          map.addAll(
            {key: value},
          );
        }
      });

      return post(
        path,
        query: query,
        FormData(map),
        headers: headers,
        contentType: contentType,
        uploadProgress: progress,
      ).then((response) {
        return Json.response(response,
            method: 'POST', path: path, query: query, body: body);
      }).timeout(duration, onTimeout: () {
        return Json.timeout(duration.inSeconds,
            method: 'POST', path: path, query: query, body: body);
      }).onError((error, stackTrace) {
        return Json.error(error, stackTrace,
            method: 'POST', path: path, query: query, body: body);
      });
    } else {
      return post(
        path,
        body,
        query: query,
        headers: headers,
        contentType: contentType,
        uploadProgress: progress,
      ).then((response) {
        return Json.response(response,
            method: 'POST', path: path, query: query, body: body);
      }).timeout(duration, onTimeout: () {
        return Json.timeout(duration.inSeconds,
            method: 'POST', path: path, query: query, body: body);
      }).onError((error, stackTrace) {
        return Json.error(error, stackTrace,
            method: 'POST', path: path, query: query, body: body);
      });
    }
  }

  GetSocket socketx(String path, {Duration ping = const Duration(seconds: 5)}) {
    return socket('http://$ip', ping: ping);
  }
}
