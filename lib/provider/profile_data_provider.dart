// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:portfolio/db/database_helper.dart';
import 'package:portfolio/models/profile_data_model.dart';

class ProfileDataProvider extends ChangeNotifier {
  ProfileDataModel? _profile;

  List<ProfileDataModel?> _profiles = [];

  ProfileDataModel? get profile => _profile;

  List<ProfileDataModel?> get profiles => _profiles;

  DataBaseHelper dataBaseHelper = DataBaseHelper();

  Future<void> insertPortfolioProfile(
    BuildContext context,
    ProfileDataModel? profile,
  ) async {
    int id = await dataBaseHelper.insertProfile(profile!.toMap());

    _profile!.id == id;
    _profile = profile;
    notifyListeners();
  }

  Future<void> getAllPortfolioProfiles() async {
    final dataList = await dataBaseHelper.getAllProfiles();
    if (dataList.isNotEmpty) {
      _profiles = dataList.map((data) {
        return ProfileDataModel.fromMap(data);
      }).toList();
    }
    notifyListeners();
  }

  Future<void> getAllPortfolioProfileById(int id) async {
    final data = await dataBaseHelper.getProfileById(id);

    if (_profile?.id == id && data != null) {
      _profile = ProfileDataModel.fromMap(data);
    }
    notifyListeners();
  }

  Future<void> updateProfileProvider(
    int id,
    String field,
    dynamic value,
  ) async {
    await dataBaseHelper.updateProfile(id, {field: value});

    if (_profile?.id == id) {
      final updatedMap = _profile?.toMap();
      updatedMap?[field] = value;

      _profile = ProfileDataModel.fromMap(updatedMap!);
      notifyListeners();
    }
  }

  Future<void> deleteProfile(int id) async {
    await dataBaseHelper.deleteProfile(id);
    if (_profile != null || _profile?.id == id) {
      _profile = null;
      notifyListeners();
    }
  }
}
