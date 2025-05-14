import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:intl/intl.dart';
import 'package:octo_image/octo_image.dart';
import 'package:traveler_task/constants/app_constants.dart';
import 'package:traveler_task/models/trip_item.dart';
import 'package:traveler_task/widgets/responsive_text.dart';

class TripItemCard extends StatelessWidget {
  final TripItem item;
  final bool isMobile;

  const TripItemCard({
    super.key,
    required this.item,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    // Get actual device width to adjust sizes for mobile
    final deviceWidth = MediaQuery.of(context).size.width;
    final isSmallDevice = deviceWidth < 450;

    // Adjust sizes for mobile
    final double cardHeight = isMobile
        ? isSmallDevice
            ? 320
            : 350
        : AppSizes.cardHeight;

    // Font size adjustments
    final double titleFontSize = isMobile
        ? isSmallDevice
            ? 18
            : 20
        : 18;

    final double statusFontSize = isMobile
        ? isSmallDevice
            ? 12
            : 14
        : 12;

    final double dateFontSize = isMobile
        ? isSmallDevice
            ? 12
            : 14
        : 12;

    final double taskFontSize = isMobile
        ? isSmallDevice
            ? 12
            : 14
        : 12;

    // Use a more rounded corner radius to match the design
    final double cardBorderRadius = 10.0;

    return Container(
      width: isMobile ? double.infinity : AppSizes.cardWidth.w,
      height: isMobile ? cardHeight : AppSizes.cardHeight.h,
      margin: EdgeInsets.all(isMobile ? AppSizes.s / 2 : AppSizes.xs),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(cardBorderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(cardBorderRadius),
        child: Column(
          children: [
            // Image section with menu button
            Expanded(
              flex: 3, // 60% of card height
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Background image
                  Image.asset(
                    item.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: AppColors.accentColor,
                        child: Center(
                          child: Icon(
                            Iconsax.image,
                            color: Colors.white,
                            size: isMobile ? 36 : AppSizes.iconLarge.sp,
                          ),
                        ),
                      );
                    },
                  ),

                  // Gradient overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black87,
                        ],
                        stops: const [0.7, 1.0],
                      ),
                    ),
                  ),

                  // Menu button
                  Positioned(
                    top: 8,
                    right: 8,
                    child: IconButton(
                      icon: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade600,
                        ),
                        child: Icon(
                          Icons.more_horiz_outlined,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    left: 12,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSizes.s,
                        vertical: AppSizes.xs,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          color: AppColors.primaryColor,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ResponsiveText(
                            item.status,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: statusFontSize,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: AppSizes.xs),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                            size: isMobile ? 16 : 16.sp,
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: isMobile ? AppSizes.xs : AppSizes.s),
                ],
              ),
            ),

            // Content section
            Expanded(
              flex: 2, // 40% of card height
              child: Container(
                padding: EdgeInsets.all(isMobile ? AppSizes.s : AppSizes.m),
                color: AppColors.cardBackground,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Status badge

                    // Title
                    ResponsiveText(
                      item.title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: titleFontSize,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    SizedBox(height: isMobile ? AppSizes.xs : AppSizes.s),

                    // Date info
                    Row(
                      children: [
                        Icon(
                          Iconsax.calendar_2_copy,
                          color: Colors.white,
                          size: isMobile ? 14 : 14.sp,
                        ),
                        SizedBox(width: AppSizes.xs),
                        Expanded(
                          child: ResponsiveText(
                            '${item.nights} Nights (${DateFormat('MMM dd').format(item.startDate)} - ${DateFormat('MMM dd, yyyy').format(item.endDate)})',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: dateFontSize,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: isMobile ? AppSizes.xs : AppSizes.s),
                    Divider(
                      color: Colors.grey.shade800.withOpacity(0.5),
                    ),
                    const Spacer(),

                    // User avatars and task count
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // User avatars
                        SizedBox(
                          width: isMobile ? 90 : 90.w,
                          height: isMobile ? 35 : 35.h,
                          child: Stack(
                            children: _buildUserAvatars(isMobile),
                          ),
                        ),

                        // Task count
                        ResponsiveText(
                          '${item.unfinishedTasks} unfinished tasks',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: taskFontSize,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'confirmed':
        return AppColors.success.withOpacity(0.8);
      case 'in progress':
        return AppColors.info.withOpacity(0.8);
      case 'pending approval':
        return AppColors.primaryColor;
      default:
        return AppColors.primaryColor;
    }
  }

  List<Widget> _buildUserAvatars(bool isMobile) {
    List<Widget> avatars = [];

    for (int i = 0; i < item.assignedUsers.length; i++) {
      if (i < 3) {
        final user = item.assignedUsers[i];

        avatars.add(
          Positioned(
              left: isMobile ? i * 20 : i * 15.w,
              child: ClipRRect(
                clipBehavior: Clip.hardEdge,
                child: CircleAvatar(
                  backgroundImage:
                      CachedNetworkImageProvider(user.profileImageUrl),
                  radius: 15.r,
                ),
              )),
        );
      }
    }

    // Add the +X more indicator if there are more than 3 users
    if (item.assignedUsers.length > 3) {
      avatars.add(
        Positioned(
            left: isMobile ? 3 * 20 : 3 * 15.w,
            child: CircleAvatar(
              backgroundColor: Colors.grey.shade700,
              radius: 15.r,
              child: Text(
                '+${item.assignedUsers.length - 3}',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: isMobile ? 10 : 10.sp,
                ),
              ),
            )),
      );
    }

    return avatars;
  }

  String _getInitials(String name) {
    List<String> nameParts = name.split(' ');
    if (nameParts.length > 1) {
      return nameParts[0][0] + nameParts[1][0];
    } else {
      return name.length > 0 ? name[0] : '';
    }
  }
}
