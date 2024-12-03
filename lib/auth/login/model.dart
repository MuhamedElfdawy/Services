class UserTokenData {
  String? message;
  bool? isAuthenticated;
  String? email;
  String? password;
  List<String>? roles;
  String? token;
  String? expiresOn;
  String? refreshTokenExpiration;
  String? userId;
  String? goverName;
  String? cityName;

  UserTokenData(
      {this.message,
        this.isAuthenticated,
        this.email,
        this.password,
        this.roles,
        this.token,
        this.expiresOn,
        this.refreshTokenExpiration,
        this.userId,
        this.goverName,
        this.cityName
      });

  UserTokenData.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    isAuthenticated = json['isAuthenticated'];
    email = json['email'];
    password = json['password'];
    roles = json['roles'].cast<String>();
    token = json['token'];
    expiresOn = json['expiresOn'];
    refreshTokenExpiration = json['refreshTokenExpiration'];
    userId = json['userId'];
    goverName = json['goverName'];
    cityName = json['cityName'];
  }
}
