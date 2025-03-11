import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconProvider with ChangeNotifier {
  final Map<String, String> icons = {}; 

  
  Future<void> fetchIcon(String iconKey, String iconUrl) async {
    try {
      final response = await Dio().get(
        iconUrl,
        options: Options(responseType: ResponseType.plain),
      );
      if (response.statusCode == 200) {
        icons[iconKey] = response.data;
        notifyListeners();
      }
    } catch (e) {
      
      print('Error fetching icon: $e');
    }
  }
}

class IconWidget extends StatelessWidget {
  final String iconKey;
  final String iconUrl;
  final double size;

  const IconWidget({
    super.key,
    required this.iconKey,
    required this.iconUrl,
    this.size = 50,
  });

  @override
  Widget build(BuildContext context) {
    final iconProvider = Provider.of<IconProvider>(context);

    
    if (!iconProvider.icons.containsKey(iconKey)) {
      iconProvider.fetchIcon(iconKey, iconUrl);
    }

    
    String extension = iconUrl.split('.').last.toLowerCase();
    return _getIconBasedOnExtension(extension, iconProvider);
  }

  Widget _getIconBasedOnExtension(String extension, IconProvider iconProvider) {
    if (extension == 'svg') {
      final svgData = iconProvider.icons[iconKey];
      return svgData != null
          ? SvgPicture.string(svgData, width: size, height: size,)
          : const SizedBox();
    } else if (extension == 'png' ||
        extension == 'jpg' ||
        extension == 'jpeg') {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(4.0),
        child: Image.network(
          iconUrl,
          width: size,
          height: size,
          errorBuilder: (context, error, stackTrace) {
            return const SizedBox();
          },
        ),
      );
    } else {
      return const SizedBox(); 
    }
  }
}
