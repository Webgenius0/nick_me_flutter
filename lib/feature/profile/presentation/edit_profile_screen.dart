import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nick_me/assets_helper/app_images.dart';
import 'package:nick_me/assets_helper/app_colors.dart';
import 'package:nick_me/assets_helper/app_fonts.dart';
import 'package:nick_me/common_widgets/custom_app_bar.dart';
import 'package:nick_me/helpers/loding_indicator_widgets.dart';
import 'package:nick_me/helpers/toast.dart';
import 'package:nick_me/networks/api_acess.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    if (getProfileDataRXObj.dataFetcher.hasValue) {
      final user = getProfileDataRXObj.dataFetcher.value.data?.user;
      if (user != null) {
        final name = "${user.firstName}".trim();
        _nameController.text = name.isNotEmpty ? name : (user.username ?? "");
      }
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(
      source: source,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _showImagePickerDialog() {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColor.c242424,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: const Icon(Icons.camera_alt, color: Colors.white),
                  title: const Text(
                    'Camera',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.camera);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_library, color: Colors.white),
                  title: const Text(
                    'Gallery',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.gallery);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = getProfileDataRXObj.dataFetcher.hasValue
        ? getProfileDataRXObj.dataFetcher.value.data?.user
        : null;
    final avatar = user?.avatar;
    String avatarUrl = "";
    if (avatar != null && avatar.isNotEmpty) {
      if (avatar.startsWith('http')) {
        avatarUrl = avatar;
      } else if (avatar.startsWith('/')) {
        avatarUrl = "https://admin.askthestoics.com$avatar";
      } else {
        avatarUrl = "https://admin.askthestoics.com/$avatar";
      }
    }

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.splashScreen),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10.h),
                  CustomAppBar(
                    trailing: GestureDetector(
                      onTap: () async {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) =>
                              loadingIndicatorCircle(context: context),
                        );
                        bool updateSuccess = await getUpdateProfileRxObj
                            .updateProfile(
                              name: _nameController.text.trim(),
                              avatar: _selectedImage,
                            );

                        Navigator.of(context, rootNavigator: true).pop();
                        if (updateSuccess) {
                          getProfileDataRXObj.profileDataGet();
                          Navigator.pop(context);
                        } else {
                          ToastUtil.showShortToast("Failed to update profile");
                        }
                      },
                      child: Text(
                        "Save",
                        style: TextFontStyle.textStyle14cFFFFFFInterW500
                            .copyWith(fontSize: 16.sp),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Stack(
                    children: [
                      Container(
                        width: 100.w,
                        height: 100.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColor.cFFFFFF.withValues(alpha: 0.1),
                            width: 2,
                          ),
                          image: DecorationImage(
                            image: _selectedImage != null
                                ? FileImage(_selectedImage!)
                                : (avatarUrl.isNotEmpty
                                          ? NetworkImage(avatarUrl)
                                          : NetworkImage(
                                              "https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=150&auto=format&fit=crop",
                                            ))
                                      as ImageProvider,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: _showImagePickerDialog,
                          child: Container(
                            padding: EdgeInsets.all(6.w),
                            decoration: BoxDecoration(
                              color: Colors.black.withValues(alpha: 0.5),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColor.cFFFFFF.withValues(alpha: 0.1),
                              ),
                            ),
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: AppColor.cFFFFFF,
                              size: 16.sp,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Change Photo",
                      style: TextFontStyle.textStyle14cFFFFFFInterW500.copyWith(
                        color: AppColor.cFFFFFF.withValues(alpha: 0.6),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "FULL NAME",
                      style: TextFontStyle.textStyle14cFFFFFFInterW500.copyWith(
                        color: AppColor.cFFFFFF.withValues(alpha: 0.4),
                        letterSpacing: 1.5,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.c444F5E.withValues(alpha: 0.5),
                      borderRadius: BorderRadius.circular(16.r),
                      border: Border.all(
                        color: AppColor.cFFFFFF.withValues(alpha: 0.1),
                      ),
                    ),
                    child: TextField(
                      controller: _nameController,
                      style: TextFontStyle.textStyle16cFFFFFFInterW600.copyWith(
                        fontWeight: FontWeight.w400,
                        color: AppColor.cFFFFFF.withValues(alpha: 0.8),
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
