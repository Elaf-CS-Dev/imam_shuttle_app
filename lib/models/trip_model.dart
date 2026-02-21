class Trip {
  final String id;
  final String destination;
  final String time;
  final String? estimatedDuration;

  Trip({
    required this.id,
    required this.destination,
    required this.time,
    this.estimatedDuration,
  });
}
