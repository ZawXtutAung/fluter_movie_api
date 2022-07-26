import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_movies/model/detail.dart';
import 'package:flutter_movies/screen/loading.dart';
import 'package:flutter_movies/service/api_service.dart';

class Detail extends StatefulWidget {
  Detail({Key? key, required this.data}) : super(key: key);
  String? data;
  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  Future<MovieDetailModel> details() async {
    var res = await ApiHelper().moviesdetail(widget.data);
    return MovieDetailModel.fromJson(res);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data!),
      ),
      body: FutureBuilder<MovieDetailModel>(
        future: details(),
        builder: (BuildContext context, snapshot) {
          return snapshot.connectionState != ConnectionState.done
              ? Loading()
              : ListView(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width.toDouble(),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image:
                                  NetworkImage(snapshot.data!.result!.image!))),
                    ),
                    detailWidget(data: snapshot.data!.result!),
                    const Text(
                      'embedUrls',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    embedUrlsList(urls: snapshot.data!.result!.embedUrls)
                  ],
                );
        },
      ),
    );
  }

  Widget embedUrlsList({List<EmbedUrl>? urls}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: urls!.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Server: ${urls[index].server!}'),
                          Text('Link: ${urls[index].url!}'),
                          Text('priority: ${urls[index].priority}'),
                        ],
                      ),
                    ),
                    IconButton(
                        onPressed: () async {
                          await Clipboard.setData(
                              ClipboardData(text: urls[index].url));
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Copy Links')));
                        },
                        icon: Icon(Icons.copy))
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget detailWidget({required Result data}) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.title!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('OriginalTitle: ${data.titleOriginal}'),
            const SizedBox(height: 10),
            Text('rating: ${data.rating}'),
            const SizedBox(height: 10),
            Text('year: ${data.year}'),
            const SizedBox(height: 10),
            Text('release: ${data.release}'),
            const SizedBox(height: 10),
            Text(data.description!)
          ],
        ),
      ),
    );
  }
}
