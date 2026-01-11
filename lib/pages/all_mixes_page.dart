import 'package:flutter/material.dart';
import 'package:hookah_menu/models/mix_data.dart';
import 'package:hookah_menu/models/mix_model.dart';

class AllMixesPage extends StatelessWidget {
  final String? tobaccoType;
  // Eğer tobaccoType null ise tüm mixler gösterilir, değilse sadece o türe ait mixler gösterilir.
  const AllMixesPage({super.key, this.tobaccoType});

  @override
  Widget build(BuildContext context) {
    final List<MixModel> mixList = tobaccoType == null
        ? mixes
        : mixes.where((mix) => mix.mixTobaccoType == tobaccoType).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                children: [
                  const Text(
                    'Nargile Karışım Menü',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    tobaccoType == null ? "Tüm mixler" : "$tobaccoType Mixler",
                    style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 15),
                  Container(height: 1, color: Colors.grey[300]),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  tobaccoType == null ? "Tüm mixler" : "$tobaccoType Mixler",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  "${mixList.length} sonuç",
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: mixList.length,
                itemBuilder: (context, index) {
                  final mix = mixList[index];

                  return Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          mix.name,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(mix.description),
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(mix.mixTobaccoType),
                            Row(
                              children: List.generate(
                                mix.intensity,
                                (i) => const Icon(
                                  Icons.local_fire_department,
                                  size: 16,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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
