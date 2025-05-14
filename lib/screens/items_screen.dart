import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:traveler_task/constants/app_constants.dart';
import 'package:traveler_task/models/trip_item.dart';
import 'package:traveler_task/widgets/app_navigation_bar.dart';
import 'package:traveler_task/widgets/responsive_text.dart';
import 'package:traveler_task/widgets/responsive_widget.dart';
import 'package:traveler_task/widgets/trip_item_card.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({super.key});

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  int _selectedNavIndex = 0;
  final List<TripItem> _tripItems = TripItem.getSampleItems();

  @override
  Widget build(BuildContext context) {
    final bool isMobile = ResponsiveWidget.isMobile(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Navigation bar
            AppNavigationBar(
              isMobile: isMobile,
              selectedIndex: _selectedNavIndex,
              onItemSelected: (index) {
                setState(() {
                  _selectedNavIndex = index;
                });
              },
            ),

            // Main content
            Expanded(
              child: ResponsiveWidget(
                mobile: _buildMobileContent(context),
                tablet: _buildTabletContent(context),
                desktop: _buildDesktopContent(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDesktopContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSizes.l),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ResponsiveText(
                'Items',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Filter and Add buttons
              Row(
                children: [
                  _buildFilterButton(false),
                  SizedBox(width: AppSizes.m),
                  _buildAddButton(false),
                ],
              ),
            ],
          ),

          SizedBox(height: AppSizes.l),

          // Grid of trip items
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: 0.8,
                crossAxisSpacing: AppSizes.m,
                mainAxisSpacing: AppSizes.m,
              ),
              itemCount: _tripItems.length,
              itemBuilder: (context, index) {
                return TripItemCard(item: _tripItems[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabletContent(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(AppSizes.m),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ResponsiveText(
                'Items',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Filter and Add buttons
              Row(
                children: [
                  _buildFilterButton(false),
                  SizedBox(width: AppSizes.m),
                  _buildAddButton(false),
                ],
              ),
            ],
          ),

          SizedBox(height: AppSizes.m),

          // Grid of trip items
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: AppSizes.m,
                mainAxisSpacing: AppSizes.m,
              ),
              itemCount: _tripItems.length,
              itemBuilder: (context, index) {
                return TripItemCard(item: _tripItems[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileContent(BuildContext context) {
    // Get device width to adjust sizes
    final deviceWidth = MediaQuery.of(context).size.width;
    final isSmallDevice = deviceWidth < 360;

    // Adjust font sizes based on device size
    final double titleFontSize = isSmallDevice ? 20 : 24;

    return Padding(
      padding: EdgeInsets.all(isSmallDevice ? AppSizes.s : AppSizes.m),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ResponsiveText(
                'Items',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),

              // Filter and Add buttons
              Row(
                children: [
                  _buildFilterButton(true),
                  SizedBox(width: isSmallDevice ? 4 : AppSizes.s),
                  _buildAddButton(true, isSmallDevice),
                ],
              ),
            ],
          ),

          SizedBox(height: isSmallDevice ? AppSizes.s : AppSizes.m),

          // List of trip items
          Expanded(
            child: ListView.builder(
              itemCount: _tripItems.length,
              itemBuilder: (context, index) {
                return TripItemCard(
                  item: _tripItems[index],
                  isMobile: true,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(bool isMobile) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundSecondary,
        borderRadius: BorderRadius.circular(12), // More rounded corners
      ),
      child: IconButton(
        icon: Icon(
          IconsaxPlusLinear.setting_4,
          color: Colors.white,
          size: isMobile ? 24 : AppSizes.iconMedium.sp,
        ),
        onPressed: () {},
        padding: isMobile ? const EdgeInsets.all(8) : null,
        constraints: isMobile ? const BoxConstraints() : null,
      ),
    );
  }

  Widget _buildAddButton(bool isMobile, [bool isSmallDevice = false]) {
    if (isMobile && isSmallDevice) {
      // For very small devices, just show an icon button
      return Container(
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(12), // More rounded corners
        ),
        child: IconButton(
          icon: const Icon(
            Iconsax.add,
            color: Colors.black,
          ),
          onPressed: () {},
          padding: const EdgeInsets.all(8),
          constraints: const BoxConstraints(),
        ),
      );
    }

    return ElevatedButton.icon(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.black,
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? AppSizes.s : AppSizes.l,
          vertical: isMobile ? AppSizes.xs : AppSizes.l,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // More rounded corners
        ),
      ),
      icon: Icon(
        Icons.add,
        color: Colors.black,
        size: isMobile ? 20 : AppSizes.iconMedium.sp,
      ),
      label: ResponsiveText(
        'Add a New Item',
        style: TextStyle(
          fontSize: isMobile ? 14 : 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
