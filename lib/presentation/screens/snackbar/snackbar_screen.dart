import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hola mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // NO CERRAR DIALOG PRESIONANDO FUERA
      builder: (context) => AlertDialog(
            title: const Text('¿Estás seguro?'),
            content: const Text(
                'Esse pariatur exercitation occaecat laborum non cillum cillum enim nulla. Nisi ad id adipisicing aute sint eiusmod. Ex commodo sunt tempor consectetur. Id ex voluptate fugiat quis mollit sint. Exercitation labore laboris cupidatat dolore ut et officia cupidatat magna esse ullamco laboris ex. Proident Lorem consequat cupidatat ullamco cupidatat laborum labore dolore cupidatat.'),
            actions: [
              TextButton(onPressed: () => context.pop(), child: const Text('Cancelar')),
              
              FilledButton(onPressed: () => context.pop(), child: const Text('Aceptar'))

            ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Diálogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
                onPressed: () {
                  showAboutDialog(context: context, children: [
                    const Text(
                        'Quis qui magna magna dolore velit. Officia cillum ex ea est amet officia minim cillum excepteur velit aliquip adipisicing. Ad enim cupidatat nisi enim labore exercitation occaecat. Pariatur Lorem commodo non eiusmod cupidatat. Aute ullamco anim sint dolor in do. Sint commodo aute labore irure id nisi eiusmod commodo duis minim sunt duis.')
                  ]);
                },
                child: const Text('Licencias usadas')),
            FilledButton.tonal(
                onPressed: () => openDialog(context), child: const Text('Mostrar Diálogo')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
