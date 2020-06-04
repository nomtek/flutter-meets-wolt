import 'package:flutter/material.dart';
import 'package:flutter_meets_wolt/app_bar_buttons/app_bar_button.dart';
import 'package:flutter_meets_wolt/app_bar_buttons/app_bar_menu.dart';
import 'package:flutter_meets_wolt/shared/app_bar_title.dart';

class AppBarButtons extends StatefulWidget {
  @override
  _AppBarButtonsState createState() => _AppBarButtonsState();
}

class _AppBarButtonsState extends State<AppBarButtons> {

  bool _isMenuShown = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            brightness: Brightness.light,
            leading: AppBarButton(
              icon: Icons.keyboard_backspace,
              position: AppBarPosition.leading,
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              AppBarButton(
                icon: _isMenuShown ? Icons.close : Icons.more_horiz,
                position: AppBarPosition.trailing,
                onPressed: () {
                  Navigator.push(context, AppBarMenu())
                      .then((_) => setState(() => _isMenuShown = false));
                  setState(() => _isMenuShown = true);
                },
              ),
            ],
            backgroundColor: Colors.white,
            centerTitle: true,
            stretch: true,
            pinned: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              title: AppBarTitle(),
              background: Placeholder(color: Colors.indigo,)
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => Placeholder(
                      fallbackHeight: 200,
                    ),
                childCount: 10),
          ),
        ],
      ),
    );
  }
}
