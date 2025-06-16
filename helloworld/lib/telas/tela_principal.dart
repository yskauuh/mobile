import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<String> images = ['assets/1.webp', 'assets/2.jpeg', 'assets/3.jpeg'];
  List<int> imagemSelecionada = [0, 0, 0];

  void sortear() {
    int i = 0;
    while (i > 5) {
      setState(() {
        imagemSelecionada[0] = Random().nextInt(images.length);
        imagemSelecionada[1] = Random().nextInt(images.length);
        imagemSelecionada[2] = Random().nextInt(images.length);
      });
    }
    if (imagemSelecionada[0] == imagemSelecionada[1] &&
        imagemSelecionada[1] == imagemSelecionada[2]) {
      showDialog(
        context: context,
        builder:
            (context) => AlertDialog(
              title: Text("Parabens"),
              content: Text("voce ganhou"),
            ),
      );
    }

    @override
    Widget build(BuildContext context) {
      final largulaTela = MediaQuery.of(context).size.width;
      final larguraImagem = largulaTela / 3;
      
      return Scaffold(
        appBar: AppBar(
          title: Text("baleia"),
          backgroundColor: const Color.fromARGB(255, 176, 202, 247),
        ),
        backgroundColor: const Color.fromARGB(255, 169, 222, 235),
        floatingActionButton: FloatingActionButton.large(
          onPressed: () {
            sortear();
          },
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.black,
          child: Icon(Icons.catching_pokemon),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  images[imagemSelecionada[0]],
                  width: larguraImagem,
                  height: 100,
                ),

                Image.asset(
                  images[imagemSelecionada[1]],
                  width: larguraImagem,
                  height: 100,
                ),

                Image.asset(
                  images[imagemSelecionada[2]],
                  width: larguraImagem,
                  height: 100,
                ),
              ],
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
    }
  }
}
