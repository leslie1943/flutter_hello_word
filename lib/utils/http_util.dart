import 'package:dio/dio.dart';
import 'package:flutter_hello_word/utils/baseUrl.dart';
import 'dart:convert' as convert;

/*
*   泛型:
*     E-代表Element,元素
*     T-代表Type,类型
*     K-代表Key,键
*     V-代表Value,值
* */
class HttpUtil {
  // 🚀🚀🚀 get 请求 🚀🚀🚀
  // {}: 可选参数
  static void get(String url,
      {Map<String, dynamic> data,
      Map<String, dynamic> headers,
      Function success,
      Function error}) async {
    // 对接收的请求参数进行处理.
    print('get request url');
    print(url);

    // 参数拼接.
    if (data != null && data.isNotEmpty) {
      StringBuffer options = new StringBuffer('?');
      data.forEach((key, value) => options.write('${key}=${value}&'));
      String optionStr = options.toString();
      optionStr = optionStr.substring(0, optionStr.length - 1);
      url += optionStr;
    }
    // 发送get请求
    await _sendRequest(url, 'get', success, headers: headers, error: error);
  }

  // 🚀🚀🚀 post 请求 🚀🚀🚀
  static void post (String url,
      {Map<String, dynamic> data,
      Map<String, dynamic> headers,
      Function success,
      Function error}) async {
    await _sendRequest(url, 'post', success,
        data: data, headers: headers, error: error);
  }

  // 具体请求.
  static Future _sendRequest(String url, String method, Function success,
      {Map<String, dynamic> data,
      Map<String, dynamic> headers,
      Function error}) async {
    String _msg;

    print('request url');
    print(url);

    // 检测请求地址
    if (!url.startsWith('http')) {
      url = BaseUrl.url + url;
    }
    try {
      Map<String, dynamic> dataMap =
          data == null ? new Map() : new Map<String, dynamic>.from(data);
      Map<String, dynamic> headersMap =
          headers == null ? new Map() : new Map<String, dynamic>.from(headers);

      // 配置dio请求
      Response response;
      Dio dio = new Dio();
      dio.options.connectTimeout = 6000; // 超时
      dio.options.receiveTimeout = 3000; // 响应流上前后2次接收到数据的间隔
      dio.options.headers.addAll(headersMap); // 添加headers

      if (method == 'get') {
        response = await dio.get(url);
      } else {
        response = await dio.post(url, data: dataMap);
      }

      // 转换格式
      var res = convert.jsonDecode(response.toString());
      // 请求返回
      if (res['status'] != 1) {
        _msg = '网络请求出错, 状态码:' + response.statusCode.toString();
        _handleError(error, _msg);
        return;
      }else{
        if(success != null){
          success(res['result']);
        }
      }
    } catch (exception) {
      _handleError(error, '数据请求错误:' + exception.toString());
    }
  }

  // 返回错误信息
  static _handleError(Function errorCallback, String errorMsg) {
    if (errorCallback != null) {
      errorCallback(errorMsg);
    } else {
      return errorCallback();
    }
  }
}
