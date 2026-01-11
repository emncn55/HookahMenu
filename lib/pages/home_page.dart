import 'package:flutter/material.dart';
import 'package:hookah_menu/components/category_tile.dart';
import 'package:hookah_menu/components/filter_bottom_sheet.dart';
import 'package:hookah_menu/components/mix_card.dart';
import 'package:hookah_menu/models/category_data.dart';
import 'package:hookah_menu/models/mix_data.dart';
import 'package:hookah_menu/models/mix_model.dart';
import 'package:hookah_menu/pages/all_mixes_page.dart';
import 'package:hookah_menu/pages/filter_result_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedCategory = "";
  String searchText = "";
  List<MixModel> visibleMixes = [];
  String? selectedTobacco;
  int? selectedIntensity;
  List<MixModel> filteredMixes = [];
  @override
  void initState() {
    super.initState();
    visibleMixes = mixes;
  }

  @override
  Widget build(BuildContext context) {
    // Öne çıkanlar: intensity 6 üstü
    List<MixModel> hotMixes = mixes
        .where(
          (mixes) => mixes.intensity > 6 || mixes.mixTobaccoType == "Blonde",
        )
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(180),
        child: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    'Öne Çıkanlar • Kategoriler',
                    style: TextStyle(fontSize: 15, color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.search, color: Colors.grey[700]),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextField(
                                  onChanged: (value) {
                                    setState(() {
                                      searchText = value.toLowerCase();
                                      visibleMixes = mixes.where((mix) {
                                        final mixName = mix.name.toLowerCase();
                                        final flavor = mix.description
                                            .toLowerCase();

                                        return mixName.contains(searchText) ||
                                            flavor.contains(searchText);
                                      }).toList();
                                    });
                                  },
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText:
                                        "Mix adı, flavor veya marka ara...",
                                    hintStyle: TextStyle(
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.filter_list,
                            color: Colors.grey,
                          ),
                          onPressed: () async {
                            final result = await showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) => const FilterBottomSheet(),
                            );

                            if (result == null) return;

                            final String? tobacco = result["tobacco"];
                            final int? intensity = result["intensity"];

                            if (tobacco == null || intensity == null) return;

                            final List<MixModel> filteredMixes = mixes.where((
                              mix,
                            ) {
                              final tobaccoMatch =
                                  mix.mixTobaccoType.toLowerCase() ==
                                  tobacco.toLowerCase();

                              final intensityMatch = mix.intensity == intensity;

                              return tobaccoMatch && intensityMatch;
                            }).toList();

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => FilterResultPage(
                                  results: filteredMixes,
                                  tobacco: tobacco,
                                  intensity: intensity,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: 24,
          right: 16,
          top: 10,
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Kategoriler
            Padding(
              padding: const EdgeInsets.only(left: 10, bottom: 5),
              child: Text(
                'Kategoriler',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return GestureDetector(
                    onTap: () {
                      if (category['name'] == "All Mixes") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const AllMixesPage(),
                          ),
                        );
                      }

                      if (category['name'] == "Dark") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                const AllMixesPage(tobaccoType: "Dark"),
                          ),
                        );
                      }

                      if (category['name'] == "Blonde") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                const AllMixesPage(tobaccoType: "Blonde"),
                          ),
                        );
                      }

                      if (category['name'] == "Cigar") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                const AllMixesPage(tobaccoType: "Cigar"),
                          ),
                        );
                      }
                    },
                    child: CategoryTile(
                      category: category['name']!,
                      image: category['image']!,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 15),
            if (searchText.isNotEmpty) ...[
              const SizedBox(height: 10),
              Text(
                'Arama Sonuçları',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              visibleMixes.isEmpty
                  ? const Text("Sonuç bulunamadı")
                  : GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: visibleMixes.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            childAspectRatio: 3.5,
                          ),
                      itemBuilder: (context, index) {
                        return MixCard(mix: visibleMixes[index]);
                      },
                    ),
              const SizedBox(height: 20),
            ],
            // Öne Çıkanlar
            Text(
              'Öne Çıkanlar',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 7),
            SizedBox(
              height: 193,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: hotMixes.length,
                itemBuilder: (context, index) {
                  return MixCard(mix: hotMixes[index]);
                },
              ),
            ),
            const SizedBox(height: 20),

            // Küçük bilgilendirici alanlar - alt alta
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Nasıl Karışım Seçilir?
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Nasıl Karışım Seçilir?"),
                        content: Text(
                          "1. Yoğunluğa karar verin.\n"
                          "2. Meyveli, tatlı veya klasik aromaları tercih edin.\n"
                          "3. Farklı markaları deneyerek kendi favorinizi bulun.",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("Kapat"),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 12),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.orange[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.info, color: Colors.orange),
                        const SizedBox(height: 6),
                        Text(
                          "Nasıl Karışım Seçilir?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange[800],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
