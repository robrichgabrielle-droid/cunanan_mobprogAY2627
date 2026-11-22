import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';
import 'custom_text.dart';

class NewsFeedCard extends StatelessWidget {
  const NewsFeedCard({
    super.key,
    required this.userName,
    required this.postContent,
    required this.date,
    this.numOfLikes = 0,
    this.imagePath,
    this.avatarPath,
  });

  final String userName;
  final String postContent;
  final String date;
  final int numOfLikes;
  final String? imagePath;
  final String? avatarPath;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.r),
      child: Padding(
        padding: EdgeInsets.all(10.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20.r,
                  child: avatarPath == null
                      ? const Icon(Icons.person)
                      : Image.asset(
                          avatarPath!,
                          width: 40.r,
                          height: 40.r,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.person),
                        ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: userName,
                        fontSize: 15.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      Row(
                        children: [
                          CustomText(
                            text: date,
                            fontSize: 12.sp,
                            color: Colors.grey,
                          ),
                          SizedBox(width: 3.w),
                          Icon(Icons.public, color: Colors.grey, size: 15.sp),
                        ],
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.more_horiz),
              ],
            ),
            SizedBox(height: 8.h),
            CustomText(text: postContent, fontSize: 12.sp, color: Colors.black),
            if (imagePath != null) ...[
              SizedBox(height: 8.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: SizedBox(
                  width: double.infinity,
                  height: 200.h,
                  child: Image.asset(
                    imagePath!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        const Placeholder(),
                  ),
                ),
              ),
            ],
            SizedBox(height: 4.h),
            Row(
              children: [
                Expanded(
                  child: PostActionButton(
                    icon: Icons.thumb_up,
                    label: numOfLikes.toString(),
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: PostActionButton(
                    icon: Icons.comment,
                    label: 'Comment',
                    onPressed: () {},
                  ),
                ),
                Expanded(
                  child: PostActionButton(
                    icon: Icons.redo,
                    label: 'Share',
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.h),
            Row(
              children: [
                CircleAvatar(
                  radius: 16.r,
                  child: const Icon(Icons.person, size: 18),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    alignment: Alignment.centerLeft,
                    height: 36.h,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(18.r),
                    ),
                    child: CustomText(
                      text: 'Write a comment...',
                      fontSize: 11.sp,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            CustomText(
              text: 'View comments',
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}

class PostActionButton extends StatelessWidget {
  const PostActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        foregroundColor: FB_DARK_PRIMARY,
      ),
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: FB_DARK_PRIMARY),
            SizedBox(width: 4.w),
            Text(label, style: const TextStyle(color: FB_DARK_PRIMARY)),
          ],
        ),
      ),
    );
  }
}
