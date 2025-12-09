import 'package:pillwise_app/app/core/constants/app_constants.dart';

class MedicineModel {
  String? id;
  String? tradeName;
  String? scientificName;
  num? publicPrice;
  String? strength;
  String? strengthUnit;
  String? pharmaceuticalForm;
  String? administrationRoute;
  num? shelfLife;
  String? storageConditionArabic;

  PackageDetails? packageDetails;
  TechnicalDetails? technicalDetails;
  Logistics? logistics;
  Ids? ids;
  List<UserMedicineModel> idUsers;
  // List<String> idUsers;

  MedicineModel({

    this.id,
    this.tradeName,
    this.scientificName,
    this.publicPrice,
    this.strength,
    this.strengthUnit,
    this.pharmaceuticalForm,
    this.administrationRoute,
    this.shelfLife,
    this.storageConditionArabic,
    this.packageDetails,
    this.technicalDetails,
    this.logistics,
    this.ids,
    required this.idUsers
  });

  bool userIsAdd(String id) => idUsers.any((e) => e.idUser == id);
  bool updateIdUsers({required UserMedicineModel userMedicine}) {
    final index = idUsers.indexWhere((e) => e.idUser == userMedicine.idUser);
    if (index == -1) {
      return false;
    }
    idUsers[index] = userMedicine;
    return true;
  }
  UserMedicineModel? removeById(String id) {
    final index = idUsers.indexWhere((e) => e.idUser == id);
    if (index == -1) {
      return null;
    }
   return idUsers.removeAt(index);
  }
  UserMedicineModel? getById(String id) {
    final index = idUsers.indexWhere((e) => e.idUser == id);
    if (index == -1) {
      return null;
    }
    return idUsers[index];
  }

