import 'package:flutter/material.dart';
import 'package:zoodex/utils/theme.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: TextField(
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              decoration: InputDecoration(
                hintText: 'جستجو در زودکس',
                hintStyle: Theme.of(context).textTheme.titleLarge,
                filled: true,
                fillColor: Colors.white,
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: 16, left: 6),
                  child: Icon(Icons.search, color: Color(0xFF5F6266), size: 28),
                ),
                contentPadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(color: Color(0xFF5F6266), width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide:
                      BorderSide(color: AppTheme.primaryColor, width: 2.5),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
