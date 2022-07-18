import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MyController extends GetxController {
  var perguntaSelecionada = 0.obs;
  final perguntas = [
    'Qual é sua cor favorita?',
    'Qual é seu animal favorito?',
    'Qual é seu namorado favorito?',
    'Qual é seu carro favorito?',
  ];

  avancar(){
    if(perguntaSelecionada.toInt() < (perguntas.length - 1)){
      perguntaSelecionada++;
    }
    print(perguntaSelecionada);
  }

  voltar(){
    if(perguntaSelecionada.toInt() > 0){
      perguntaSelecionada--;
    }
    print(perguntaSelecionada);
  }
}

main() => runApp(PerguntasApp());

class PerguntasApp extends StatelessWidget {
  const PerguntasApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyController controller = MyController();

    return GetMaterialApp(
      home: Scaffold(
        appBar:  AppBar(
          title: Text('Perguntas'),
        ),
        body:  Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Center(
                child: Column(
                  children: [
                    Obx(() => Text(controller.perguntas[controller.perguntaSelecionada.value])),
                    Text(controller.perguntaSelecionada.toString()),
                    ElevatedButton(
                      onPressed: () { controller.avancar(); },
                      child: Text('Avançar')
                    ),
                    ElevatedButton(
                      onPressed: () { controller.voltar(); },
                      child: Text('Voltar')
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        ),
    );
  }
}