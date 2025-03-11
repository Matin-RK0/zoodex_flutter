import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoodex/blocs/Location_Provider.dart';
import 'package:zoodex/services/icon_getter.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "انتخاب آدرس",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              ListTile(
                title: const Text("تهران"),
                onTap: () {
                  Provider.of<LocationProvider>(context, listen: false)
                      .setLocation("تهران");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("اصفهان"),
                onTap: () {
                  Provider.of<LocationProvider>(context, listen: false)
                      .setLocation("اصفهان");
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("مشهد"),
                onTap: () {
                  Provider.of<LocationProvider>(context, listen: false)
                      .setLocation("مشهد");
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedLocation =
        Provider.of<LocationProvider>(context).selectedLocation;

    return AppBar(
      surfaceTintColor: Colors.white,
      leading: Padding(
        padding: const EdgeInsets.only(left: 13.0, right: 7),
        child: IconWidget(
          iconKey: 'zoodexIcon',
          iconUrl: 'https://beta.zoodex.ir/svg/zoodex-logo.svg',
          size: 30,
        ),
      ),
      title: GestureDetector(
        onTap: () => _showBottomSheet(context),
        child: Row(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(CupertinoIcons.placemark, size: 18),
            Text(
              '  $selectedLocation ',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              'انتخاب آدرس',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const Icon(
              Icons.keyboard_arrow_down,
              size: 30,
              color: Colors.red,
            ),
          ],
        ),
      ),
      centerTitle: true,
      actions: [
        Builder(
          builder: (context) => Padding(
            padding: const EdgeInsets.only(right: 4),
            child: IconButton(
              icon: const Icon(
                Icons.menu,
                color: Color(0xFF5F6266),
                size: 26,
              ),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
