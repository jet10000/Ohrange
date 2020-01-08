class ApiConstants {
  static const String API_BASE_URL = "https://ohrange.in/service.php";
}

class ApiSrv {
  static const String CATEGOTY_SRV =  "category";
  static const String PRODUCTS_SRV = "products";
  static const String USER_SRV = "users";
  static const String SUBCATEGORY_SRV = "subcategory";
}

class ApiMethods{
  /* Category */
  static const String GET_CATEGOEY = "GetCatServices";
  /* Sub Category */
  static const String GET_SUBCATEGORY= "GetSubcatByCatId";
  /* Products */
  static const String GET_PRODUCTS = "GetServices";
  static const String GET_SPECIAL_LIST = "GetSpecialListofProducts";
  /* Users */
  static const String LOGIN_METHOD = "checkuserdetails";
  static const String PROFILE_METHOD = "GetSingleUserDataById";
  static const String UPDATE_USER_STATUS = "UpdateUserStatusById";
  static const String CREATE_USER_METHOD = "createuser";
}