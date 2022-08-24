import 'package:flutter/material.dart';
import 'package:la_vie_web/presentation/common/text_poppins.dart';
import 'package:provider/provider.dart';

import '../../app_core/color_constants.dart';
import '../initial/provider/register_provider.dart';

class TopTabsWidget extends StatelessWidget {
  final List tabsList;
  final bool isRegister;
  final TabController controller;

  const TopTabsWidget({
    Key? key,
    required this.controller,
    required this.tabsList,
    required this.isRegister,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(isRegister ? 0 : 10),

      child: Consumer<RegisterProvider>(
        builder: (context, provider, child) {
          return TabBar(
            onTap: (newIndex) {
              if (isRegister == false && RegisterProvider.isRegistered == true){
                return;
              }
                controller.index = newIndex;
            },

            controller: controller,
            isScrollable: isRegister ? false : true,
            indicatorSize: TabBarIndicatorSize.label,
            labelPadding: const EdgeInsets.symmetric(
                vertical: 8, horizontal: 30),
            labelStyle: const TextStyle(fontSize: 15),
            indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(color: ColorConstants.accent, width: 3)),

            tabs: [
              for (final tab in tabsList) Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: TextPoppins(
                    tab,
                    size: isRegister ? 15 : 12,
                    weight: isRegister ? FontWeight.w400 : FontWeight.w500,
                  )
              ),
            ],
          );
        },
      ),
    );
  }
}
