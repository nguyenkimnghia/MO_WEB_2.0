import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:moffice_web/helpers/store/cache_storage.dart';
import 'package:moffice_web/ui/pages/pages.exports.dart';

/// Đây là class thực hiện quản lý trang, chuyển hướng trang cho toàn bộ web
class WebRouter {
  /// Các tham số định danh cho page
  static const String login = '/login';
  static const String home = '/';


  /// Phương thức thực hiện config định tuyển router cho web
  static final GoRouter router = GoRouter(
    initialLocation: login,
    // Tắt mã băm # trong Urls web
    urlPathStrategy: UrlPathStrategy.path,
    routes: <GoRoute>[
      // Khai báo page
      GoRoute(
        path: login,
        builder: (BuildContext context, GoRouterState state) =>  const Login(),
      ),
      GoRoute(
        path: home,
        builder: (BuildContext context, GoRouterState state) =>  Home(),
      ),
    ],
    // Điều hướng về trang đăng nhập nếu người dùng chưa login
    redirect: (state){
      // Nếu người dùng chưa đăng nhập, cần phải đăng nhập
      final loggedIn = StorageCached.localStorage.getString(StorageCached.accessToken).isNotEmpty;
      final loggingIn = state.subloc == login;
      if (!loggedIn) return loggingIn ? null : login;

      // Nếu người dùng đã đăng nhập nhưng họ vẫn mở trang login, thì thực hiện
      // mở luôn trang home
      if (loggingIn) return home;
      // Trường hợp còn lại không thực hiện gì cả
      return null;
    },
    errorBuilder: (context, state) => const ErrorPage(),
  );

  /// Phương thức điều hướng
  /// Thực hiện khi muốn di chuyển đến 1 page bất kỳ
  static goToPage(context, namePage){
    GoRouter.of(context).go(namePage);
  }

  /// Phương thức đẩy trang
  /// Thực hiện khi muốn đẩy 1 trang mới chồng lên trang hiện tại vào trong ngăn xếp
  static pushToPage(context, namePage){
    GoRouter.of(context).push(namePage);
  }

  /// Phương thức quay lại trang trước đó
  static backToPage(context){
    GoRouter.of(context).pop();
  }

  /// Phương thức refresh lại trang
  static refreshPage(context){
    GoRouter.of(context).refresh();
  }
}

