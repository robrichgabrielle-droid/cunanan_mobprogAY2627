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
    this.avatarPath,
    this.imagePath,
  });

  final String userName;
  final String postContent;
  final String date;
  final int numOfLikes;
  final String? avatarPath;
  final String? imagePath;

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
                  backgroundImage: avatarPath == null
                      ? null
                      : AssetImage(avatarPath!),
                  child: avatarPath == null ? const Icon(Icons.person) : null,
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
            SizedBox(height: 5.h),
            CustomText(text: postContent, fontSize: 12.sp, color: Colors.black),
            if (imagePath != null) ...[
              SizedBox(height: 8.h),
              ClipRRect(
                borderRadius: BorderRadius.circular(6.r),
                child: Image.asset(
                  imagePath!,
                  width: double.infinity,
                  height: 220.h,
                  fit: BoxFit.cover,
                ),
              ),
            ],
            SizedBox(height: 5.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                PostActionButton(
                  icon: Icons.thumb_up_outlined,
                  label: numOfLikes.toString(),
                  onPressed: () {},
                ),
                PostActionButton(
                  icon: Icons.comment_outlined,
                  label: 'Comment',
                  onPressed: () {},
                ),
                PostActionButton(
                  icon: Icons.redo,
                  label: 'Share',
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                const CircleAvatar(radius: 20, child: Icon(Icons.person)),
                SizedBox(width: 10.w),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    height: 32.h,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10.r),
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
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 18.sp),
      label: Text(label),
      style: TextButton.styleFrom(foregroundColor: FB_DARK_PRIMARY),
    );
  }
}
