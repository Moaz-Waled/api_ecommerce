class ApiEndpoint {
  static String baseUrl = "https://dummyjson.com/";
  static String getProducts = "products";
  static String getCategories = "products/categories";
  static String search = "products/search";
  
  static String getCategoryProducts(String slug) => "products/category/$slug";
}

class ApiKey {}
