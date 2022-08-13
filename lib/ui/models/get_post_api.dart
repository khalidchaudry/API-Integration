class GetPostApi {
   String? skyGoUrl;
   String? url;
   String? reviewAuthor;
   String? id;
   String? cert;
   ViewingWindow? viewingWindow;
   String? headline;
   List<CardImages>? cardImages;
   List<Directors>? directors;
   String? sum;
   List<KeyArtImages>? keyArtImages;
   String? synopsis;
   String? body;
   List<Cast>? cast;
   String? skyGoId;
   String? year;
   int? duration;
   int? rating;
   String? movieclass;
   List<Videos>? videos;
   String? lastUpdated;
   List<String>? genres;
   String? quote;

  GetPostApi(
      {required this.skyGoUrl,
      required this.url,
      required this.reviewAuthor,
      required this.id,
      required this.cert,
      required this.viewingWindow,
      required this.headline,
      required this.cardImages,
      required this.directors,
      required this.sum,
      required this.keyArtImages,
      required this.synopsis,
      required this.body,
      required this.cast,
      required this.skyGoId,
      required this.year,
      required this.duration,
      required this.rating,
      required this.movieclass,
      required this.videos,
      required this.lastUpdated,
      required this.genres,
      required this.quote});

  GetPostApi.fromJson(Map<String, dynamic> json) {
    if (json["skyGoUrl"] is String) {
      skyGoUrl = json["skyGoUrl"];
    }
    if (json["url"] is String) {
      url = json["url"];
    }
    if (json["reviewAuthor"] is String) {
      reviewAuthor = json["reviewAuthor"];
    }
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["cert"] is String) {
      cert = json["cert"];
    }
    if (json["viewingWindow"] is Map) {
      viewingWindow = (json["viewingWindow"] == null
          ? null
          : ViewingWindow.fromJson(json["viewingWindow"]))!;
    }
    if (json["headline"] is String) {
      headline = json["headline"];
    }
    if (json["cardImages"] is List) {
      cardImages = (json["cardImages"] == null
          ? null
          : (json["cardImages"] as List)
              .map((e) => CardImages.fromJson(e))
              .toList())!;
    }
    if (json["directors"] is List) {
      directors = (json["directors"] == null
          ? null
          : (json["directors"] as List)
              .map((e) => Directors.fromJson(e))
              .toList())!;
    }
    if (json["sum"] is String) {
      sum = json["sum"];
    }
    if (json["keyArtImages"] is List) {
      keyArtImages = (json["keyArtImages"] == null
          ? null
          : (json["keyArtImages"] as List)
              .map((e) => KeyArtImages.fromJson(e))
              .toList())!;
    }
    if (json["synopsis"] is String) {
      synopsis = json["synopsis"];
    }
    if (json["body"] is String) {
      body = json["body"];
    }
    if (json["cast"] is List) {
      cast = (json["cast"] == null
          ? null
          : (json["cast"] as List).map((e) => Cast.fromJson(e)).toList())!;
    }
    if (json["skyGoId"] is String) {
      skyGoId = json["skyGoId"];
    }
    if (json["year"] is String) {
      year = json["year"];
    }
    if (json["duration"] is int) {
      duration = json["duration"];
    }
    if (json["rating"] is int) {
      rating = json["rating"];
    }
    if (json["class"] is String) {
      movieclass = json["class"];
    }
    if (json["videos"] is List) {
      videos = (json["videos"] == null
          ? null
          : (json["videos"] as List).map((e) => Videos.fromJson(e)).toList())!;
    }
    if (json["lastUpdated"] is String) {
      lastUpdated = json["lastUpdated"];
    }
    if (json["genres"] is List) {
      genres =
          (json["genres"] == null ? null : List<String>.from(json["genres"]))!;
    }
    if (json["quote"] is String) {
      quote = json["quote"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["skyGoUrl"] = skyGoUrl;
    data["url"] = url;
    data["reviewAuthor"] = reviewAuthor;
    data["id"] = id;
    data["cert"] = cert;
    data["viewingWindow"] = viewingWindow!.toJson();
    data["headline"] = headline;
    data["cardImages"] = cardImages!.map((e) => e.toJson()).toList();
    data["directors"] = directors!.map((e) => e.toJson()).toList();
    data["sum"] = sum;
    data["keyArtImages"] = keyArtImages!.map((e) => e.toJson()).toList();
    data["synopsis"] = synopsis;
    data["body"] = body;
    data["cast"] = cast!.map((e) => e.toJson()).toList();
    data["skyGoId"] = skyGoId;
    data["year"] = year;
    data["duration"] = duration;
    data["rating"] = rating;
    data["class"] = movieclass;
    data["videos"] = videos!.map((e) => e.toJson()).toList();
    data["lastUpdated"] = lastUpdated;
    data["genres"] = genres;
    data["quote"] = quote;
    return data;
  }
}

class Videos {
   String? title;
   List<Alternatives>? alternatives;
   String? type;
   String? url;

  Videos(
      {required this.title,
      required this.alternatives,
      required this.type,
      required this.url});

  Videos.fromJson(Map<String, dynamic> json) {
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["alternatives"] is List) {
      alternatives = (json["alternatives"] == null
          ? null
          : (json["alternatives"] as List)
              .map((e) => Alternatives.fromJson(e))
              .toList())!;
    }
    if (json["type"] is String) {
      type = json["type"];
    }
    if (json["url"] is String) {
      url = json["url"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["title"] = title;
    data["alternatives"] = alternatives!.map((e) => e.toJson()).toList();
    data["type"] = type;
    data["url"] = url;
    return data;
  }
}

class Alternatives {
   String? quality;
   String? url;

  Alternatives({required this.quality, required this.url});

  Alternatives.fromJson(Map<String, dynamic> json) {
    if (json["quality"] is String) {
      quality = json["quality"];
    }
    if (json["url"] is String) {
      url = json["url"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["quality"] = quality;
    data["url"] = url;
    return data;
  }
}

class Cast {
   String? name;

  Cast({required this.name});

  Cast.fromJson(Map<String, dynamic> json) {
    if (json["name"] is String) {
      name = json["name"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    return data;
  }
}

class KeyArtImages {
   String? url;
   int? h;
   int? w;

  KeyArtImages({required this.url, required this.h, required this.w});

  KeyArtImages.fromJson(Map<String, dynamic> json) {
    if (json["url"] is String) {
      url = json["url"];
    }
    if (json["h"] is int) {
      h = json["h"];
    }
    if (json["w"] is int) {
      w = json["w"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["url"] = url;
    data["h"] = h;
    data["w"] = w;
    return data;
  }
}

class Directors {
   String? name;

  Directors({required this.name});

  Directors.fromJson(Map<String, dynamic> json) {
    if (json["name"] is String) {
      name = json["name"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    return data;
  }
}

class CardImages {
   String? url;
   int? h;
   int? w;

  CardImages({required this.url, required this.h, required this.w});

  CardImages.fromJson(Map<String, dynamic> json) {
    if (json["url"] is String) {
      url = json["url"];
    }
    if (json["h"] is int) {
      h = json["h"];
    }
    if (json["w"] is int) {
      w = json["w"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["url"] = url;
    data["h"] = h;
    data["w"] = w;
    return data;
  }
}

class ViewingWindow {
   String? startDate;
   String? wayToWatch;
   String? endDate;

  ViewingWindow(
      {required this.startDate,
      required this.wayToWatch,
      required this.endDate});

  ViewingWindow.fromJson(Map<String, dynamic> json) {
    if (json["startDate"] is String) {
      startDate = json["startDate"];
    }
    if (json["wayToWatch"] is String) {
      wayToWatch = json["wayToWatch"];
    }
    if (json["endDate"] is String) {
      endDate = json["endDate"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["startDate"] = startDate;
    data["wayToWatch"] = wayToWatch;
    data["endDate"] = endDate;
    return data;
  }
}
