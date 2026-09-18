import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_material_2_listas/main.dart';

void main() {
  testWidgets('exibe os exercícios do material e da fixação', (tester) async {
    await tester.pumpWidget(const ListaCardsApp());

    expect(find.text('Listas, ListView e Cards'), findsOneWidget);
    expect(find.textContaining('Exercício 1'), findsOneWidget);
    await tester.scrollUntilVisible(
      find.textContaining('Exercício 10'),
      500,
      scrollable: find.byType(Scrollable),
    );
    expect(find.textContaining('Exercício 10'), findsOneWidget);
  });

  testWidgets('permite abrir o cadastro dinâmico', (tester) async {
    await tester.pumpWidget(const ListaCardsApp());
    await tester.tap(find.textContaining('Cadastro dinâmico'));
    await tester.pumpAndSettle();

    expect(find.text('Nenhum produto cadastrado.'), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2));
  });

  testWidgets('abre a lista de linguagens da fixação', (tester) async {
    await tester.pumpWidget(const ListaCardsApp());
    await tester.scrollUntilVisible(
      find.textContaining('Fixação 1: Linguagens'),
      500,
      scrollable: find.byType(Scrollable),
    );
    await tester.tap(find.textContaining('Fixação 1: Linguagens'));
    await tester.pumpAndSettle();

    expect(find.text('Lista de Linguagens'), findsOneWidget);
    expect(find.text('Dart'), findsOneWidget);
    expect(find.text('Swift'), findsOneWidget);
  });

  testWidgets('adiciona e remove uma tarefa', (tester) async {
    await tester.pumpWidget(const ListaCardsApp());
    await tester.scrollUntilVisible(
      find.textContaining('Fixação 4: Cadastro de tarefas'),
      500,
      scrollable: find.byType(Scrollable),
    );
    await tester.tap(find.textContaining('Fixação 4: Cadastro de tarefas'));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextField), 'Estudar ListView');
    await tester.tap(find.text('Adicionar tarefa'));
    await tester.pump();
    expect(find.text('Estudar ListView'), findsOneWidget);

    await tester.tap(find.byTooltip('Remover tarefa'));
    await tester.pump();
    expect(find.text('Nenhuma tarefa cadastrada.'), findsOneWidget);
  });
}
