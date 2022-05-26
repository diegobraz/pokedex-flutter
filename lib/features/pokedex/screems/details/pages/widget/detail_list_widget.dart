import 'package:flutter/material.dart';

import '../../../../../common/models/pokemon.dart';

class DetailListWidge extends StatelessWidget {
  const DetailListWidge(
      {Key? key,
      required this.pokemon,
      required this.list,
      required this.controller,
      required this.onChangePokemon})
      : super(key: key);
  final Pokemon pokemon;
  final List<Pokemon> list;
  final PageController controller;
  final ValueChanged<Pokemon> onChangePokemon;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 100,
      left: 0,
      right: 0,
      height: 350,
      child: Container(
        color: pokemon.baseColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      pokemon.name,
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Text(
                    '#${pokemon.num}',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: PageView(
                onPageChanged: (index) {
                  onChangePokemon(list[index]);
                },
                controller: controller,
                children: list.map((e) {
                  bool diff = e.name != pokemon.name;
                  return AnimatedOpacity(
                    duration: Duration(milliseconds: 400),
                    opacity: diff != pokemon ? 0.4 : 1.0,
                    child: TweenAnimationBuilder<double>(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                        tween: Tween<double>(
                            end: diff != pokemon ? 100 : 200,
                            begin: diff != pokemon ? 200 : 100),
                        builder: (context, value, chils) {
                          return Center(
                            child: Image.network(
                              e.image,
                              height: value,
                              color: diff != pokemon
                                  ? Colors.black.withOpacity(0.4)
                                  : null,
                            ),
                          );
                        }),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
