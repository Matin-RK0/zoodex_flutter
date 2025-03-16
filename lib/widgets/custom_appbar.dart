import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zoodex/blocs/Location_Provider.dart';
import 'package:zoodex/services/icon_getter.dart';
import 'package:zoodex/widgets/map_picker.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
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
        onTap: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => MapPicker(),
        ),
        child: Consumer<LocationProvider>(
          builder: (context, locationProvider, child) {
            bool addressSelected = locationProvider.address != "کرمان";
            return Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(CupertinoIcons.placemark, size: 18),
                Text(
                  locationProvider.address,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                if (!addressSelected) ...[
                  Text(
                    'انتخاب آدرس ',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    size: 30,
                    color: Colors.red,
                  ),
                ],
              ],
            );
          },
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
