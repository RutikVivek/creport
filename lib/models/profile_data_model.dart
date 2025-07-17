class ProfileDataModel {
  int? id;
  String? fullName;
  String? profilePhoto;
  String? profession;
  String? bio;
  String? mobileNumber;
  String? address;
  String? linkedin;
  String? github;
  String? facebook;
  String? instagram;
  String? twitter;

  ProfileDataModel({
    this.id,
    this.fullName,
    this.profilePhoto,
    this.profession,
    this.bio,
    this.mobileNumber,
    this.address,
    this.linkedin,
    this.github,
    this.facebook,
    this.instagram,
    this.twitter,
  });

  factory ProfileDataModel.fromMap(Map<String, dynamic> map) {
    return ProfileDataModel(
      id: map['id'],
      fullName: map['full_name'],
      profilePhoto: map['profile_photo'],
      profession: map['profession'],
      bio: map['bio'],
      mobileNumber: map['mobile_number'],
      address: map['address'],
      linkedin: map['linkedin'],
      github: map['github'],
      facebook: map['facebook'],
      instagram: map['instagram'],
      twitter: map['twitter'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'full_name': fullName,
      'profile_photo': profilePhoto,
      'profession': profession,
      'bio': bio,
      'mobile_number': mobileNumber,
      'address': address,
      'linkedin': linkedin,
      'github': github,
      'facebook': facebook,
      'instagram': instagram,
      'twitter': twitter,
    };
  }

  factory ProfileDataModel.fromJson(Map<String, dynamic> map) {
    return ProfileDataModel.fromMap(map);
  }

  Map<String, dynamic> toJson() {
    return toMap();
  }
}
