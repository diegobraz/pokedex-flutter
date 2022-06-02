import 'package:flutter/material.dart';
import 'package:pokedex/features/pokedex/screems/details/pages/widget/detail_app_bar_widget.dart';
import 'package:pokedex/features/pokedex/screems/details/pages/widget/detail_list_widget.dart';

import '../../../../common/models/pokemon.dart';

class DetailPage extends StatefulWidget {
  DetailPage(
      {Key? key,
      required this.list,
      required this.pokemon,
      required this.onback,
      required this.controller,
      required this.onChangePokemon})
      : super(key: key);
  final Pokemon pokemon;
  final List<Pokemon> list;
  final VoidCallback onback;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePokemon;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late ScrollController scrollController;
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  bool isOnTop = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener(
        onNotification: (Notification) {
          if (scrollController.position.pixels > 27) {
            setState(() {
              isOnTop = false;
            });
          } else if (scrollController.position.pixels <= 36) {
            isOnTop = true;
          }
          return false;
        },
        child: CustomScrollView(
          controller: scrollController,
          physics: const ClampingScrollPhysics(),
          slivers: [
            DetailAppBarWidget(
              pokemon: widget.pokemon,
              onBack: widget.onback,
              isOnTop: isOnTop,
            ),
            DetailListWidge(
              pokemon: widget.pokemon,
              list: widget.list,
              controller: widget.controller,
              onChangePokemon: widget.onChangePokemon,
            ),
            SliverToBoxAdapter(
                child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(children: [
                Container(color: widget.pokemon.baseColor),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(24),
                        topLeft: Radius.circular(24)),
                  ),
                )
              ]),
            )),
          ],
        ),
      ),
    );
  }
}
