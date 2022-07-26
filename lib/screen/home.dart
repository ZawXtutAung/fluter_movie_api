import 'package:flutter/material.dart';
import 'package:flutter_movies/model/movies.dart';
import 'package:flutter_movies/screen/detail.dart';
import 'package:flutter_movies/screen/loading.dart';
import 'package:flutter_movies/service/api_service.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<MovieModel> mv() async {
    var res = await ApiHelper().moviesList();
    return MovieModel.fromJson(res);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie app'),
      ),
      body: FutureBuilder<MovieModel>(
        future: mv(),
        builder: (BuildContext context, snapshot) {
          return snapshot.connectionState != ConnectionState.done
              ? Loading()
              : snapshot.data!.status == false
                  ? Center(
                      child: Text("${snapshot.data!.status!}"),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.results!.length,
                      itemBuilder: (BuildContext context, int index) {
                        var data = snapshot.data!.results![index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                              return Detail(data: data.id);
                            }));
                          },
                          child: Card(
                            child: Row(
                              children: [
                                Container(
                                  height: 80,
                                  width: 80,
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(snapshot
                                              .data!.results![index].image!),
                                          fit: BoxFit.cover)),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.white),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(100)),
                                        image: DecorationImage(
                                            image: NetworkImage(snapshot
                                                .data!.results![index].image!),
                                            fit: BoxFit.cover)),
                                    child: Center(
                                      child: Container(
                                        width: 10,
                                        height: 10,
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.5),
                                          border: Border.all(
                                              width: 1,
                                              color: Colors.lightBlue),
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(100)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data.title!,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                          'OriginalTitle: ${data.titleOriginal}'),
                                      Text('rating: ${data.rating}'),
                                      Text('year: ${data.year}')
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
        },
      ),
    );
  }
}
