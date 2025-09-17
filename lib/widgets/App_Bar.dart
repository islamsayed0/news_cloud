import 'package:flutter/material.dart';

class App_Bar extends StatelessWidget implements PreferredSizeWidget {
  const App_Bar({super.key, this.ontap, this.title, this.titleKey});

  final GestureTapCallback? ontap;
  final String? title;
  final GlobalKey? titleKey;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black.withOpacity(0.3),
              Colors.transparent,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: GestureDetector(
        onTap: ontap,
        child: KeyedSubtree(
          key: titleKey,
          child: title != null
            ? Text(
                title!,
                textDirection: TextDirection.rtl,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              )
            : Row(
                textDirection: TextDirection.rtl,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "اخبار",
                    style: TextStyle(fontSize: 35, fontFamily: 'logofont'),
                  ),
                  Text(
                    "الشرق",
                    style: TextStyle(
                      color: Colors.orangeAccent,
                      fontSize: 35,
                      fontFamily: 'logofont',
                    ),
                  )
                ],
              ),
        ),
      ),
    );
  }

  // هنا لازم نحدد حجم الـ AppBar
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
