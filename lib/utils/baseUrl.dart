// 网络请求url.
class BaseUrl{
  final isProd = const bool.fromEnvironment('dart.vm.product');
  static const String url = 'https://epro-op.test.viewchain.net/opapi';
}