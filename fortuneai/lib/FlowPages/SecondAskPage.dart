import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SecondAskPage extends StatelessWidget {
  const SecondAskPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController dateOfBirthController = TextEditingController();
    final TextEditingController timeOfBirthController = TextEditingController();
    final TextEditingController relationshipStatusController = TextEditingController();
    final TextEditingController aboutController = TextEditingController();

    void validateAndProceed() {
      // Boşlukları kontrol et
      if (dateOfBirthController.text.trim().isEmpty ||
          timeOfBirthController.text.trim().isEmpty ||
          relationshipStatusController.text.trim().isEmpty ||
          aboutController.text.trim().isEmpty) {
        // Eğer boş alan varsa hata mesajı göster
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Please fill out all fields before proceeding."),
            backgroundColor: Colors.purple,
          ),
        );
      } else {
        // Eğer tüm alanlar doluysa, ilerlemek için işlem yapılabilir
        // Örneğin, bir sonraki sayfaya yönlendirme yapılabilir
      }
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          "Additional Info",
          style: TextStyle(color: Colors.purple, fontWeight: FontWeight.w500, fontSize: 23),
        ),
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Birth Date",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            TextFormField(
              controller: dateOfBirthController,
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: "DD/MM/YYYY",
                hintStyle: TextStyle(color: Colors.grey),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple),
                ),
              ),
            ),
            const Gap(20),
            const Text(
              "Birth Time",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            TextFormField(
              controller: timeOfBirthController,
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: "HH:MM",
                hintStyle: TextStyle(color: Colors.grey),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple),
                ),
              ),
            ),
            const Gap(20),
            const Text(
              "Relationship Status",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            TextFormField(
              controller: relationshipStatusController,
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: "Single, Married, etc.",
                hintStyle: TextStyle(color: Colors.grey),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple),
                ),
              ),
            ),
            const Gap(20),
            const Text(
              "Introduce yourself",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            TextFormField(
              controller: aboutController,
              maxLines: 3,
              maxLength: 200,
              cursorColor: Colors.white,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: "I'm an artist who loves...",
                hintStyle: TextStyle(color: Colors.grey),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.purple),
                ),
              ),
            ),
            const Gap(30),
            Center(
              child: ElevatedButton(
                onPressed: validateAndProceed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Text("Next", style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
