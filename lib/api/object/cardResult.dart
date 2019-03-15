class CardResult {
  final String object;
  final String id;
  final String name;
  final String cardImageUrl;
  final String manaCost;
  final double convertManaCost;
  final String cardType;
  final String oracleText;
  final String power;
  final String toughness;
  final List<dynamic> colors;
  final List<dynamic> legalityList;
  final String setName;
  final String rulingsUrl;
  final String rarity;
  final String priceUsd;
  final String imageUrl;
  final String flavorText;
  final String artist;

  CardResult(
      {this.object,
      this.id,
      this.name,
      this.cardImageUrl,
      this.manaCost,
      this.convertManaCost,
      this.cardType,
      this.oracleText,
      this.power,
      this.toughness,
      this.colors,
      this.legalityList,
      this.setName,
      this.rulingsUrl,
      this.rarity,
      this.priceUsd,
      this.imageUrl,
      this.flavorText,
      this.artist});

  factory CardResult.fromJson(Map<String, dynamic> json) {
    return CardResult(
      object: json['object'],
      id: json['id'],
      name: json['name'],
      cardImageUrl: json['image_uris']['normal'],
      manaCost: json['mana_cost'],
      convertManaCost: json['cmc'],
      cardType: json['type_line'],
      oracleText: json['oracle_text'],
      power: json['power'],
      toughness: json['toughness'],
      colors: json['colors'],
      legalityList: json['leglities'],
      setName: json['set_name'],
      rulingsUrl: json['rulings_uri'],
      rarity: json['rarity'],
      priceUsd: json['usd'],
      imageUrl: json['image_uris']['art_crop'],
      flavorText: json['flavor_text'],
      artist: json['artist']
    );
  }

  @override
  String toString() {
    return '{' +
        "\n\tobject: " +
        object +
        "\n\tid: " +
        id +
        "\n\tname: " +
        name +
        "\n\timageUrl: " +
        imageUrl +
        "\n\tmanaCost: " +
        manaCost +
        "\n\tconvertedManaCost: " +
        convertManaCost.toString() +
        "\n\tcardType: " +
        cardType +
        "\n\toracleText: " +
        oracleText +
        "\n\tpower: " +
        power +
        "\n\ttoughness: " +
        toughness +
        "\n\tcolors: " +
        colors.toString() +
        "\n\tlegalityList: " +
        legalityList.toString() +
        "\n\tsetName: " +
        setName +
        "\n\trulingsUrl: " +
        rulingsUrl +
        "\n\trarity: " +
        rarity +
        "\n\tpriceUsd: " +
        priceUsd +
        '\n}';
  }
}
