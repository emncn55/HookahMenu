import 'package:flutter/material.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  String selectedTobacco = "DARK";
  int selectedIntensity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// başlık
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Filtreler",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),

          const SizedBox(height: 20),

          /// Tütün tipi
          const Text(
            "Tütün Tipi",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),

          Row(
            children: ["DARK", "BLONDE", "CIGAR"].map((type) {
              final isSelected = selectedTobacco == type;
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ChoiceChip(
                  label: Text(type),
                  selected: isSelected,
                  onSelected: (_) {
                    setState(() {
                      selectedTobacco = type;
                    });
                  },
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 25),

          /// Yoğunluk
          const Text("Yoğunluk", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),

          Row(
            children: List.generate(10, (index) {
              final value = index + 1;
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  label: Text(value.toString()),
                  selected: selectedIntensity == value,
                  onSelected: (_) {
                    setState(() {
                      selectedIntensity = value;
                    });
                  },
                ),
              );
            }),
          ),

          const Spacer(),

          /// uygula butonu
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  "tobacco": selectedTobacco,
                  "intensity": selectedIntensity,
                });
              },
              child: const Text("Filtreyi Uygula"),
            ),
          ),
        ],
      ),
    );
  }
}
