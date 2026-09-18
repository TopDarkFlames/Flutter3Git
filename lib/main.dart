import 'package:flutter/material.dart';

void main() {
  runApp(const ListaCardsApp());
}

class ListaCardsApp extends StatelessWidget {
  const ListaCardsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Listas e Cards',
      theme: ThemeData(
        useMaterial3: false,
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: const Color(0xfff5f6fa),
        appBarTheme: const AppBarTheme(centerTitle: false),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
      home: const InicioPage(),
    );
  }
}

class InicioPage extends StatelessWidget {
  const InicioPage({super.key});

  static const exercicios = <_Exercicio>[
    _Exercicio(
      titulo: 'Primeira lista',
      descricao: 'ListView com itens e divisores',
      icone: Icons.view_list,
      pagina: DisciplinasPage(),
    ),
    _Exercicio(
      titulo: 'Lista de cursos',
      descricao: 'List<String> e ListView.builder',
      icone: Icons.school,
      pagina: CursosPage(),
    ),
    _Exercicio(
      titulo: 'Cursos em Cards',
      descricao: 'Card, ListTile e informações organizadas',
      icone: Icons.style,
      pagina: CursosCardsPage(),
    ),
    _Exercicio(
      titulo: 'Lista de produtos',
      descricao: 'List<Produto> com preço e estoque',
      icone: Icons.inventory_2,
      pagina: ProdutosPage(),
    ),
    _Exercicio(
      titulo: 'Cadastro dinâmico',
      descricao: 'Adicionar, limpar e remover produtos',
      icone: Icons.add_shopping_cart,
      pagina: CadastroProdutosPage(),
    ),
    _Exercicio(
      titulo: 'Fixação 1: Linguagens',
      descricao: 'Oito linguagens usando ListView.builder',
      icone: Icons.code,
      pagina: LinguagensPage(),
    ),
    _Exercicio(
      titulo: 'Fixação 2: Catálogo de livros',
      descricao: 'Classe Livro exibida em Cards',
      icone: Icons.menu_book,
      pagina: LivrosPage(),
    ),
    _Exercicio(
      titulo: 'Fixação 3: Lista de alunos',
      descricao: 'Classe Aluno com nome e nota',
      icone: Icons.people,
      pagina: AlunosPage(),
    ),
    _Exercicio(
      titulo: 'Fixação 4: Cadastro de tarefas',
      descricao: 'Adicionar e remover tarefas',
      icone: Icons.task_alt,
      pagina: TarefasPage(),
    ),
    _Exercicio(
      titulo: 'Fixação 5: Estoque simples',
      descricao: 'Produtos com preço e quantidade',
      icone: Icons.warehouse,
      pagina: EstoquePage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Listas, ListView e Cards')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Material 2',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          const Text(
            'Escolha um exercício para visualizar os conceitos do material.',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          ...exercicios.asMap().entries.map((entry) {
            final exercicio = entry.value;
            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                leading: CircleAvatar(child: Icon(exercicio.icone)),
                title: Text(
                  'Exercício ${entry.key + 1}: ${exercicio.titulo}',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(exercicio.descricao),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute<void>(builder: (_) => exercicio.pagina),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class _Exercicio {
  final String titulo;
  final String descricao;
  final IconData icone;
  final Widget pagina;

  const _Exercicio({
    required this.titulo,
    required this.descricao,
    required this.icone,
    required this.pagina,
  });
}

class DisciplinasPage extends StatelessWidget {
  const DisciplinasPage({super.key});

  @override
  Widget build(BuildContext context) {
    const disciplinas = [
      'Programação',
      'Banco de Dados',
      'Redes de Computadores',
      'Flutter',
      'Segurança da Informação',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Minhas Disciplinas')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: disciplinas.length,
        separatorBuilder: (_, __) => const Divider(height: 20),
        itemBuilder: (_, index) =>
            Text(disciplinas[index], style: const TextStyle(fontSize: 20)),
      ),
    );
  }
}

class CursosPage extends StatelessWidget {
  const CursosPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cursos = <String>[
      'Flutter',
      'Python',
      'Java',
      'Banco de Dados',
      'Redes',
      'Segurança da Informação',
      'Inteligência Artificial',
      'Desenvolvimento Web',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Cursos')),
      body: ListView.builder(
        itemCount: cursos.length,
        itemBuilder: (_, index) => ListTile(
          leading: const Icon(Icons.school),
          title: Text(cursos[index]),
        ),
      ),
    );
  }
}

class CursosCardsPage extends StatelessWidget {
  const CursosCardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const cursos = [
      'Flutter',
      'Python',
      'Java',
      'Banco de Dados',
      'Redes de Computadores',
      'Segurança da Informação',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Cursos Disponíveis')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: cursos.length,
        itemBuilder: (_, index) => Card(
          margin: const EdgeInsets.only(bottom: 10),
          child: ListTile(
            leading: const Icon(Icons.computer, size: 35),
            title: Text(
              cursos[index],
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Curso ${index + 1}'),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ),
      ),
    );
  }
}

class Produto {
  final String nome;
  final double preco;
  final int quantidade;

  const Produto({
    required this.nome,
    required this.preco,
    required this.quantidade,
  });
}

class ProdutosPage extends StatelessWidget {
  const ProdutosPage({super.key});

  @override
  Widget build(BuildContext context) {
    const produtos = [
      Produto(nome: 'Teclado', preco: 120, quantidade: 5),
      Produto(nome: 'Mouse', preco: 80, quantidade: 10),
      Produto(nome: 'Monitor', preco: 950, quantidade: 3),
      Produto(nome: 'Headset', preco: 250, quantidade: 7),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Produtos')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: produtos.length,
        itemBuilder: (_, index) {
          final produto = produtos[index];
          return Card(
            child: ListTile(
              leading: const Icon(Icons.inventory_2, size: 35),
              title: Text(
                produto.nome,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'R\$ ${produto.preco.toStringAsFixed(2)}'
                ' • Estoque: ${produto.quantidade}',
              ),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          );
        },
      ),
    );
  }
}

class CadastroProdutosPage extends StatefulWidget {
  const CadastroProdutosPage({super.key});

  @override
  State<CadastroProdutosPage> createState() => _CadastroProdutosPageState();
}

class _CadastroProdutosPageState extends State<CadastroProdutosPage> {
  final nomeController = TextEditingController();
  final precoController = TextEditingController();
  final produtos = <Produto>[];

  @override
  void dispose() {
    nomeController.dispose();
    precoController.dispose();
    super.dispose();
  }

  void adicionarProduto() {
    final nome = nomeController.text.trim();
    final preco = double.tryParse(precoController.text.replaceAll(',', '.'));

    if (nome.isEmpty || preco == null || preco <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Informe um nome e um preço válido.')),
      );
      return;
    }

    setState(() {
      produtos.add(Produto(nome: nome, preco: preco, quantidade: 1));
    });
    nomeController.clear();
    precoController.clear();
  }

  void removerProduto(int index) {
    setState(() {
      produtos.removeAt(index);
    });
  }

  void limparCampos() {
    nomeController.clear();
    precoController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de Produtos')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(labelText: 'Nome do produto'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: precoController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(labelText: 'Preço'),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: adicionarProduto,
                  child: const Text('Adicionar'),
                ),
                const SizedBox(width: 15),
                OutlinedButton(
                  onPressed: limparCampos,
                  child: const Text('Limpar'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: produtos.isEmpty
                  ? const Center(child: Text('Nenhum produto cadastrado.'))
                  : ListView.builder(
                      itemCount: produtos.length,
                      itemBuilder: (_, index) {
                        final produto = produtos[index];
                        return Card(
                          child: ListTile(
                            leading: const Icon(Icons.inventory_2),
                            title: Text(produto.nome),
                            subtitle: Text(
                              'R\$ ${produto.preco.toStringAsFixed(2)}',
                            ),
                            trailing: IconButton(
                              tooltip: 'Remover produto',
                              icon: const Icon(Icons.delete),
                              onPressed: () => removerProduto(index),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class LinguagensPage extends StatelessWidget {
  const LinguagensPage({super.key});

  @override
  Widget build(BuildContext context) {
    const linguagens = [
      'Dart',
      'Java',
      'Kotlin',
      'Python',
      'JavaScript',
      'C#',
      'C++',
      'Swift',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Linguagens')),
      body: ListView.builder(
        itemCount: linguagens.length,
        itemBuilder: (_, index) => ListTile(
          leading: CircleAvatar(child: Text('${index + 1}')),
          title: Text(linguagens[index]),
        ),
      ),
    );
  }
}

class Livro {
  final String titulo;
  final String autor;

  const Livro({required this.titulo, required this.autor});
}

class LivrosPage extends StatelessWidget {
  const LivrosPage({super.key});

  @override
  Widget build(BuildContext context) {
    const livros = [
      Livro(titulo: 'O Hobbit', autor: 'J. R. R. Tolkien'),
      Livro(titulo: 'Dom Casmurro', autor: 'Machado de Assis'),
      Livro(titulo: 'O Pequeno Príncipe', autor: 'Antoine de Saint-Exupéry'),
      Livro(titulo: '1984', autor: 'George Orwell'),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Catálogo de Livros')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: livros.length,
        itemBuilder: (_, index) {
          final livro = livros[index];
          return Card(
            child: ListTile(
              leading: const Icon(Icons.book, size: 32),
              title: Text(
                livro.titulo,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Autor: ${livro.autor}'),
            ),
          );
        },
      ),
    );
  }
}

class Aluno {
  final String nome;
  final double nota;

  const Aluno({required this.nome, required this.nota});
}

class AlunosPage extends StatelessWidget {
  const AlunosPage({super.key});

  @override
  Widget build(BuildContext context) {
    const alunos = [
      Aluno(nome: 'Ana Souza', nota: 9.5),
      Aluno(nome: 'Bruno Lima', nota: 8.0),
      Aluno(nome: 'Carla Mendes', nota: 7.5),
      Aluno(nome: 'Diego Santos', nota: 6.8),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Alunos')),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: alunos.length,
        itemBuilder: (_, index) {
          final aluno = alunos[index];
          return Card(
            child: ListTile(
              leading: const Icon(Icons.person),
              title: Text(aluno.nome),
              subtitle: Text('Nota: ${aluno.nota.toStringAsFixed(1)}'),
            ),
          );
        },
      ),
    );
  }
}

class TarefasPage extends StatefulWidget {
  const TarefasPage({super.key});

  @override
  State<TarefasPage> createState() => _TarefasPageState();
}

class _TarefasPageState extends State<TarefasPage> {
  final tarefaController = TextEditingController();
  final tarefas = <String>[];

  @override
  void dispose() {
    tarefaController.dispose();
    super.dispose();
  }

  void adicionarTarefa() {
    final tarefa = tarefaController.text.trim();
    if (tarefa.isEmpty) return;

    setState(() {
      tarefas.add(tarefa);
    });
    tarefaController.clear();
  }

  void removerTarefa(int index) {
    setState(() {
      tarefas.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cadastro de Tarefas')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: tarefaController,
              onSubmitted: (_) => adicionarTarefa(),
              decoration: const InputDecoration(labelText: 'Nova tarefa'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: adicionarTarefa,
              child: const Text('Adicionar tarefa'),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: tarefas.isEmpty
                  ? const Center(child: Text('Nenhuma tarefa cadastrada.'))
                  : ListView.builder(
                      itemCount: tarefas.length,
                      itemBuilder: (_, index) => Card(
                        child: ListTile(
                          leading: const Icon(Icons.check_box_outline_blank),
                          title: Text(tarefas[index]),
                          trailing: IconButton(
                            tooltip: 'Remover tarefa',
                            icon: const Icon(Icons.delete),
                            onPressed: () => removerTarefa(index),
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class EstoquePage extends StatefulWidget {
  const EstoquePage({super.key});

  @override
  State<EstoquePage> createState() => _EstoquePageState();
}

class _EstoquePageState extends State<EstoquePage> {
  final nomeController = TextEditingController();
  final precoController = TextEditingController();
  final quantidadeController = TextEditingController();
  final produtos = <Produto>[];

  @override
  void dispose() {
    nomeController.dispose();
    precoController.dispose();
    quantidadeController.dispose();
    super.dispose();
  }

  void adicionarProduto() {
    final nome = nomeController.text.trim();
    final preco = double.tryParse(precoController.text.replaceAll(',', '.'));
    final quantidade = int.tryParse(quantidadeController.text);

    if (nome.isEmpty ||
        preco == null ||
        preco <= 0 ||
        quantidade == null ||
        quantidade < 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Preencha os dados corretamente.')),
      );
      return;
    }

    setState(() {
      produtos.add(
        Produto(nome: nome, preco: preco, quantidade: quantidade),
      );
    });
    nomeController.clear();
    precoController.clear();
    quantidadeController.clear();
  }

  void removerProduto(int index) {
    setState(() {
      produtos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Estoque Simples')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(labelText: 'Nome do produto'),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: precoController,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    decoration: const InputDecoration(labelText: 'Preço'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: quantidadeController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(labelText: 'Quantidade'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: adicionarProduto,
              child: const Text('Cadastrar produto'),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: produtos.isEmpty
                  ? const Center(child: Text('Estoque vazio.'))
                  : ListView.builder(
                      itemCount: produtos.length,
                      itemBuilder: (_, index) {
                        final produto = produtos[index];
                        return Card(
                          child: ListTile(
                            leading: const Icon(Icons.inventory_2),
                            title: Text(produto.nome),
                            subtitle: Text(
                              'R\$ ${produto.preco.toStringAsFixed(2)}'
                              ' • Quantidade: ${produto.quantidade}',
                            ),
                            trailing: IconButton(
                              tooltip: 'Remover produto',
                              icon: const Icon(Icons.delete),
                              onPressed: () => removerProduto(index),
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
