class todo {
  String details;

  DateTime currentTime;

  DateTime updatedTime;

  String status ;

  todo({
    required this.details ,
    required this.currentTime ,
    required this.updatedTime ,
    this.status = 'pending'

  });

}