import 'package:cakecraft/screens/CakeCraftHome.dart';
import 'package:cakecraft/screens/DashboardScreen.dart';
import 'package:concentric_transition/page_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'CardCakeCraft.dart';

//---------------Onboarding
class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        colors: data.map((e) => e.backgroundColor).toList(),
        itemCount: data.length,
        itemBuilder: (int index) {
          return Container(
              alignment: Alignment.center, child: CardLince(data: data[index]));
        },
        onFinish: () {
          Navigator.pushReplacement(
            context, //terminando el onboarding llegamos al home page
            MaterialPageRoute(builder: (context) => const DashboardScreen()),
          );
        },
      ),
    );
  }
}

//---------------Onboarding CARDS
final data = [
  CardCakecraft(
      title: "CakeCraft: Deléitate con Nuestros Exquisitos Caprichos",
      subtitle:
          "Deliciosos postres artesanales que te deleitarán con su sabor único. En nuestra"
          "Pastelería CakeCraft, creamos magia dulce en cada bocado."
          "¡Déjate llevar por la tentación y disfruta de una experiencia única para tu paladar!",
      image: AssetImage('assets/6.png'),
      backgroundColor: Color.fromARGB(206, 177, 117, 67),
      titleColor: Color.fromARGB(255, 36, 20, 5),
      subtitleColor: Color.fromARGB(255, 53, 38, 38),
      background: LottieBuilder.asset('assets/fon.json')),
  CardCakecraft(
      title: "Sweet Creations: Encarga tus Delicias Personalizadas",
      subtitle:
          "En nuestra pastelería creativa, convertimos tus sueños en dulces realidad. Desde"
          "pasteles personalizados hasta deliciosos cupcakes temáticos, nos apasiona crear "
          "diseños únicos y sabores irresistibles. Permítenos endulzar tus momentos especiales"
          " con pedidos personalizados que cautivarán todos los sentidos.",
      image: AssetImage('assets/7.png'),
      backgroundColor: Color.fromARGB(230, 188, 145, 203),
      titleColor: Color.fromARGB(255, 53, 38, 38),
      subtitleColor: Color.fromARGB(255, 53, 38, 38),
      background: LottieBuilder.asset('assets/fon3.json')),
  CardCakecraft(
      title: "Sweet Delights: Explora Nuestros Encantadores Departamentos",
      subtitle:
          "Descubre el Paraíso de los Cupcakes, Gelatinas y Chocolatería en"
          " CakeCraft. Déjate seducir por la variedad de sabores y "
          "diseños únicos que ofrecemos. ¡Sumérgete en un mundo de dulzura y"
          " déjate tentar por nuestras deliciosas creaciones!",
      image: AssetImage('assets/8.png'),
      backgroundColor: Color.fromARGB(223, 194, 197, 199),
      titleColor: Color.fromARGB(255, 53, 38, 38),
      subtitleColor: Color.fromARGB(255, 53, 38, 38),
      background: LottieBuilder.asset('assets/fon.json'))
];
