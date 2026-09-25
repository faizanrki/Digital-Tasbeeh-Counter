import 'package:flutter/material.dart';
import 'tasbeeh.dart';

class TasbeehScreen extends StatefulWidget {
  const TasbeehScreen({super.key});

  @override
  State<TasbeehScreen> createState() {
    return _TasbeehScreenState();
  }
}


class _TasbeehScreenState extends State<TasbeehScreen> {

  Tasbeeh tasbeeh = Tasbeeh.subhanAllah();

  String selectedDhikr = "SubhanAllah";


  // Change Tasbeeh
  void changeTasbeeh(String value) {
    setState(() {
      selectedDhikr = value;

      if (value == "SubhanAllah") {
        tasbeeh = Tasbeeh.subhanAllah();
      } 
      
      else if (value == "Alhamdulillah") {
        tasbeeh = Tasbeeh.alhamdulillah();
      } 
      
      else if (value == "Allahu Akbar") {
        tasbeeh = Tasbeeh.allahAkbar();
      }
    });
  }


  // Count Button
  void countTasbeeh() {

    bool wasCompleted = tasbeeh.isCompleted;

    setState(() {
      tasbeeh.increment();
    });

    if (!wasCompleted && tasbeeh.isCompleted) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Target Reached for ${tasbeeh.dhikrName}!",
          ),
        ),
      );
    }
  }


  // Reset Button
  void resetTasbeeh() {
    setState(() {
      tasbeeh.reset();
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Digital Tasbeeh Counter"),
        centerTitle: true,
      ),


      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            const Text(
              "Select Dhikr",
              style: TextStyle(
                fontSize: 18,
              ),
            ),


            const SizedBox(height: 10),


            DropdownButton<String>(

              value: selectedDhikr,

              items: const [

                DropdownMenuItem(
                  value: "SubhanAllah",
                  child: Text("SubhanAllah"),
                ),

                DropdownMenuItem(
                  value: "Alhamdulillah",
                  child: Text("Alhamdulillah"),
                ),

                DropdownMenuItem(
                  value: "Allahu Akbar",
                  child: Text("Allahu Akbar"),
                ),
              ],


              onChanged: (value) {

                if (value != null) {
                  changeTasbeeh(value);
                }
              },
            ),


            const SizedBox(height: 30),


            Text(
              tasbeeh.dhikrName,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),


            const SizedBox(height: 20),


            Text(
              "${tasbeeh.counter}",
              style: const TextStyle(
                fontSize: 70,
                fontWeight: FontWeight.bold,
              ),
            ),


            Text(
              "Target: ${tasbeeh.target}",
              style: const TextStyle(
                fontSize: 18,
              ),
            ),


            const SizedBox(height: 30),


            ElevatedButton(
              onPressed: countTasbeeh,
              child: const Text("COUNT +1"),
            ),


            const SizedBox(height: 10),


            ElevatedButton(
              onPressed: resetTasbeeh,
              child: const Text("RESET"),
            ),


            const SizedBox(height: 25),


            Text(
              tasbeeh.isCompleted
                  ? "Target Completed!"
                  : "Keep Counting",

              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}