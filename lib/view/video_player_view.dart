import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();

    // _controller = WebViewController()
    //   ..setJavaScriptMode(JavaScriptMode.unrestricted)
    //   ..setNavigationDelegate(
    //     NavigationDelegate(
    //       onProgress: (int progress) {
    //         // Optionally handle loading progress here
    //       },
    //       onPageStarted: (String url) {
    //         // Optionally handle page load start here
    //       },
    //       onPageFinished: (String url) {
    //         // Optionally handle page load finish here
    //       },
    //       onHttpError: (HttpResponseError error) {
    //         // Optionally handle HTTP errors here
    //       },
    //       onWebResourceError: (WebResourceError error) {
    //         // Optionally handle web resource errors here
    //       },
    //       onNavigationRequest: (NavigationRequest request) {
    //         // Prevent navigation to specific URLs if needed
    //         if (request.url.startsWith('https://www.youtube.com/')) {
    //           return NavigationDecision.prevent;
    //         }
    //         return NavigationDecision.navigate;
    //       },
    //       onMessageReceived: (message) {
    //         if (message == 'fullscreen') {
    //           _enterFullscreen();
    //         } else if (message == 'exit_fullscreen') {
    //           _exitFullscreen();
    //         }
    //       },
    //     ),
    //   )
    //   ..loadRequest(Uri.parse('https://customer-nt81cnezvqtnpkjn.cloudflarestream.com/498c0d25753e48ee90ae231cde9f683a/watch'));

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            print("progress: $progress");
          },

          onPageFinished: (String url) {
            // Inject JavaScript to detect fullscreen requests
            _controller.runJavaScript('''

        


              document.addEventListener('webkitfullscreenchange', function() {
                if (document.webkitIsFullScreen) {
                  window.flutter_inappwebview.postMessage('fullscreen');
                } else {
                  window.flutter_inappwebview.postMessage('exit_fullscreen');
                }
              });

              document.addEventListener('fullscreenchange', function() {
                if (document.fullscreenElement) {
                  window.flutter_inappwebview.postMessage('fullscreen');
                } else {
                  window.flutter_inappwebview.postMessage('exit_fullscreen');
                }
              });
            ''');
          },
        ),
      )
      ..loadRequest(Uri.parse('https://customer-nt81cnezvqtnpkjn.cloudflarestream.com/498c0d25753e48ee90ae231cde9f683a/watch'));

    // Add the JavaScript channel for communication
    _controller.addJavaScriptChannel(
      'flutter_inappwebview',
      onMessageReceived: (JavaScriptMessage message) {
        print("Received message: ${message.message}");
        if (message.message == 'fullscreen') {
          _enterFullscreen();
        } else if (message.message == 'exit_fullscreen') {
          _exitFullscreen();
        }else if (message.message.startsWith('progress:')) {
          String progress = message.message.split(':')[1];
          print("progress video: $progress");
          // setState(() {
          //   // _progress = double.parse(progress);
          // });
        }
      },
    );
  

  }

  void _enterFullscreen() {
    // Rotate screen and hide system UI
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
  }

  void _exitFullscreen() {
    // Restore screen orientation and system UI
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: Column( children: [ 
        Text("video play"),
        Container(
          height: 200,
           child:  
        WebViewWidget(controller: _controller),)
      ],),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: VideoPlayerScreen(),
//   ));
// }
