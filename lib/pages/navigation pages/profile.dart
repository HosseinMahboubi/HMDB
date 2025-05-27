import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hmdb/screens/navigation/controller/navigation_controller.dart';
import 'package:hmdb/screens/authentication/login/login.dart';
import 'package:hmdb/utils/constants/colors.dart';
import 'package:hmdb/utils/constants/sizes.dart';
import 'package:hmdb/utils/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';
import 'package:hmdb/utils/localization/controller/language_controller.dart';
import 'package:hmdb/utils/localization/translation_extension.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileController extends GetxController {
  RxString username = "Hossein Mahboubi".obs;
  RxString email = "Hossein0Mahboubi@gmail.com".obs;
  RxString profileImage = "assets/images/main/commenters/user.png".obs;
  Rx<File?> selectedImageFile = Rx<File?>(null);
  RxBool isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();

    /// --- Initialize dark mode value ---
    isDarkMode.value = Get.isDarkMode;
  }

  void toggleDarkMode() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  void updateUsername(String name) {
    username.value = name;
  }

  void updateEmail(String newEmail) {
    email.value = newEmail;
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();

    /// --- Show a bottom with camera and gallery options ---
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(HMSizes.defaultSpace),
        decoration: BoxDecoration(
          color: Get.isDarkMode ? HMColors.darkerGrey : Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "choose_image_source".translate(Get.context!),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: HMSizes.spaceBtwItems),
            ListTile(
              leading: Icon(
                Iconsax.camera,
                color: Get.isDarkMode
                    ? HMColors.primary
                    : HMColors.buttonSecondary,
              ),
              title: Text(
                "camera".translate(Get.context!),
                style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              onTap: () async {
                Get.back();
                final XFile? image =
                    await picker.pickImage(source: ImageSource.camera);
                if (image != null) {
                  selectedImageFile.value = File(image.path);
                }
              },
            ),
            ListTile(
              leading: Icon(
                Iconsax.gallery,
                color: Get.isDarkMode
                    ? HMColors.primary
                    : HMColors.buttonSecondary,
              ),
              title: Text(
                "gallery".translate(Get.context!),
                style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              onTap: () async {
                Get.back();
                final XFile? image =
                    await picker.pickImage(source: ImageSource.gallery);
                if (image != null) {
                  selectedImageFile.value = File(image.path);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void updateProfileImage() {
    if (selectedImageFile.value != null) {
      profileImage.value = selectedImageFile.value!.path;
      selectedImageFile.value = null;
    }
  }
}

class ProfilePage extends StatelessWidget {
  final String initialUsername;

  const ProfilePage({
    super.key,
    this.initialUsername = "Admin",
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    /// --- Set initial username from navigation ---
    if (controller.username.value == "Admin" && initialUsername != "Admin") {
      controller.username.value = initialUsername;
    }

    final dark = HMHelperFunction.isDarkMode(context);

    /// --- Responsive padding and sizes ---
    final double defaultPadding =
        MediaQuery.of(context).size.width * 0.06; // ~6% of screen width
    final double cardRadius =
        MediaQuery.of(context).size.width * 0.04; // ~4% of screen width
    final double profileImageRadius =
        MediaQuery.of(context).size.width * 0.12; // ~12% of screen width

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) return;

        /// -- NAVIGATE TO HOME PAGE --
        final navController = Get.find<NavigationController>();
        navController.changeIndex(0);
      },
      child: Scaffold(
        backgroundColor: dark ? HMColors.black : HMColors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// -- HEADER --
                  Text(
                    "profile".translate(context),
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: dark ? HMColors.white : HMColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height *
                          0.02), // ~2% of screen height

                  /// -- PROFILE CARD --
                  Container(
                    padding: EdgeInsets.all(MediaQuery.of(context).size.width *
                        0.04), // ~4% of screen width
                    decoration: BoxDecoration(
                      color: dark ? HMColors.darkerGrey : Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(cardRadius),
                      border: dark
                          ? null
                          : Border.all(
                              color: Colors.grey.shade300,
                            ),
                      boxShadow: dark
                          ? null
                          : [
                              BoxShadow(
                                color: Colors.grey.shade200,
                                blurRadius: MediaQuery.of(context).size.width *
                                    0.02, // ~2% of screen width
                                spreadRadius:
                                    MediaQuery.of(context).size.width *
                                        0.005, // ~0.5% of screen width
                              )
                            ],
                    ),
                    child: Column(
                      children: [
                        /// --- Profile Image ---
                        Obx(
                          () => CircleAvatar(
                            radius: profileImageRadius,
                            backgroundImage:
                                AssetImage(controller.profileImage.value),
                            backgroundColor:
                                dark ? HMColors.darkerGrey : HMColors.lightGrey,
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height *
                                0.02), // ~2% of screen height

                        /// -- USERNAME --
                        Obx(() => Text(
                              controller.username.value,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    color:
                                        dark ? HMColors.white : HMColors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                            )),

                        /// -- EMAIL --
                        Obx(
                          () => Text(
                            controller.email.value,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: dark
                                      ? HMColors.lightGrey
                                      : HMColors.darkGrey,
                                ),
                          ),
                        ),

                        SizedBox(
                            height: MediaQuery.of(context).size.height *
                                0.02), // ~2% of screen height

                        /// -- EDIT PROFILE BUTTON --
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () =>
                                _showEditProfileDialog(context, controller),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: dark
                                  ? HMColors.primary
                                  : HMColors.buttonSecondary,
                              foregroundColor:
                                  dark ? HMColors.black : HMColors.white,
                              elevation: 0,
                              padding: EdgeInsets.symmetric(
                                  vertical: MediaQuery.of(context).size.height *
                                      0.02), // ~2% of screen height
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(cardRadius),
                                side: BorderSide(
                                  color: dark
                                      ? Colors.transparent
                                      : Colors.transparent,
                                  width: 0,
                                ),
                              ),
                              shadowColor: Colors.transparent,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              "edit_profile".translate(context),
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: MediaQuery.of(context).size.width *
                                    0.04, // ~4% of screen width
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                      height: MediaQuery.of(context).size.height *
                          0.03), // ~3% of screen height

                  /// -- SETTING SECTION --
                  Text(
                    "setting".translate(context),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: dark ? HMColors.white : HMColors.black,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height *
                          0.02), // ~2% of screen height

                  /// -- SETTING LIST --
                  _buildSettingsTile(
                    context: context,
                    icon: Iconsax.moon,
                    title: "dark_mode".translate(context),
                    dark: dark,
                    trailing: Obx(
                      () => Switch(
                        value: controller.isDarkMode.value,
                        activeColor: HMColors.primary,
                        onChanged: (value) => controller.toggleDarkMode(),
                      ),
                    ),
                  ),

                  _buildSettingsTile(
                    context: context,
                    icon: Iconsax.notification,
                    title: "notifications".translate(context),
                    dark: dark,
                    onTap: () {},
                  ),

                  _buildSettingsTile(
                    context: context,
                    icon: Iconsax.security,
                    title: "privacy_security".translate(context),
                    dark: dark,
                    onTap: () {},
                  ),

                  /// -- LANGUAGE SETTING TITLE --
                  _buildSettingsTile(
                    context: context,
                    icon: Iconsax.language_square,
                    title: "language".translate(context),
                    dark: dark,
                    trailing: Text(
                      "english".translate(context),
                      style: TextStyle(
                        color: dark ? HMColors.lightGrey : HMColors.darkGrey,
                      ),
                    ),
                    onTap: () {
                      /// --- Show language selection dialog ---
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor:
                                dark ? HMColors.darkerGrey : Colors.white,
                            title: Text(
                              "select_language".translate(context),
                              style: TextStyle(
                                color: dark ? Colors.white : Colors.black,
                              ),
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  title: Text(
                                    "english".translate(context),
                                  ),
                                  onTap: () {
                                    Get.find<LanguageController>()
                                        .changeLanguage('en');
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  title: const Text("فارسی"),
                                  onTap: () {
                                    Get.find<LanguageController>()
                                        .changeLanguage('fa');
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),

                  const SizedBox(height: HMSizes.spaceBtwSections),

                  /// -- ACCOUNT SECTION --
                  Text(
                    "account".translate(context),
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: dark ? HMColors.white : HMColors.black,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                  ),
                  const SizedBox(height: HMSizes.spaceBtwItems),

                  _buildSettingsTile(
                    context: context,
                    icon: Iconsax.information,
                    title: "help_&_support".translate(context),
                    dark: dark,
                    onTap: () {
                      /// --- Handle help & support ---
                      Get.snackbar(
                        "profile_support".translate(context),
                        "support_email".translate(context),
                        backgroundColor:
                            dark ? HMColors.primary : HMColors.lightGrey,
                        colorText: Colors.white,
                      );
                    },
                  ),

                  _buildSettingsTile(
                    context: context,
                    icon: Iconsax.star,
                    title: "rate_app".translate(context),
                    dark: dark,
                    onTap: () {},
                  ),

                  _buildSettingsTile(
                    context: context,
                    icon: Iconsax.logout,
                    title: "logout".translate(context),
                    dark: dark,
                    titleColor: Colors.red,
                    onTap: () {
                      /// --- Handle logout ---
                      Get.dialog(
                        AlertDialog(
                          title: Text(
                            "logout".translate(context),
                          ),
                          content: Text(
                            "are_you_sure_you_want_to_logout"
                                .translate(context),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Get.back(),
                              style: TextButton.styleFrom(
                                foregroundColor:
                                    dark ? HMColors.white : HMColors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: BorderSide.none,
                                ),
                                shadowColor: Colors.transparent,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              child: Text(
                                "cancel".translate(context),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.back();

                                /// --- Navigate to login screen after logout ---
                                Get.offAll(() => const LoginScreen());
                              },
                              child: Text(
                                "logout".translate(context),
                                style: const TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsTile({
    required BuildContext context,
    required IconData icon,
    required String title,
    required bool dark,
    Widget? trailing,
    Color? titleColor,
    VoidCallback? onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: dark ? HMColors.darkerGrey : HMColors.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
          border: dark
              ? null
              : Border.all(color: HMColors.primary.withOpacity(0.2)),
        ),
        child: Icon(
          icon,
          color: HMColors.primary,
          size: 22,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: titleColor ?? (dark ? HMColors.white : HMColors.black),
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: trailing ??
          Icon(
            Iconsax.arrow_right_3,
            size: 18,
            color: dark
                ? HMColors.white.withOpacity(0.7)
                : HMColors.black.withOpacity(0.7),
          ),
      onTap: onTap,
    );
  }

  void _showEditProfileDialog(
      BuildContext context, ProfileController controller) {
    final nameController =
        TextEditingController(text: controller.username.value);
    final emailController = TextEditingController(text: controller.email.value);
    final dark = HMHelperFunction.isDarkMode(context);

    Get.dialog(
      AlertDialog(
        title: Text(
          "edit_profile".translate(context),
          style: TextStyle(
            color: dark ? HMColors.white : HMColors.black,
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// --- Profile Image Picker ---
              Center(
                child: Stack(
                  children: [
                    Obx(() {
                      final imageFile = controller.selectedImageFile.value;
                      final currentImage = controller.profileImage.value;

                      return CircleAvatar(
                        radius: 50,
                        backgroundColor:
                            dark ? HMColors.darkerGrey : HMColors.grey,
                        backgroundImage: imageFile != null
                            ? FileImage(imageFile) as ImageProvider
                            : (currentImage.startsWith('assets')
                                    ? AssetImage(currentImage)
                                    : FileImage(File(currentImage)))
                                as ImageProvider,
                      );
                    }),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 35,
                        width: 35,
                        decoration: BoxDecoration(
                          color: dark
                              ? HMColors.primary
                              : HMColors.buttonSecondary,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            Iconsax.camera,
                            size: 20,
                            color: dark ? HMColors.black : HMColors.white,
                          ),
                          onPressed: () => controller.pickImage(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: HMSizes.spaceBtwItems * 2),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Username",
                  prefixIcon: Icon(Iconsax.user),
                ),
              ),
              const SizedBox(height: HMSizes.spaceBtwItems),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Iconsax.message),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            style: TextButton.styleFrom(
              foregroundColor: dark ? HMColors.white : HMColors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide.none,
              ),
              // Remove focus border
              shadowColor: Colors.transparent,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              "cancel".translate(context),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              controller.updateUsername(nameController.text);
              controller.updateEmail(emailController.text);
              controller.updateProfileImage();
              Get.back();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  dark ? HMColors.primary : HMColors.buttonSecondary,
              foregroundColor: dark ? HMColors.black : HMColors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide.none,
              ),
              shadowColor: Colors.transparent,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              "save".translate(context),
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
