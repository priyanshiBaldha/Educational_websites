import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../../Model/Model.dart';


class techWebPage extends StatefulWidget {
  const techWebPage({Key? key}) : super(key: key);

  @override
  State<techWebPage> createState() => _techWebPageState();
}

class _techWebPageState extends State<techWebPage> {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();

  double progressVal = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Modal.pullToRefreshController = PullToRefreshController(
        options: PullToRefreshOptions(color: Colors.blueGrey),
        onRefresh: () async {
          await Modal.inAppWebViewController.reload();
        });
  }

  @override
  Widget build(BuildContext context) {
    var res = ModalRoute.of(context)!.settings.arguments;

    dynamic fromRes = res;

    String ottUrl = fromRes;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            (progressVal < 1)
                ? SizedBox(
              height: 5,
              child: LinearProgressIndicator(
                value: progressVal,
                color: Colors.green,
                backgroundColor: Colors.grey,
              ),
            )
                : const SizedBox(),
            Expanded(
              child: InAppWebView(
                initialOptions: InAppWebViewGroupOptions(
                    android: AndroidInAppWebViewOptions(
                      useHybridComposition: true,
                    ),),
                pullToRefreshController: Modal.pullToRefreshController,
                onProgressChanged: (controller, index) {
                  setState(() {
                    progressVal = index / 100;
                  });
                },
                initialUrlRequest: URLRequest(url: Uri.parse(ottUrl)),
                onWebViewCreated: (val) {
                  setState(() {
                    Modal.inAppWebViewController = val;
                  });
                },
                onLoadStop: (controller, uri) async {
                  await Modal.pullToRefreshController.endRefreshing();
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(width: 15,),
          FloatingActionButton(
            backgroundColor: Colors.blueGrey,
            onPressed: () {
              Modal.inAppWebViewController.goBack();
            },
            child: Icon(Icons.arrow_back_ios),
          ),
          FloatingActionButton(
            backgroundColor: Colors.blueGrey,
            onPressed: () async {
              Uri? uri = await Modal.inAppWebViewController.getUrl();

              Modal.myBookMark.add(uri.toString());
            },
            child: const Icon(Icons.bookmark_border),
          ),
          FloatingActionButton(
            backgroundColor: Colors.blueGrey,
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.home),
          ),
          FloatingActionButton(
            backgroundColor: Colors.blueGrey,
            onPressed: () {
              Modal.inAppWebViewController.reload();
            },
            child: Icon(Icons.refresh),
          ),
          FloatingActionButton(
            backgroundColor: Colors.blueGrey,
            onPressed: () {
              Modal.inAppWebViewController.goForward();
            },
            child: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}