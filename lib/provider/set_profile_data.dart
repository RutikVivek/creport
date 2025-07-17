import 'package:flutter/foundation.dart';
import 'package:portfolio/models/profile_data_model.dart';

class SetProfileDataProvider extends ChangeNotifier {
  ProfileDataModel? _profile;

  ProfileDataModel? get profile => _profile;

  int? get id => _profile?.id;
  String? get fullname => _profile?.fullName;
  String? get profilePhoto => _profile?.profilePhoto;
  String? get profession => _profile?.profession;
  String? get bio => _profile?.bio;
  String? get mobileNumber => _profile?.mobileNumber;
  String? get address => _profile?.address;
  String? get linkedin => _profile?.linkedin;
  String? get github => _profile?.github;
  String? get facebook => _profile?.facebook;
  String? get instagram => _profile?.instagram;
  String? get twitter => _profile?.twitter;

  void setID(int value) {
    _profile?.id = value;
    notifyListeners();
  }

  void setFullName(String? value) {
    _profile?.fullName = value;
    notifyListeners();
  }

  void setprofilePhoto(String? value) {
    _profile?.profilePhoto = value;
    notifyListeners();
  }

  void setProfession(String? value) {
    _profile?.profession = value;
    notifyListeners();
  }

  void setBio(String? value) {
    _profile?.bio = value;
    notifyListeners();
  }

  void setMobileNumber(String? value) {
    _profile?.mobileNumber = value;
    notifyListeners();
  }

  void setAddress(String? value) {
    _profile?.address = value;
    notifyListeners();
  }

  void setLinkedIn(String? value) {
    _profile?.linkedin = value;
    notifyListeners();
  }

  void setGithub(String? value) {
    _profile?.github = value;
    notifyListeners();
  }

  void setInstagram(String? value) {
    _profile?.instagram = value;
    notifyListeners();
  }

  void setTwitter(String? value) {
    _profile?.twitter = value;
    notifyListeners();
  }

  void setFacebook(String? value) {
    _profile?.facebook = value;
    notifyListeners();
  }
}
