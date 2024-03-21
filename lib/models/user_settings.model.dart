enum LoginType {
  notSet,
  deviceLogin,
  custom,
}

const loginTypeKey = "loginType";

class UserSettingsModel {
  final LoginType loginType;
  const UserSettingsModel({
    required this.loginType,
  });

  factory UserSettingsModel.fromJson(Map<String, dynamic> json) {
    return UserSettingsModel(
      loginType: json[loginTypeKey] != null
          ? LoginType.values.elementAt(json[loginTypeKey])
          : LoginType.notSet,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      loginTypeKey: loginType.index,
    };
  }

  UserSettingsModel copyWith({
    loginType,
  }) {
    return UserSettingsModel(
      loginType: loginType ?? this.loginType,
    );
  }
}
