import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:traveler_task/constants/app_constants.dart';
import 'package:traveler_task/widgets/responsive_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text(
          AppStrings.appName,
          style: TextStyle(
            color: Colors.white,
            fontSize: ResponsiveWidget.isMobile(context) ? 18.sp : 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ResponsiveWidget(
        mobile: _buildMobileBody(),
        tablet: _buildTabletBody(),
        desktop: _buildDesktopBody(),
      ),
    );
  }

  Widget _buildMobileBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(AppSizes.m),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.h),
            Text(
              'Welcome to ${AppStrings.appName}',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.h),
            Text(
              AppStrings.appDescription,
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30.h),
            _buildContentCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildTabletBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(AppSizes.l),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30.h),
            Text(
              'Welcome to ${AppStrings.appName}',
              style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15.h),
            Text(
              AppStrings.appDescription,
              style: TextStyle(
                fontSize: 18.sp,
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 40.h),
            _buildContentCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(AppSizes.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50.h),
            Text(
              'Welcome to ${AppStrings.appName}',
              style: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
            Text(
              AppStrings.appDescription,
              style: TextStyle(
                fontSize: 20.sp,
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50.h),
            _buildContentCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildContentCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.borderRadiusMedium),
      ),
      child: Padding(
        padding: EdgeInsets.all(AppSizes.l),
        child: Column(
          children: [
            Icon(
              Icons.travel_explore,
              size: 60.sp,
              color: AppColors.primaryColor,
            ),
            SizedBox(height: 20.h),
            Text(
              'Ready to explore?',
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'This is a placeholder for the main content of the app. Once the Figma design is provided, this will be replaced with the actual UI implementation.',
              style: TextStyle(
                fontSize: 16.sp,
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.xl,
                  vertical: AppSizes.m,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(AppSizes.borderRadiusMedium),
                ),
              ),
              child: Text(
                'Get Started',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
