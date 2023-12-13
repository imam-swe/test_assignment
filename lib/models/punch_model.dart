class PunchModel {
    List<PunchData> data;

    PunchModel({
        required this.data,
    });

}

class PunchData {
    String id;
    String userId;
    String lat;
    String long;
    DateTime createdAt;
    dynamic updatedAt;

    PunchData({
        required this.id,
        required this.userId,
        required this.lat,
        required this.long,
        required this.createdAt,
        required this.updatedAt,
    });

}
