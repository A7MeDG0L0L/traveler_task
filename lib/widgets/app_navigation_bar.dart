import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:traveler_task/constants/app_constants.dart';
import 'package:traveler_task/widgets/app_logo.dart';
import 'package:traveler_task/widgets/responsive_text.dart';

class AppNavigationBar extends StatelessWidget {
  final bool isMobile;
  final int selectedIndex;
  final Function(int) onItemSelected;

  const AppNavigationBar({
    super.key,
    this.isMobile = false,
    this.selectedIndex = 0,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    if (isMobile) {
      return _buildMobileNavBar(context);
    } else {
      return _buildDesktopNavBar(context);
    }
  }

  Widget _buildDesktopNavBar(BuildContext context) {
    return Container(
      height: 100.h,
      decoration: BoxDecoration(
        color: AppColors.backgroundPrimary,
        border: BorderDirectional(
            bottom: BorderSide(color: Colors.grey.withOpacity(0.2))),
      ),
      padding: EdgeInsets.symmetric(horizontal: AppSizes.xl),
      child: Row(
        children: [
          // Logo
          const AppLogo(),

          const Spacer(), // Push the following items to the right

          // Navigation items
          Row(
            children: _buildNavItems(context),
          ),

          // Divider
          _buildVerticalDivider(),

          // Settings icon
          IconButton(
            icon: Icon(
              Iconsax.setting_2_copy,
              color: Colors.white,
              size: AppSizes.iconMedium.sp,
            ),
            onPressed: () {},
          ),

          // Divider
          _buildVerticalDivider(),

          // Notification icon
          IconButton(
            icon: Icon(
              Iconsax.notification_copy,
              color: Colors.white,
              size: AppSizes.iconMedium.sp,
            ),
            onPressed: () {},
            tooltip: 'Notifications',
          ),

          // Divider
          _buildVerticalDivider(),

          // User avatar and name
          _buildUserProfile(context),
        ],
      ),
    );
  }

  Widget _buildMobileNavBar(BuildContext context) {
    // Get device width to adjust sizes
    final deviceWidth = MediaQuery.of(context).size.width;
    final isSmallDevice = deviceWidth < 360;

    // Adjust icon size for very small devices
    final iconSize = isSmallDevice ? 22.0 : 24.0;

    return Container(
      height: 64,
      color: AppColors.backgroundPrimary,
      padding: EdgeInsets.only(right: isSmallDevice ? AppSizes.s : AppSizes.m),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.,
        children: [
          // Menu icon
          IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
              size: iconSize,
            ),
            onPressed: () {},
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),

          // Logo
          const AppLogo(fontSize: 24, useFontSizeDirectly: true),
          Spacer(),
          // User avatar and settings
          Row(
            children: [
              IconButton(
                icon: Icon(
                  Iconsax.setting_2_copy,
                  color: Colors.white,
                  size: iconSize,
                ),
                onPressed: () {},
                padding: EdgeInsets.all(isSmallDevice ? 4 : 8),
                constraints: const BoxConstraints(),
              ),
              SizedBox(width: isSmallDevice ? 4 : AppSizes.xs),
              IconButton(
                icon: Icon(
                  Iconsax.notification_copy,
                  color: Colors.white,
                  size: iconSize,
                ),
                onPressed: () {},
                padding: EdgeInsets.all(isSmallDevice ? 4 : 8),
                constraints: const BoxConstraints(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: VerticalDivider(
                  color: Colors.grey.shade600,
                ),
              ),
              SizedBox(width: isSmallDevice ? 4 : AppSizes.xs),
              _buildUserAvatar(context, true),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _buildNavItems(BuildContext context) {
    List<Widget> items = [];

    for (int i = 0; i < AppStrings.navItems.length; i++) {
      // Add divider before items except the first one
      if (i > 0) {
        items.add(SizedBox(width: 16.w));
      }

      bool isSelected = i == selectedIndex;
      items.add(
        InkWell(
          onTap: () => onItemSelected(i),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: AppSizes.m,
              vertical: AppSizes.s,
            ),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color:
                      isSelected ? AppColors.primaryColor : Colors.transparent,
                  width: 2.0,
                ),
              ),
            ),
            child: ResponsiveText(
              AppStrings.navItems[i],
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey,
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.w400 : FontWeight.w100,
              ),
            ),
          ),
        ),
      );
    }

    return items;
  }

  Widget _buildVerticalDivider() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        height: 24.h,
        width: 1,
        color: Colors.white.withOpacity(0.2),
      ),
    );
  }

  Widget _buildUserProfile(BuildContext context) {
    return Row(
      children: [
        _buildUserAvatar(context, false),
        SizedBox(width: 10.w),
        Row(
          children: [
            ResponsiveText(
              'Ahmed Galal',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(width: 6.w),
            Icon(
              Icons.keyboard_arrow_down_outlined,
              color: Colors.white,
              size: 16.sp,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildUserAvatar(BuildContext context, bool isMobile) {
    // Get device width to adjust sizes
    final deviceWidth = MediaQuery.of(context).size.width;
    final isSmallDevice = deviceWidth < 360;

    // Adjust avatar size for mobile
    final double avatarSize = isMobile
        ? isSmallDevice
            ? 28
            : 32
        : 36.w;

    final double fontSize = isMobile
        ? isSmallDevice
            ? 10
            : 12
        : 14;

    return CircleAvatar(
      backgroundImage: NetworkImage(
        'https://images.unsplash.com/photo-1633332755192-727a05c4013d?q=80&w=3280&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      ),
      radius: 15,
    );
    return Container(
      width: avatarSize,
      height: avatarSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primaryColor.withOpacity(0.2),
        border: Border.all(
          color: AppColors.primaryColor,
          width: 1.5,
        ),
      ),
      child: ClipOval(
        child: Stack(
          children: [
            Center(
              child: ResponsiveText(
                'AR',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize,
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                width: isMobile ? 8 : 10,
                height: isMobile ? 8 : 10,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.backgroundPrimary,
                    width: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
