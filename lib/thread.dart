class Thread {
  List<Posts>? posts;

  Thread({required this.posts});

  Thread.fromJson(Map<String, dynamic> json) {
    if (json['posts'] != null) {
      posts = <Posts>[];
      json['posts'].forEach((v) {
        posts!.add(new Posts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.posts != null) {
      data['posts'] = this.posts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Posts {
  int? no;
  String? now;
  String? name;
  String? sub;
  String? com;
  String? filename;
  String? ext;
  int? w;
  int? h;
  int? tnW;
  int? tnH;
  int? tim;
  int? time;
  String? md5;
  int? fsize;
  int? resto;
  int? bumplimit;
  int? imagelimit;
  String? semanticUrl;
  int? replies;
  int? images;
  int? uniqueIps;
  int? tailSize;

  Posts(
      {this.no,
        this.now,
        this.name,
        this.sub,
        this.com,
        this.filename,
        this.ext,
        this.w,
        this.h,
        this.tnW,
        this.tnH,
        this.tim,
        this.time,
        this.md5,
        this.fsize,
        this.resto,
        this.bumplimit,
        this.imagelimit,
        this.semanticUrl,
        this.replies,
        this.images,
        this.uniqueIps,
        this.tailSize});

  Posts.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    now = json['now'];
    name = json['name'];
    sub = json['sub'];
    com = json['com'];
    filename = json['filename'];
    ext = json['ext'];
    w = json['w'];
    h = json['h'];
    tnW = json['tn_w'];
    tnH = json['tn_h'];
    tim = json['tim'];
    time = json['time'];
    md5 = json['md5'];
    fsize = json['fsize'];
    resto = json['resto'];
    bumplimit = json['bumplimit'];
    imagelimit = json['imagelimit'];
    semanticUrl = json['semantic_url'];
    replies = json['replies'];
    images = json['images'];
    uniqueIps = json['unique_ips'];
    tailSize = json['tail_size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['no'] = this.no;
    data['now'] = this.now;
    data['name'] = this.name;
    data['sub'] = this.sub;
    data['com'] = this.com;
    data['filename'] = this.filename;
    data['ext'] = this.ext;
    data['w'] = this.w;
    data['h'] = this.h;
    data['tn_w'] = this.tnW;
    data['tn_h'] = this.tnH;
    data['tim'] = this.tim;
    data['time'] = this.time;
    data['md5'] = this.md5;
    data['fsize'] = this.fsize;
    data['resto'] = this.resto;
    data['bumplimit'] = this.bumplimit;
    data['imagelimit'] = this.imagelimit;
    data['semantic_url'] = this.semanticUrl;
    data['replies'] = this.replies;
    data['images'] = this.images;
    data['unique_ips'] = this.uniqueIps;
    data['tail_size'] = this.tailSize;
    return data;
  }
}
