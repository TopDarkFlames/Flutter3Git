import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_material_2_listas/main.dart';

void main() {
  testWidgets('exibe os cinco exercícios na tela inicial', (tester) async {
    await tester.pumpWidget(const ListaCardsApp());

    expect(find.text('Listas, ListView e Cards'), findsOneWidget);
    expect(find.textContaining('Exercício 1'), findsOneWidget);
    expect(find.textContaining('Exercício 5'), findsOneWidget);
  });

  testWidgets('permite abrir o cadastro dinâmico', (tester) async {
    await tester.pumpWidget(const ListaCardsApp());
    await tester.tap(find.textContaining('Cadastro dinâmico'));
    await tester.pumpAndSettle();

    expect(find.text('Nenhum produto cadastrado.'), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2));
  });
}
