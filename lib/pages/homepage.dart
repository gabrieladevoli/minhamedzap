import 'package:flutter/material.dart';
import 'package:minha_med_zap/pages/CadastroConsultaScreen.dart';
import 'package:minha_med_zap/widgets/drawer.dart';
import 'package:minha_med_zap/pages/login_page.dart';
import 'package:minha_med_zap/images/logo_home_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String nomeUsuario = '';
  List<Map<String, String>> consultas = [];
  void excluirConsulta(int index) {

  setState(() {

    consultas.removeAt(index);
  });

  Navigator.pop(context);
}

void editarConsulta(int index) async {

  final consultaAtual = consultas[index];

  final resultado = await Navigator.push(
    context,

    MaterialPageRoute(

      builder: (context) => CadastroConsultaScreen(
        consultaExistente: consultaAtual,
      ),
    ),
  );

  if (resultado != null) {

    setState(() {

      consultas[index] =
          Map<String, String>.from(resultado);
    });
  }
}

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      drawer: Drawer(
        backgroundColor: const Color.fromARGB(255, 95, 162, 230),
        child: MyDrawer(),
      ),

      appBar: AppBar(

        backgroundColor: const Color.fromARGB(255, 18, 67, 116),

        title: const Text(
          "Minha Med Zap",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [

          Padding(
            padding: const EdgeInsets.only(right: 15),

            child: GestureDetector(

              onTap: () async {

                final resultado = await Navigator.push(
                  context,

                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );

                if (resultado != null) {

                  setState(() {
                    nomeUsuario = resultado;
                  });
                }
              },

              child: Row(
                children: [

                  CircleAvatar(
                    radius: 20,
                    backgroundColor: const Color.fromARGB(255, 240, 193, 139),

                    child: Text(
                      nomeUsuario.isEmpty
                          ? 'U'
                          : nomeUsuario[0].toUpperCase(),
                      style: const TextStyle(
                        color: Color.fromARGB(255, 180, 149, 201),
                      ),
                    )
                  ),

              const SizedBox(width: 10),

                  Text(
                    nomeUsuario.isEmpty
                        ? 'Entrar'
                        : nomeUsuario,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [

             const Logo_Home_Page(),

            const SizedBox(height: 30),

            Semantics(
  label: 'Botão de agendar consulta',
  child: ElevatedButton(
              onPressed: () async {

  final resultado = await Navigator.push(
    context,

    MaterialPageRoute(
      builder: (context) =>
          const CadastroConsultaScreen(),
    ),
  );

  if (resultado != null) {

    setState(() {

      consultas.add(
        Map<String, String>.from(resultado),
      );
    });
  }
},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 24, 196, 130),
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),

              child: const Text(
                'Agendar Consulta',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
            const SizedBox(height: 30),

GestureDetector(

  onTap: () {

    showDialog(
      context: context,

      builder: (context) {

        return AlertDialog(

          title: const Text('Consultas Agendadas'),

          content: SizedBox(
            width: double.maxFinite,

            child: consultas.isEmpty

                ? const Text(
                    'Nenhuma consulta agendada.',
                  )

                : ListView.builder(

                    shrinkWrap: true,

                    itemCount: consultas.length,

                    itemBuilder: (context, index) {

                      final consulta = consultas[index];

                      return Card(

                        child: ListTile(

  leading: const Icon(
    Icons.medical_services,
  ),

  title: Text(
    consulta['tipo']!,
  ),

  subtitle: Text(
    '${consulta['local']}\n${consulta['data']}',
  ),

  trailing: Row(
    mainAxisSize: MainAxisSize.min,

    children: [

      IconButton(

        onPressed: () {
          editarConsulta(index);
        },

        icon: const Icon(
          Icons.edit,
          color: Colors.blue,
        ),
      ),

      IconButton(

        onPressed: () {
          excluirConsulta(index);
        },

        icon: const Icon(
          Icons.delete,
          color: Colors.red,
        ),
      ),
    ],
  ),
),
                      );
                    },
                  ),
          ),

          actions: [

            TextButton(

              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  },

  child: Container(

    width: 170,
    height: 120,

    decoration: BoxDecoration(

      color: Colors.green[700],

      borderRadius: BorderRadius.circular(20),

      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.2),
          blurRadius: 8,
        ),
      ],
    ),

    child: const Column(

      mainAxisAlignment: MainAxisAlignment.center,

      children: [

        Icon(
          Icons.calendar_month,
          color: Colors.white,
          size: 40,
        ),

        SizedBox(height: 10),

        Text(
          'Minhas Consultas',

          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    ),
  ),
),
          ],
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 233, 232, 229)
    );
  }
}