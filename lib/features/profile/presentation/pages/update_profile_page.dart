import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnika/config/themes/app_palette.dart';
import 'package:furnika/config/themes/media_resources.dart';
import 'package:furnika/core/common/cubits/app_user/app_user_cubit.dart';
import 'package:furnika/core/common/entities/user.dart';
import 'package:furnika/core/common/widgets/app_button.dart';
import 'package:furnika/core/common/widgets/app_text_field.dart';
import 'package:furnika/core/common/widgets/text_field_label.dart';
import 'package:furnika/core/common/widgets/custom_app_bar.dart';
import 'package:furnika/core/utils/formatter.dart';
import 'package:furnika/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:gap/gap.dart';

class UpdateProfilePage extends StatefulWidget {
  const UpdateProfilePage({super.key, required this.user});

  final User user;

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  Gender? _selectedGender;

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value != null) {
        _dobController.text = dateFormatter.format(value);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().loadProfile();
  }

  @override
  Widget build(BuildContext context) {
    _nameController.text = widget.user.userName;
    _emailController.text = widget.user.email;
    if (widget.user.phoneNumber != null) {
      _phoneController.text = widget.user.phoneNumber!;
    }

    return Scaffold(
      appBar: customAppBar(
        title: 'Your Information',
        context: context,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 12.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 104.h,
                      width: 104.h,
                      padding: EdgeInsets.all(28.h),
                      decoration: const BoxDecoration(
                        color: AppPalette.secondary,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(MediaResource.profileIcon),
                    ),
                    Positioned(
                      right: 4.w,
                      bottom: 2.h,
                      child: Container(
                        height: 24.h,
                        width: 24.w,
                        padding: EdgeInsets.all(7.w),
                        decoration: const BoxDecoration(
                          color: AppPalette.primary,
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset(MediaResource.editIcon),
                      ),
                    ),
                  ],
                ),
                Gap(20.h),
                Text(
                  widget.user.userName,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    color: AppPalette.textPrimary,
                  ),
                ),
                Gap(30.h),
                const TextFieldLabel(label: 'Name'),
                Gap(7.h),
                AppTextField(
                  hintText: 'Name',
                  keyboardType: TextInputType.name,
                  controller: _nameController,
                ),
                Gap(20.h),
                const TextFieldLabel(label: 'Phone'),
                Gap(7.h),
                AppTextField(
                  hintText: 'Phone',
                  keyboardType: TextInputType.phone,
                  controller: _phoneController,
                ),
                Gap(20.h),
                const TextFieldLabel(label: 'Email'),
                Gap(7.h),
                AppTextField(
                  hintText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                ),
                Gap(20.h),
                const TextFieldLabel(label: 'DOB'),
                Gap(7.h),
                AppTextField(
                  hintText: 'Date of Birth',
                  keyboardType: TextInputType.datetime,
                  controller: _dobController,
                  readOnly: true,
                  onTap: _showDatePicker,
                ),
                Gap(20.h),
                const TextFieldLabel(label: 'Gender'),
                Gap(7.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: 18.w,
                  ),
                  decoration: BoxDecoration(
                    color: AppPalette.textFieldBackground,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton(
                    value: _selectedGender,
                    hint: Text(
                      'Gender',
                      style: TextStyle(
                        fontSize: 11.sp,
                      ),
                    ),
                    underline: Container(),
                    isExpanded: true,
                    borderRadius: BorderRadius.circular(10),
                    icon: const Icon(Icons.keyboard_arrow_down_rounded),
                    items: Gender.values
                        .map(
                          (gender) => DropdownMenuItem(
                            value: gender,
                            child: Text(gender.name.toUpperCase()),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value == null) {
                        return;
                      }
                      setState(() {
                        _selectedGender = value;
                      });
                    },
                  ),
                ),
                Gap(50.h),
                AppButton(
                  title: 'Update your Profile',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
