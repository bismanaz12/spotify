class TrackSongs {
  final String name;
  final List<String> artists;
  final String url;
  final String albumName;
  final String previewUrl;
  final List<String> availableMarkets;
  final bool isExplicit;
  final String albumType;
  final String addedAt;
  final String addedById;

  TrackSongs({
    required this.name,
    required this.artists,
    required this.url,
    required this.albumName,
    required this.previewUrl,
    required this.availableMarkets,
    required this.isExplicit,
    required this.albumType,
    required this.addedAt,
    required this.addedById,
  });

  factory TrackSongs.fromJson(Map<String, dynamic> json) {
    final track = json['track'];
    final addedBy = json['added_by'];

    return TrackSongs(
      name: track['name'] ?? '',
      artists: List<String>.from(
        track['artists']?.map((artist) => artist['name']) ?? [],
      ),
      url: track['external_urls']?['spotify'] ?? '',
      albumName: track['album']?['name'] ?? '',
      previewUrl: track['preview_url'] ?? '',
      availableMarkets: List<String>.from(track['available_markets'] ?? []),
      isExplicit: track['explicit'] ?? false,
      albumType: track['album']?['album_type'] ?? '',
      addedAt: json['added_at'] ?? '',
      addedById: addedBy?['id'] ?? '',
    );
  }
}
