class ShopsModel {
  final String title;
  final int offer;
  final String slug;
  final String backgroundMobile;
  final String backgroundDesktop;
  final String? logo;
  final String vendorType;
  final double rate;
  final int reach;
  final int point;
  final String miniAddress;
  final String avgTime;
  final List<Badge> badges;
  final List<Badge> backgroundBadges;
  final String status;
  final Plus? plus;

  ShopsModel({
    required this.title,
    required this.offer,
    required this.slug,
    required this.backgroundMobile,
    required this.backgroundDesktop,
    this.logo,
    required this.vendorType,
    required this.rate,
    required this.reach,
    required this.point,
    required this.miniAddress,
    required this.avgTime,
    required this.badges,
    required this.backgroundBadges,
    required this.status,
    this.plus,
  });

  factory ShopsModel.fromJson(Map<String, dynamic> json) {
    return ShopsModel(
      title: json['title'] as String,
      offer: json['offer'] as int,
      slug: json['slug'] as String,
      backgroundMobile: json['background']['mobile'] as String,
      backgroundDesktop: json['background']['desktop'] as String,
      logo: json['logo'] as String?,
      vendorType: json['vendor_type'] as String,
      rate: json['rate'] is int
          ? (json['rate'] as int).toDouble()
          : json['rate'] as double,
      reach: json['reach'] as int,
      point: json['point'] as int,
      miniAddress: json['mini_address'] as String,
      avgTime: json['avg_time'] as String,
      badges: (json['badges'] as List<dynamic>)
          .map((e) => Badge.fromJson(e as Map<String, dynamic>))
          .toList(),
      backgroundBadges: (json['background_badges'] as List<dynamic>)
          .map((e) => Badge.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String,
      plus: json['plus'] != null ? Plus.fromJson(json['plus']) : null,
    );
  }
}

class Plus {
  final int status;
  final String? title;

  Plus({required this.status, this.title});

  factory Plus.fromJson(Map<String, dynamic> json) {
    return Plus(
      status: json['status'] as int,
      title: json['title'] as String?,
    );
  }
}

class Badge {
  final String text;
  final BadgeStyle style;

  Badge({
    required this.text,
    required this.style,
  });

  factory Badge.fromJson(Map<String, dynamic> json) {
    return Badge(
      text: json['text'] as String,
      style: BadgeStyle.fromJson(json['style'] as Map<String, dynamic>),
    );
  }
}

class BadgeStyle {
  final String text;
  final String background;

  BadgeStyle({
    required this.text,
    required this.background,
  });

  factory BadgeStyle.fromJson(Map<String, dynamic> json) {
    return BadgeStyle(
      text: json['text'] as String,
      background: json['background'] as String,
    );
  }
}
