class Autocomplete {
  final int totalValues;
  final List<dynamic> data;

  Autocomplete({this.totalValues, this.data});

  factory Autocomplete.fromJson(Map<String, dynamic> json) {
    return Autocomplete(
      totalValues: json['total_values'],
      data: json['data'],
    );
  }

  @override
  String toString() {
    return "{ " +
        "\n\ttotalValues: " +
        totalValues.toString() +
        "\n\tdata: " +
        data.toString() +
        "\n}";
  }
}
