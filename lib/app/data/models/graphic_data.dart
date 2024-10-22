class GraphicData {
  GraphicData(this.x, this.y);

  final int x;
  final int y;

  factory GraphicData.fromJson(Map<String, dynamic> json) {
    return GraphicData(
      json['x'] as int,
      json['y'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'x': x,
      'y': y,
    };
  }
}
