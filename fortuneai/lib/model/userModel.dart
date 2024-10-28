class UserModel {
  // Sınıfın yalnızca bir örneğini tutacak olan statik değişken
  static final UserModel _instance = UserModel._internal();

  // Private (özel) constructor - sadece sınıf içinde erişilebilir
  UserModel._internal();

  // Factory constructor, her zaman aynı instance'ı döndürür
  factory UserModel() {
    return _instance;
  }

  // Sınıfın özellikleri
  String username = "";
  String birthDate = "";
  String birthTime = "";
  String relationshipStatus = "";
  String aboutuser = "";
}
