import 'package:covid19_tracker_in_flutter/presentation/pages/information/widget/widget_information.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Information extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        centerTitle: true,
        title: Text(
          'Informações',
          style: GoogleFonts.raleway(fontSize: 25.0, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Expansiontile(
                title: 'Propagação do Vírus',
                text: 'O vírus pode se propagar de pessoa para pessoa por meio'
                    ' de gotículas do nariz ou da boca que se espalham quando '
                    'alguém doente tosse ou espirra. A maioria dessas gotículas '
                    'cai em superfícies e objetos próximos, como mesas '
                    'ou telefones. As pessoas também podem se contaminar ao '
                    'respirarem gotículas provenientes da tosse ou espirro '
                    'de uma pessoa doente.\n'
                    'A transmissão ocorre, principalmente, de pessoa para pessoa'
                    ' e seu período de incubação, que é o tempo para que os '
                    'primeiros sintomas apareçam, pode ser de 2 a 14 dias.',
              ),
              Expansiontile(
                title: 'Formas de Contágio',
                text: ' - Gotículas de saliva\n'
                    ' - Espirro\n'
                    ' - Tosse\n'
                    ' - Catarro\n'
                    ' - Contato pessoal próximo, como toque ou aperto de mão\n'
                    ' - Contato com objetos ou superfícies contaminadas, '
                    'seguido de contato com a boca, nariz ou olhos',
              ),
              Expansiontile(
                title: 'Sintomas',
                text: "Sintomas mais comuns: \n"
                    " - Febre \n"
                    " - Tosse seca \n"
                    " - Cansaço \n\n"
                    "Sintomas menos comuns:\n"
                    " - Dores e desconfortos\n"
                    " - Dor de garganta\n"
                    " - Diarreia\n"
                    " - Conjuntivite\n"
                    " - Dor de cabeça\n"
                    " - Perda de paladar ou olfato\n"
                    " - Erupção cutânea na pele ou descoloração dos dedos das mãos ou dos pés\n\n"
                    "Sintomas graves:\n"
                    " - Dificuldade de respirar ou falta de ar\n"
                    " - Dor ou pressão no peito\n"
                    " - Perda de fala ou movimento\n",
              ),
              Expansiontile(
                title: 'Prevenções',
                text: '- Use máscara\n'
                    '- Lave suas mãos com frequência\n'
                    '- Ao sair de casa mantenha uma distância segura de no mínimo 1 metro das outras pessoas',
              ),
              Expansiontile(
                title: 'Tratamentos',
                text: 'Se apresentar algum dos sintomas, você deve descansar, '
                    'beber bastante líquido e comer alimentos nutritivos. '
                    'Fique em um quarto separado dos outros membros da '
                    'sua família e use um banheiro dedicado, se possível. '
                    'Limpe e desinfete as superfícies tocadas com frequência.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
