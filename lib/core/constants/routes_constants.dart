class AppRoute {
  static const String language = "/language";
  static const String onBoarding = "/onboarding";
  static const String login = "/login";
  static const String signup = "/signup";
  static const String profileSetup = "/profile-setup";
  static const String forgetPassword = "/forget-password";
  static const String emailConfirmation = "/emailConfirmation";
  static const String resetPassword = '/reset-password';
  static const String emailResetPasswordConfirmation = "/email-reset-password-confirmation";

  // Home and navigation
  static const String home = "/home";
  
  // Category routes
  static const String categories = "/categories";
  static const String categoryDetail = "/category/:id";
  
  // Product routes
  static const String productDetail = "/product/:id";
  static const String featuredProducts = "/products/featured";
  static const String newProducts = "/products/new";
  
  // Cart and checkout
  static const String cart = "/cart";
  static const String checkout = "/checkout";
  
  // User profile
  static const String profile = "/profile";
  static const String orders = "/orders";
  static const String wishlist = "/wishlist";

  // public routes
  static const List<String> publicRoutes = [
    language,
    onBoarding,
    login,
    signup,
    forgetPassword,
  ];
}