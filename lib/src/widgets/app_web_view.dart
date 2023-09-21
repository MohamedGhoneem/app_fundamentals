import 'package:flutter/material.dart';
export 'package:webview_flutter/webview_flutter.dart';
import '../../app_fundamentals.dart';

///==========================================================
/// CREATED BY MOHAMED GHONEIM 01/01/2022 TEL// +201064626369
///==========================================================
///
class AppWebView extends BaseStatefulWidget {
  final String title;
  final String url;
  final String? currentLanguage;
  final double? appBarHeight;
  final Widget? errorWidget;
  final String? errorString;

  const AppWebView(
      {Key? key,
        required this.title,
        required this.url,
        this.currentLanguage,
        this.appBarHeight,
        this.errorWidget,
        this.errorString})
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
    headers?["lang"] = widget.currentLanguage ?? 'en';
    // #docregion platform_features
    // if (WebViewPlatform.instance is WebKitWebViewPlatform) {
    //   params = WebKitWebViewControllerCreationParams(
    //     allowsInlineMediaPlayback: true,
    //     mediaTypesRequiringUserAction: const <PlaybackMediaTypes>{},
    //   );
    // } else {
    params = const PlatformWebViewControllerCreationParams();
    // }

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
    // if (controller.platform is AndroidWebViewController) {
    //   AndroidWebViewController.enableDebugging(true);
    //   (controller.platform as AndroidWebViewController)
    //       .setMediaPlaybackRequiresUserGesture(false);
    // }
    // #enddocregion platform_features

    _controller = controller;
  }

  @override
  Widget setBody(BuildContext context) {
    return isError
        ? Center(
        child: SomeThingWentWrongScreen(
          errorWidget: widget.errorWidget ??
              const Center(
                  child: Icon(
                    Icons.error,
                    color: Colors.red,
                  )),
          error: widget.errorString ?? 'Some Thing Went Wrong',
          retry: () {
            setState(() {
              isError = false;
              _controller.loadRequest(Uri.parse(widget.url),
                  headers: headers!);
            });
          },
        ))
        : WebViewWidget(controller: _controller);
  }

  @override
  PreferredSizeWidget? setAppbar() {
    return PreferredSize(
      preferredSize:
      Size(MediaQuery.of(context).size.width, widget.appBarHeight ?? 0),
      child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).viewPadding.top,
              bottom: 16),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border(
                bottom: BorderSide(
                    color: Colors.grey.withOpacity(.4), width: 1)),
          ),
          child: Row(
            children: [
              const SizedBox(width: 16),
              AppButton(
                  title: widget.title,
                  borderColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  alignment: AppButtonAlign.start,
                  icon:  const Icon(Icons.arrow_back_ios),
                  onTap: () => super.setOnWillPop()),
            ],
          )),
    );
  }


  @override
  setOnBack() {
    return super.setOnWillPop();
  }

}
