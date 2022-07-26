import 'results.dart';

class MovieModel {
  int? status;
  bool? success;
  String? messageStatus;
  List<Results>? results;
  int? totalResults;
  int? totalPages;

  MovieModel(
      {this.status,
      this.success,
      this.messageStatus,
      this.results,
      this.totalResults,
      this.totalPages});

  MovieModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    messageStatus = json['messageStatus'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
    totalResults = json['total_results'];
    totalPages = json['total_pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['success'] = this.success;
    data['messageStatus'] = this.messageStatus;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    data['total_results'] = this.totalResults;
    data['total_pages'] = this.totalPages;
    return data;
  }
}

// class Results {
//   List<dynamic>? actors;
//   List<dynamic> directors;
//   List<dynamic> escritors;
//   List<dynamic> otherTitles;
//   String? sId;
//   String? image;
//   String? title;
//   String? rating;
//   String? year;
//   String? titleOriginal;
//   String? uuid;
//   String? description;
//   List<Genres>? genres;
//   List<Countries>? countries;
//   String? release;
//   List<EmbedUrls>? embedUrls;
//   int? index;
//   List<Null>? episodes;
//   String? createdAt;
//   String? updatedAt;

//   Results(
//       {this.actors,
//       this.directors,
//       this.escritors,
//       this.otherTitles,
//       this.sId,
//       this.image,
//       this.title,
//       this.rating,
//       this.year,
//       this.titleOriginal,
//       this.uuid,
//       this.description,
//       this.genres,
//       this.countries,
//       this.release,
//       this.embedUrls,
//       this.index,
//       this.episodes,
//       this.createdAt,
//       this.updatedAt});

//   Results.fromJson(Map<String, dynamic> json) {
//     // if (json['actors'] != null) {
//     //   actors = <Null>[];
//     //   json['actors'].forEach((v) {
//     //     actors!.add(new Null.fromJson(v));
//     //   });
//     // }
//     // if (json['directors'] != null) {
//     //   directors = <Null>[];
//     //   json['directors'].forEach((v) {
//     //     directors!.add(new Null.fromJson(v));
//     //   });
//     // }
//     // if (json['escritors'] != null) {
//     //   escritors = <Null>[];
//     //   json['escritors'].forEach((v) {
//     //     escritors!.add(new Null.fromJson(v));
//     //   });
//     // }
//     // if (json['otherTitles'] != null) {
//     //   otherTitles = <Null>[];
//     //   json['otherTitles'].forEach((v) {
//     //     otherTitles!.add(new Null.fromJson(v));
//     //   });
//     // }
//     sId = json['_id'];
//     image = json['image'];
//     title = json['title'];
//     rating = json['rating'];
//     year = json['year'];
//     titleOriginal = json['titleOriginal'];
//     uuid = json['uuid'];
//     description = json['description'];
//     if (json['genres'] != null) {
//       genres = <Genres>[];
//       json['genres'].forEach((v) {
//         genres!.add(new Genres.fromJson(v));
//       });
//     }
//     if (json['countries'] != null) {
//       countries = <Countries>[];
//       json['countries'].forEach((v) {
//         countries!.add(new Countries.fromJson(v));
//       });
//     }
//     release = json['release'];
//     if (json['embedUrls'] != null) {
//       embedUrls = <EmbedUrls>[];
//       json['embedUrls'].forEach((v) {
//         embedUrls!.add(new EmbedUrls.fromJson(v));
//       });
//     }
//     index = json['index'];
//     if (json['episodes'] != null) {
//       episodes = <Null>[];
//       json['episodes'].forEach((v) {
//         episodes!.add(new Null.fromJson(v));
//       });
//     }
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.actors != null) {
//       data['actors'] = this.actors!.map((v) => v.toJson()).toList();
//     }
//     if (this.directors != null) {
//       data['directors'] = this.directors!.map((v) => v.toJson()).toList();
//     }
//     if (this.escritors != null) {
//       data['escritors'] = this.escritors!.map((v) => v.toJson()).toList();
//     }
//     if (this.otherTitles != null) {
//       data['otherTitles'] = this.otherTitles!.map((v) => v.toJson()).toList();
//     }
//     data['_id'] = this.sId;
//     data['image'] = this.image;
//     data['title'] = this.title;
//     data['rating'] = this.rating;
//     data['year'] = this.year;
//     data['titleOriginal'] = this.titleOriginal;
//     data['uuid'] = this.uuid;
//     data['description'] = this.description;
//     if (this.genres != null) {
//       data['genres'] = this.genres!.map((v) => v.toJson()).toList();
//     }
//     if (this.countries != null) {
//       data['countries'] = this.countries!.map((v) => v.toJson()).toList();
//     }
//     data['release'] = this.release;
//     if (this.embedUrls != null) {
//       data['embedUrls'] = this.embedUrls!.map((v) => v.toJson()).toList();
//     }
//     data['index'] = this.index;
//     if (this.episodes != null) {
//       data['episodes'] = this.episodes!.map((v) => v.toJson()).toList();
//     }
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     return data;
//   }
// }

// class Genres {
//   String? name;
//   String? uuid;

//   Genres({this.name, this.uuid});

//   Genres.fromJson(Map<String, dynamic> json) {
//     name = json['name'];
//     uuid = json['uuid'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['uuid'] = this.uuid;
//     return data;
//   }
// }

// class EmbedUrls {
//   String? server;
//   String? url;
//   int? priority;

//   EmbedUrls({this.server, this.url, this.priority});

//   EmbedUrls.fromJson(Map<String, dynamic> json) {
//     server = json['server'];
//     url = json['url'];
//     priority = json['priority'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['server'] = this.server;
//     data['url'] = this.url;
//     data['priority'] = this.priority;
//     return data;
//   }
// }
