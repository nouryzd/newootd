class AppConstants {
  // App branding
  static const String appName = "OOTD Recommender";
  static const String appSlogan = "Your Personal Outfit Assistant";

  // Asset paths
  static const String logoPath = "assets/logo.png";
  static const String placeholderImage = "assets/placeholder.jpg";
  
  // Default outfit images
  static const List<String> defaultOutfitImages = [
    "assets/outfits/outfit1.jpg",
    "assets/outfits/outfit2.jpg",
    "assets/outfits/outfit3.jpg",
    "assets/outfits/outfit4.jpg",
  ];

  // Body shape options
  static const List<String> bodyShapes = [
    "Apple",
    "Pear",
    "Hourglass",
    "Rectangle",
    "Inverted Triangle"
  ];

  // Color options
  static const List<String> colorOptions = [
    "Red",
    "Blue",
    "Black",
    "White",
    "Pink",
    "Green",
    "Yellow",
    "Purple",
    "Gray"
  ];

  // Style tags for outfits
  static const List<String> styleTags = [
    "Casual",
    "Formal",
    "Business",
    "Party",
    "Date Night",
    "Weekend",
    "Vacation",
    "Workout",
    "Streetwear"
  ];

  // Firestore collections
  static const String usersCollection = "users";
  static const String outfitsCollection = "outfits";
  static const String savedOutfitsCollection = "saved_outfits";

  // Storage paths
  static const String outfitImagesPath = "outfit_images/";
  static const String userAvatarsPath = "user_avatars/";

  // App text styles
  static const String fontFamily = "Roboto";
  
  // API endpoints (if using external API)
  static const String weatherApiKey = "YOUR_WEATHER_API_KEY";
  static const String weatherApiUrl = "https://api.openweathermap.org/data/2.5/weather";
  
  // App settings
  static const int maxSavedOutfits = 50;
  static const int recommendationsLimit = 4;
}

class AppColors {
  static const Color primaryColor = Color(0xFF6C5CE7);
  static const Color secondaryColor = Color(0xFF00CEFF);
  static const Color accentColor = Color(0xFFFD79A8);
  static const Color backgroundColor = Color(0xFFF5F6FA);
  static const Color textColor = Color(0xFF2D3436);
  static const Color lightTextColor = Color(0xFF636E72);
}

class AppTextStyles {
  static const TextStyle heading1 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textColor,
  );
  
  static const TextStyle heading2 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: AppColors.textColor,
  );
  
  static const TextStyle bodyText = TextStyle(
    fontSize: 16,
    color: AppColors.lightTextColor,
  );
  
  static const TextStyle buttonText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
}

class AppDimensions {
  static const double defaultPadding = 16.0;
  static const double cardBorderRadius = 12.0;
  static const double buttonHeight = 48.0;
}