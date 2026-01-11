import 'package:flutter/material.dart';
import 'package:hookah_menu/components/mix_card.dart';
import 'package:hookah_menu/models/mix_model.dart';

class FilterResultPage extends StatelessWidget {
  final List<MixModel> results;
  final String tobacco;
  final int intensity;

  const FilterResultPage({
    super.key,
    required this.results,
    required this.tobacco,
    required this.intensity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Filtre Sonuçları",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Üst bilgi
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "$tobacco • Yoğunluk $intensity",
              style: TextStyle(color: Colors.grey[700]),
            ),
          ),

          /// Sonuçlar
          Expanded(
            child: results.isEmpty
                ? const Center(
                    child: Text(
                      "Bu filtreye uygun mix bulunamadı",
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                : LayoutBuilder(
                    builder: (context, constraints) {
                      final width = constraints.maxWidth;

                      final crossAxisCount = width > 1200
                          ? 3
                          : width > 800
                          ? 2
                          : 1;

                      return GridView.builder(
                        padding: const EdgeInsets.all(16),
                        itemCount: results.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          childAspectRatio: 2.5,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemBuilder: (context, index) {
                          return MixCard(mix: results[index]);
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
