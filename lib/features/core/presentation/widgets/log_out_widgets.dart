import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/data/constants/color_constants.dart';
import '../../../core/data/constants/image_constants.dart';
import '../../../core/services/login_provider.dart';

class LogoutWidgets extends StatefulWidget {
  const LogoutWidgets({
    super.key,
  });

  @override
  State<LogoutWidgets> createState() => _LogoutWidgetsState();
}

class _LogoutWidgetsState extends State<LogoutWidgets> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.white),
      ),
      title: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            SvgImages.logoutIconSvg,
            height: 44.h,
            width: 40.w,
          ),
          Positioned(
            top: -25,
            right: -10,
            child: IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.black,
                weight: 15.w,
              ),
              onPressed: () {
                context.pop();
              },
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Do you want to log out?",
            style: GoogleFonts.notoSansBengali(
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                color: Colors.black),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            "To get into our process, you need an ID login.",
            textAlign: TextAlign.center,
            style: GoogleFonts.notoSansBengali(
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                color: Colors.black),
          ),
        ],
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 127.w,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: MyColor.primaryColor,
                  side: BorderSide(color: MyColor.primaryColor, width: 1),
                  elevation: 2,
                ),
                child: Text(
                  "Log Out",
                  style: GoogleFonts.notoSansBengali(
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp,
                      color: Colors.white),
                ),
                onPressed: () {
                  setState(() {
                    context.read<LoginInfo>().logout();
                    context.pop();
                    context.go("/login");
                    /* context.read<NavBarProvider>().setCurrentIndex(0);*/
                  });
                },
              ),
            ),
            SizedBox(
              width: 127.w,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(color: Color(0xff979797), width: 1),
                  elevation: 2,
                ),
                child: Text(
                  "Go Back",
                  style: GoogleFonts.notoSansBengali(
                      fontWeight: FontWeight.w700,
                      fontSize: 14.sp,
                      color: Colors.black),
                ),
                onPressed: () {
                  context.pop();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
