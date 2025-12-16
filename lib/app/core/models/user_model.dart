import '../../../modules/health_information/data/models/health_info_model.dart';
import '../constants/app_constants.dart';

class UserModel {
  String? id;
  String? uid;
  String? name;
  String? userName;
  String? photoUrl;
  String? phoneNumber;
  String? email;
  String? password;
  String? typeUser;
  String? state;
  String? googleId;
  String? country;
  HealthInfo? healthInfo;

  UserModel({
    this.id,
    this.uid,
    this.name,
    this.userName,
    this.email,
    this.photoUrl,
    this.phoneNumber,
    this.password,
    this.typeUser,
    this.state,
    this.googleId,
    this.healthInfo,
    this.country,
  });

  bool get isAdmin=>typeUser?.toLowerCase().contains(AppConstants.collectionAdmin.toLowerCase())??false;
  factory UserModel.fromJson(json) {
    var data = ['_JsonDocumentSnapshot','_JsonQueryDocumentSnapshot'].contains(json.runtimeType.toString())?json.data():json;
    String name =
        data["name"] ?? '${json["firstName"] ?? ''} ${json["lastName"] ?? ''}';
    return UserModel(
      id: json['id'],
      uid: json["uid"],
      name: json["name"],
      phoneNumber: json["phoneNumber"],
      userName: json["userName"],
      email: json["email"],
      photoUrl: json["photoUrl"],
      typeUser: json["typeUser"],
       password:data['password'],
      googleId:data['googleId'],
        country:data['country'],
        healthInfo:data["healthInfo"]==null?null:HealthInfo.fromJson(data['healthInfo'])
        // state:data['state']
    );
  }

  factory UserModel.fromMap(json) {

    var data = ['_JsonDocumentSnapshot','_JsonQueryDocumentSnapshot'].contains(json.runtimeType.toString())?json.data():json;
    final healthInfo=data["healthInfo"];
    data["healthInfo"]=null;

    UserModel user=UserModel.fromJson(json);
    user.healthInfo=healthInfo==null?null:HealthInfo.fromMap(healthInfo);

   return user;
  }

  factory UserModel.init() {
    return UserModel(
      id: "",
      uid: '',
      name: '',
      email: '',
      typeUser: '',
    //  password: ''
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'uid': uid,
        'name': name,
        'email': email,
        'userName': userName,
        'phoneNumber': phoneNumber,
        'photoUrl': photoUrl,
        'typeUser': typeUser,
        'googleId': googleId,
        'country': country,
    "healthInfo":healthInfo?.toJson(),
    'password': password==null?null:password,
    // 'password': password==null?null:BCrypt.hashpw(password!, BCrypt.gensalt()),
    // 'state':state,
    // 'password': password,
      };

  Map<String, dynamic> toMap() {
    final map=toJson();

    map['healthInfo']=healthInfo?.toMap();

    return map;
  }


  /// Function to check if the password matches the hashed password
  bool checkPassword(String plainPassword) {
    if(password?.isEmpty??true)
      return true;
    return password==plainPassword;
    // return BCrypt.checkpw(plainPassword, password??"");
  }


  UserModel copyWith({
    String? id,
    String? uid,
    String? name,
    String? userName,
    String? photoUrl,
    String? phoneNumber,
    String? email,
    String? password,
    String? typeUser,
    String? state,
    String? googleId,
    String? country,
    HealthInfo? healthInfo,
  }) {
    return UserModel(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      userName: userName ?? this.userName,
      photoUrl: photoUrl ?? this.photoUrl,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      password: password ?? this.password,
      typeUser: typeUser ?? this.typeUser,
      state: state ?? this.state,
      googleId: googleId ?? this.googleId,
      healthInfo: healthInfo ?? this.healthInfo,
      country: country ?? this.country,
    );
  }
}

//users
class Users {
  List<UserModel> items;

  //DateTime date;

  Users({required this.items});

  factory Users.fromJson(json) {
    List<UserModel> tempUsers = [];

    for (int i = 0; i < json.length; i++) {
      UserModel tempUser = UserModel.fromJson(json[i]);
      tempUser.id = json[i].id;
      tempUsers.add(tempUser);
    }
    return Users(items: tempUsers);
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> tempUsers = [];
    for (UserModel user in items) {
      tempUsers.add(user.toJson());
    }
    return {
      'users': tempUsers,
    };
  }
}
