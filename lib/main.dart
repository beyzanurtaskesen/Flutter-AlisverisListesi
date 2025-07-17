import 'package:flutter/material.dart';
//Kutuphaneyi tanımladık.               //1

void main() =>
    runApp(MyApp()); // Void metodunu çalıştırdık.                 //2

class MyApp extends StatelessWidget {
  //Stateless widgetı olusturduk ve MyApp tanımladık.  //3
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //Material App tanımladık ve onunda altına uygulama ismi ve ana çatıyı kurduk.4
      title: "TO Do uygulaması",
      home: Iskele(),
    );
  }
}

class Iskele extends StatelessWidget {
  // Iskele widgetı tanımladık  ve return olarak Scaffold donderdık.
  const Iskele({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alışveriş Uygulaması"),
      ), //Scaffoldun içerisinde appbar ve body tanımladık.5
      body: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  // Stateful widget tanımlayıp Ana Ekran yazdık.6
  const AnaEkran({super.key});

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  TextEditingController t1 = TextEditingController();
  List<String> alisverisListesi = [];

  elemanEkle() {
    setState(() {
      alisverisListesi.add(t1.text);
      t1.clear(); //Listeyi temizlemek için
    });
  }

  elemanCikar() {
    setState(() {
      alisverisListesi.remove(t1.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // Container - column- Children
      child: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              itemCount: alisverisListesi.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(alisverisListesi[index]),
                  subtitle: Text("Alişveriş Listesi"),
                );
              },
            ),
          ), //Kaydırılabilir bir liste olusutracak.
          TextField(controller: t1),
          ElevatedButton(onPressed: elemanEkle, child: Text("EKLE")),
          ElevatedButton(onPressed: elemanCikar, child: Text("Çıkar")),
          //Orantılı ve dengelı ekran ıcın kullandık
        ],
      ),
    );
  }
}
