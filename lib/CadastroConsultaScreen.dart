import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CadastroConsultaScreen extends StatefulWidget {
  const CadastroConsultaScreen({super.key});

  @override
  State<CadastroConsultaScreen> createState() => _CadastroConsultaScreenState();
}

class _CadastroConsultaScreenState extends State<CadastroConsultaScreen> {
  // Variáveis para armazenar as seleções do usuário
  String? _tipoConsultaSelecionado;
  String? _localSelecionado;
  DateTime? _dataSelecionada;

  // Opções para os seletores (Dropdowns)
  final List<String> _tiposConsulta = [
    'Rotina / Check-up',
    'Retorno',
    'Urgência',
    'Especialista',
  ];

  final List<String> _locaisExame = [
    'Clínica Central',
    'Laboratório São Lucas',
    'Hospital Unidade Norte',
    'Centro de Imagem Diagnóstica',
  ];

  // Função para abrir o endereço do local diretamente no Google Maps
  Future<void> _abrirNoGoogleMaps(String local) async {
    // Codifica o nome do estabelecimento para ser seguro em uma URL
    final query = Uri.encodeComponent(local);
    // URL padrão universal para abrir mapas buscando o local
    final url = 'https://www.google.com/maps/search/?api=1&query=$query';
    final uri = Uri.parse(url);

    try {
      // Tenta abrir no aplicativo nativo de mapas ou navegador
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        throw 'Não foi possível abrir o mapa.';
      }
    } catch (e) {
      // Exibe um feedback visual caso haja erro no emulador ou configuração
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Tentando navegar para: $local'),
            backgroundColor: Colors.green[700],
            duration: const Duration(seconds: 2),
          ),
        );
      }
    }
  }

  // Função para abrir o calendário nativo do Flutter
  Future<void> _selecionarData(BuildContext context) async {
    final DateTime? dataEscolhida = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(), // Impede selecionar datas passadas
      lastDate: DateTime.now().add(const Duration(days: 365)), // Limite de 1 ano à frente
      builder: (context, child) {
        // Customização rápida das cores do calendário para combinar com o tema verde
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.green[700]!, // Cor de destaque do calendário
              onPrimary: Colors.white,
              onSurface: Colors.black87,
            ),
          ),
          child: child!,
        );
      },
    );

    if (dataEscolhida != null && dataEscolhida != _dataSelecionada) {
      setState(() {
        _dataSelecionada = dataEscolhida;
      });
    }
  }

  // Helper para formatar a data na exibição
  String _formatarData(DateTime? data) {
    if (data == null) return 'Selecione uma data';
    final dia = data.day.toString().padLeft(2, '0');
    final mes = data.month.toString().padLeft(2, '0');
    final ano = data.year;
    return '$dia/$mes/$ano';
  }

  // Widget visual de mapa interativo que aparece quando um local é selecionado
  Widget _construirCardMapa(String local) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green[100]!),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.map_rounded, color: Colors.green[700]),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      local,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      'Clique abaixo para traçar rotas e ver no mapa',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Botão integrado para abrir o Maps
          SizedBox(
            width: double.infinity,
            height: 38,
            child: OutlinedButton.icon(
              onPressed: () => _abrirNoGoogleMaps(local),
              icon: const Icon(Icons.navigation_rounded, size: 18),
              label: const Text('Abrir no Google Maps'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.green[700],
                side: BorderSide(color: Colors.green[300]!),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Fundo verde suave utilizando a paleta nativa do Material Design
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.green[800]),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Ícone ilustrativo no topo para reforçar o tema de saúde
                Icon(
                  Icons.medical_services_rounded,
                  size: 64,
                  color: Colors.green[700],
                ),
                const SizedBox(height: 16),

                // 1. Título Grande (Centralizado)
                Text(
                  'Agendamento',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[900],
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 8),

                // Subtítulo principal (Centralizado)
                const Text(
                  'Preencha as informações necessárias abaixo para realizar a sua marcação.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 32),

                // --- SEÇÃO 1: TIPO DE CONSULTA ---
                const Text(
                  'Tipo de Consulta',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: _tipoConsultaSelecionado,
                  hint: const Text('Selecione uma opção'),
                  alignment: Alignment.center,
                  decoration: _estiloDecoracaoCampo(),
                  icon: Icon(Icons.keyboard_arrow_down_rounded, color: Colors.green[700]),
                  items: _tiposConsulta.map((String tipo) {
                    return DropdownMenuItem<String>(
                      value: tipo,
                      child: Center(child: Text(tipo)),
                    );
                  }).toList(),
                  onChanged: (String? novoValor) {
                    setState(() {
                      _tipoConsultaSelecionado = novoValor;
                    });
                  },
                ),
                const SizedBox(height: 24),

                // --- SEÇÃO 2: LOCAL DE EXAME ---
                const Text(
                  'Local de Exame',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: _localSelecionado,
                  hint: const Text('Selecione uma unidade'),
                  alignment: Alignment.center,
                  decoration: _estiloDecoracaoCampo(),
                  icon: Icon(Icons.location_on_rounded, color: Colors.green[700]),
                  items: _locaisExame.map((String local) {
                    return DropdownMenuItem<String>(
                      value: local,
                      child: Center(child: Text(local)),
                    );
                  }).toList(),
                  onChanged: (String? novoValor) {
                    setState(() {
                      _localSelecionado = novoValor;
                    });
                  },
                ),
                
                // Se um local foi selecionado, exibe o mini card do mapa logo abaixo do campo
                if (_localSelecionado != null) ...[
                  const SizedBox(height: 12),
                  _construirCardMapa(_localSelecionado!),
                ],
                
                const SizedBox(height: 24),

                // --- SEÇÃO 3: DATA DO EXAME ---
                const Text(
                  'Data do Exame',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                InkWell(
                  onTap: () => _selecionarData(context),
                  borderRadius: BorderRadius.circular(12),
                  child: Ink(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              _formatarData(_dataSelecionada),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                color: _dataSelecionada == null
                                    ? Colors.black54
                                    : Colors.black87,
                              ),
                            ),
                          ),
                          Icon(Icons.calendar_today_rounded, color: Colors.green[700]),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                // Botão de confirmação para dar um fechamento visual à tela
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Lógica de agendamento virá aqui
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[700],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                    ),
                    child: const Text(
                      'Confirmar Cadastro',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Método auxiliar para manter a padronização visual dos campos de formulário
  InputDecoration _estiloDecoracaoCampo() {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey[300]!),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.green[700]!, width: 2),
      ),
    );
  }
}