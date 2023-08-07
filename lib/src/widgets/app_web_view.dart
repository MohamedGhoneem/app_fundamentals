import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_wkwebview/webview_flutter_wkwebview.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import '../base_stateful_widget.dart';
import '../colors.dart';
import '../shared_preferences_helper.dart';
import '../shared_preferences_keys.dart';
import '../size_config.dart';
import 'app_back_icon.dart';
import 'app_button.dart';
import 'some_thing_went_wrong_screen.dart';

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
class AppWebView extends BaseStatefulWidget {
  final String title;
  final String url;

  const AppWebView({Key? key, required this.title, required this.url})
      : super(key: key);

  @override
  State<AppWebView> createState() => _AppWebViewState();
}

class _AppWebViewState extends BaseState<AppWebView> {
  late final WebViewController _controller;
  late final PlatformWebViewControllerCreationParams params;

  bool isError = false;
  Map<String, String>? headers = {};

  @override
  void initState() {
    super.initState();
    headers?["lang"] =
        SharedPreferenceHelper.getValueForKey(SharedPrefsKeys.languageKey) ??
            'ar';
    // #docregion platform_features
    if (WebViewPlatform.instance is WebKitWebViewPlatform) {
      params = WebKitWebViewControllerCreationParams(
        allowsInlineMediaPlayback: true,
        mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
      );
    } else {
      params = const PlatformWebViewControllerCreationParams();
    }

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);
    // #enddocregion platform_features

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            debugPrint('WebView is loading (progress : $progress%)');
          },
          onPageStarted: (String url) {
            debugPrint('Page started loading: $url');
          },
          onPageFinished: (String url) {
            debugPrint('Page finished loading: $url');
          },
          onWebResourceError: (WebResourceError error) {
            setState(() {
              isError = true;
            });
            debugPrint('''
Page resource error:
  code: ${error.errorCode}
  description: ${error.description}
  errorType: ${error.errorType}
  isForMainFrame: ${error.isForMainFrame}
          ''');
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              debugPrint('blocking navigation to ${request.url}');
              return NavigationDecision.prevent;
            }
            debugPrint('allowing navigation to ${request.url}');
            return NavigationDecision.navigate;
          },
          onUrlChange: (UrlChange change) {
            debugPrint('url change to ${change.url}');
          },
        ),
      )
      ..addJavaScriptChannel(
        'Toaster',
        onMessageReceived: (JavaScriptMessage message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        },
      )
      ..loadRequest(Uri.parse(widget.url), headers: headers!);

    // #docregion platform_features
    if (controller.platform is AndroidWebViewController) {
      AndroidWebViewController.enableDebugging(true);
      (controller.platform as AndroidWebViewController)
          .setMediaPlaybackRequiresUserGesture(false);
    }
    // #enddocregion platform_features

    _controller = controller;
  }

  @override
  Widget setBody(BuildContext context) {
    return isError
        ? Center(
            child: SomeThingWentWrongScreen(
              label: 'Some Thing Went Wrong',
              retry: () {
                setState(() {
                  isError = false;
                  _controller.loadRequest(Uri.parse(widget.url),
                      headers: headers!);
                });
              },
            ),
          )
        : WebViewWidget(controller: _controller);

    //   WebView(
    //   initialUrl: widget.url,
    //   javascriptMode: JavascriptMode.unrestricted,
    //   onPageFinished: (url) {
    //   },
    // );
  }

  @override
  PreferredSizeWidget? setAppbar() {
    return PreferredSize(
      preferredSize:
          Size(SizeConfig.blockSizeHorizontal * 100, SizeConfig.appBarHeight),
      child: Container(
          width: SizeConfig.blockSizeHorizontal * 100,
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).viewPadding.top,
              bottom: SizeConfig.padding),
          decoration: BoxDecoration(
            color: AppColors.transparentColor,
            border: Border(
                bottom: BorderSide(
                    color: AppColors.lightGreyColor.withOpacity(.4), width: 1)),
          ),
          child: Row(
            children: [
              SizedBox(width: SizeConfig.padding),
              AppButton(
                  title: widget.title,
                  borderColor: AppColors.transparentColor,
                  backgroundColor: AppColors.transparentColor,
                  alignment: AppButtonAlign.start,
                  icon: const AppBackIcon(),
                  onTap: () => super.setOnWillPop()),
            ],
          )),
    );
  }

  @override
  bool showBottomNavigationBar() {
    return false;
  }

  @override
  setOnBack() {
    return super.setOnWillPop();
  }
}