  set setIdUsers(String id)=>userIsAdd(id)?'':idUsers.add(UserMedicineModel(idUser: id));
  set setUserMedicine(UserMedicineModel userMedicine)=>userIsAdd(userMedicine.idUser!)?'':idUsers.add(userMedicine);
  // set setIdUsers(String id)=>userIsAdd(id)?'':idUsers.add(id);
  factory MedicineModel.fromJson( json) {
    var data = ['_JsonDocumentSnapshot','_JsonQueryDocumentSnapshot'].contains(json.runtimeType.toString())?json.data():json;
    List<UserMedicineModel> tempIdUsers = [];

    for (int i = 0; i < (data['idUsers']?.length??0); i++) {
      UserMedicineModel tempIdUser = UserMedicineModel.fromJson(data['idUsers'][i]);
      tempIdUsers.add(tempIdUser);
    }

    return MedicineModel(
      id: data['id'],
      tradeName: data['trade_name'],
      scientificName: data['scientific_name'],
      publicPrice: data['public_price'],
      strength: data['strength'].toString(),
      strengthUnit: data['strength_unit'],
      pharmaceuticalForm: data['pharmaceutical_form'],
      administrationRoute: data['administration_route'],
      shelfLife: data['shelf_life'],
      storageConditionArabic: data['storage_condition_arabic'],
      idUsers: tempIdUsers,
      packageDetails: data['package_details'] != null
          ? PackageDetails.fromJson(data['package_details'])
          : null,
      technicalDetails: data['technical_details'] != null
          ? TechnicalDetails.fromJson(data['technical_details'])
          : null,
      logistics: data['logistics'] != null
          ? Logistics.fromJson(data['logistics'])
          : null,
      ids: data['ids'] != null ? Ids.fromJson(data['ids']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> tempUsers = [];
    for (UserMedicineModel user in idUsers) {
      tempUsers.add(user.toJson());
    }
    return {
      'id': id,
      'trade_name': tradeName,
      'scientific_name': scientificName,
      'public_price': publicPrice,
      'strength': strength,
      'strength_unit': strengthUnit,
      'pharmaceutical_form': pharmaceuticalForm,
      'administration_route': administrationRoute,
      'shelf_life': shelfLife,
      'idUsers': tempUsers,
      // 'idUsers': idUsers,
      'storage_condition_arabic': storageConditionArabic,
      'package_details': packageDetails?.toJson(),
      'technical_details': technicalDetails?.toJson(),
      'logistics': logistics?.toJson(),
      'ids': ids?.toJson(),
    };
  }
}


//Medicines
class Medicines {
  List<MedicineModel> items;


  Medicines({required this.items});

  factory Medicines.fromJson(json) {
    List<MedicineModel> tempItems = [];

    for (int i = 0; i < json.length; i++) {
      MedicineModel tempItem = MedicineModel.fromJson(json[i]);
      tempItem.id = json[i].id;
      tempItems.add(tempItem);
    }
    return Medicines(items: tempItems);
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> tempItems = [];
    for (MedicineModel item in items) {
      tempItems.add(item.toJson());
    }
    return {
      'medicines': tempItems,
    };
  }
}



class PackageDetails {
  String? size;
  String? sizeUnit;
  String? packageTypes;
  num? packageSize;

  PackageDetails({
    this.size,
    this.sizeUnit,
    this.packageTypes,
    this.packageSize,
  });

  factory PackageDetails.fromJson( json) {
    var data = ['_JsonDocumentSnapshot','_JsonQueryDocumentSnapshot'].contains(json.runtimeType.toString())?json.data():json;

    return PackageDetails(
      size: data['size']?.toString(),
      sizeUnit: data['size_unit'],
      packageTypes: data['package_types'],
      packageSize: data['package_size'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'size': size,
      'size_unit': sizeUnit,
      'package_types': packageTypes,
      'package_size': packageSize,
    };
  }
}

class TechnicalDetails {
  String? productType;
  String? drugType;
  String? atcCode1;
  String? atcCode2;
  String? legalStatus;
  String? productControl;
  String? authorizationStatus;

  TechnicalDetails({
    this.productType,
    this.drugType,
    this.atcCode1,
    this.atcCode2,
    this.legalStatus,
    this.productControl,
    this.authorizationStatus,
  });

  factory TechnicalDetails.fromJson( json) {
    var data = ['_JsonDocumentSnapshot','_JsonQueryDocumentSnapshot'].contains(json.runtimeType.toString())?json.data():json;

    return TechnicalDetails(
      productType: data['product_type'],
      drugType: data['drug_type'],
      atcCode1: data['atc_code1'],
      atcCode2: data['atc_code2'],
      legalStatus: data['legal_status'],
      productControl: data['product_control'],
      authorizationStatus: data['authorization_status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_type': productType,
      'drug_type': drugType,
      'atc_code1': atcCode1,
      'atc_code2': atcCode2,
      'legal_status': legalStatus,
      'product_control': productControl,
      'authorization_status': authorizationStatus,
    };
  }
}

class Logistics {
  String? marketingCompany;
  String? marketingCountry;
  String? manufacturerName;
  String? manufacturerCountry;
  String? secondaryPackageManufacturer;
  String? mainAgent;
  String? secondAgent;
  String? thirdAgent;
  String? distributeArea;

  Logistics({
    this.marketingCompany,
    this.marketingCountry,
    this.manufacturerName,
    this.manufacturerCountry,
    this.secondaryPackageManufacturer,
    this.mainAgent,
    this.secondAgent,
    this.thirdAgent,
    this.distributeArea,
  });

  factory Logistics.fromJson( json) {
    var data = ['_JsonDocumentSnapshot','_JsonQueryDocumentSnapshot'].contains(json.runtimeType.toString())?json.data():json;

    return Logistics(
      marketingCompany: data['marketing_company'],
      marketingCountry: data['marketing_country'],
      manufacturerName: data['manufacturer_name'],
      manufacturerCountry: data['manufacturer_country'],
      secondaryPackageManufacturer: data['secondary_package_manufacturer'],
      mainAgent: data['main_agent'],
      secondAgent: data['second_agent'],
      thirdAgent: data['third_agent'],
      distributeArea: data['distribute_area'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'marketing_company': marketingCompany,
      'marketing_country': marketingCountry,
      'manufacturer_name': manufacturerName,
      'manufacturer_country': manufacturerCountry,
      'secondary_package_manufacturer': secondaryPackageManufacturer,
      'main_agent': mainAgent,
      'second_agent': secondAgent,
      'third_agent': thirdAgent,
      'distribute_area': distributeArea,
    };
  }
}

class Ids {
  String? registerNumber;
  String? referenceNumber;
  String? oldRegisterNumber;
  String? descriptionCode;
  num? lastUpdate;

  Ids({
    this.registerNumber,
    this.referenceNumber,
    this.oldRegisterNumber,
    this.descriptionCode,
    this.lastUpdate,
  });

  factory Ids.fromJson( json) {
    var data = ['_JsonDocumentSnapshot','_JsonQueryDocumentSnapshot'].contains(json.runtimeType.toString())?json.data():json;

    return Ids(
      registerNumber: data['register_number'].toString(),
      referenceNumber: data['reference_number'],
      oldRegisterNumber: data['old_register_number'],
      descriptionCode: data['description_code'],
      lastUpdate: data['last_update'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'register_number': registerNumber,
      'reference_number': referenceNumber,
      'old_register_number': oldRegisterNumber,
      'description_code': descriptionCode,
      'last_update': lastUpdate,
    };
  }
}

class UserMedicineModel {
  String? idUser;
  String? selectedTime;
  String? periods;
  String? strength;
  String? strengthUnit;
  LocalizedTextModel? strengthDesc;

  UserMedicineModel({
    this.idUser,
    this.selectedTime,
    this.periods,
    this.strength,
    this.strengthUnit,
    this.strengthDesc,
  });

  factory UserMedicineModel.fromJson( json) {
    var data = ['_JsonDocumentSnapshot','_JsonQueryDocumentSnapshot'].contains(json.runtimeType.toString())?json.data():json;

    return UserMedicineModel(
      idUser: data['idUser'].toString(),
      selectedTime: data['selectedTime'],
      periods: data['periods'],
      strength: data['strength'],
      strengthUnit: data['strengthUnit'],
      strengthDesc: data['strengthDesc']==null?null:LocalizedTextModel.fromJson(data['strengthDesc']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idUser': idUser,
      'selectedTime': selectedTime,
      'periods': periods,
      'strength': strength,
      'strengthUnit': strengthUnit,
      'strengthDesc': strengthDesc?.toJson(),
    };
  }
}

class LocalizedTextModel {
  String? ar;
  String? en;

  LocalizedTextModel({
    this.ar,
    this.en,
  });


  String get text {
    return translate(en??"", ar??"");
  }

  factory LocalizedTextModel.fromJson(dynamic json) {
    if (json == null) return LocalizedTextModel();

    return LocalizedTextModel(
      ar: json['ar'],
      en: json['en'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ar': ar,
      'en': en,
    };
  }
}