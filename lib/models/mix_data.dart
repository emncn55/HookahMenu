import 'package:hookah_menu/models/mix_model.dart';

List<MixModel> mixes = [
  MixModel(
    id: "tropical_sunrise",
    name: "Tropical Sunrise",
    description:
        "Taze mango, olgun şeftali ve tatlı-ekşi narenciye aromalarının ferahlatıcı bir karışımı.",
    ingredients: {
      "Erics Mango": 0.3,
      "Orange Team": 0.2,
      "Sweet Peach": 0.3,
      "Turbo Tea": 0.2,
    },
    intensity: 7,
    isFavorite: false,
    mixType: "Meyveli",
    mixTobaccoType: "Dark",
    mixWeight: 50,
    similarMixes: [],
  ),

  MixModel(
    id: "tropical_fusion",
    name: "Tropical Fusion",
    description:
        "Tropikal ananas, olgun şeftali ve ferah lime aromalarının enerjik karışımı.",
    ingredients: {
      "Ananas Shock": 0.4,
      "Brazilian Tea": 0.2,
      "Lemon Blast": 0.1,
      "Moon Peach": 0.3,
    },
    intensity: 6,
    isFavorite: false,
    mixType: "Meyveli",
    mixTobaccoType: "Dark",
    mixWeight: 50,
    similarMixes: [],
  ),

  MixModel(
    id: "sweet_indulgence",
    name: "Sweet Indulgence",
    description:
        "Kremamsı waffle, brownie ve karamelize fıstık aromalarının tatlı karışımı.",
    ingredients: {
      "Creamy Waffle": 0.3,
      "Brownie": 0.4,
      "Deep Blue Sea": 0.1,
      "Monkey Nuts": 0.2,
    },
    intensity: 8,
    isFavorite: false,
    mixType: "Pastane",
    mixTobaccoType: "Cigar",
    mixWeight: 50,
    similarMixes: [],
  ),

  MixModel(
    id: "tropical_harmony",
    name: "Tropical Harmony",
    description: "Tropikal mango, ananas ve çileğin dengeli karışımı.",
    ingredients: {
      "Pineapple Mango": 0.4,
      "Passion Plum": 0.2,
      "Brazilian Tea": 0.1,
      "Tropic Juice": 0.2,
      "Strawberry": 0.1,
    },
    intensity: 5,
    isFavorite: false,
    mixType: "Meyveli",
    mixTobaccoType: "Dark",
    mixWeight: 50,
    similarMixes: [],
  ),

  MixModel(
    id: "citrus_brownie",
    name: "Citrus Brownie",
    description: "Çikolata, limon ve portakalın tatlı-ferah dengesi.",
    ingredients: {
      "Brownie": 0.6,
      "Lemon Pie": 0.2,
      "Lemon": 0.1,
      "Orange Team": 0.1,
    },
    intensity: 8,
    isFavorite: false,
    mixType: "Pastane",
    mixTobaccoType: "Dark",
    mixWeight: 100,
    similarMixes: [],
  ),

  MixModel(
    id: "fruity_symphony",
    name: "Fruity Symphony",
    description: "Passion fruit, şeftali ve çileğin tropikal uyumu.",
    ingredients: {
      "Passion Fruits": 0.6,
      "Moon Peach": 0.2,
      "Strawberry": 0.1,
      "Orange Team": 0.1,
    },
    intensity: 6,
    isFavorite: false,
    mixType: "Meyveli",
    mixTobaccoType: "Dark",
    mixWeight: 100,
    similarMixes: [],
  ),

  MixModel(
    id: "exotic_paradise",
    name: "Exotic Paradise",
    description: "Egzotik meyvelerin ferah ve enerjik karışımı.",
    ingredients: {
      "Jungle Mix": 0.3,
      "Sweet Peach": 0.3,
      "Pineapple Mango": 0.3,
      "Supernova": 0.1,
    },
    intensity: 6,
    isFavorite: false,
    mixType: "Meyveli",
    mixTobaccoType: "Dark",
    mixWeight: 100,
    similarMixes: [],
  ),

  MixModel(
    id: "citrus_noir",
    name: "Citrus Noir",
    description: "Narenciye ve baharatlı aromaların güçlü uyumu.",
    ingredients: {"Citrus Mix": 0.4, "Kashmir Black": 0.4, "Pinkman": 0.2},
    intensity: 6,
    isFavorite: false,
    mixType: "Meyveli",
    mixTobaccoType: "Dark",
    mixWeight: 6,
    similarMixes: [],
  ),

  MixModel(
    id: "kremali_waffle_ruyasi",
    name: "Kremalı Waffle Rüyası",
    description: "Waffle, brownie ve pudingin tatlı uyumu.",
    ingredients: {"Brownie": 0.4, "Pudding": 0.3, "Creamy Waffle": 0.3},
    intensity: 6,
    isFavorite: false,
    mixType: "Pastane",
    mixTobaccoType: "Cigar",
    mixWeight: 6,
    similarMixes: [],
  ),

  MixModel(
    id: "plombir_dejavu_mix",
    name: "Dondurma Deja Vu",
    description: "Dondurma ve ferah meyve aromalarının hafif karışımı.",
    ingredients: {"Plombir": 0.4, "Deja Vu": 0.6},
    intensity: 3,
    isFavorite: false,
    mixType: "Pastane",
    mixTobaccoType: "Blonde",
    mixWeight: 6,
    similarMixes: [],
  ),
  MixModel(
    id: "paradise_red_hood_cookie_milk",
    name: "Paradise Red Hood Cookie Milk",
    description: "Tatlı ve meyvemsi aromaların sütlü ve yumuşak bir karışımı.",
    ingredients: {
      "Musthave Paradise": 0.25,
      "Satyr Red Hood": 0.25,
      "Spectrum Cookie Milk": 0.50,
    },
    intensity: 6,
    isFavorite: false,
    mixType: "Pastane",
    mixTobaccoType: "Dark",
    mixWeight: 6,
    similarMixes: [],
  ),

  MixModel(
    id: "griffinberry_yuzu_orange_ananas",
    name: "Griffinberry Yuzu Fusion",
    description:
        "Berry, narenciye ve tropikal ananas aromalarının ferah karışımı.",
    ingredients: {
      "Satyr Griffinberry": 0.30,
      "Deus Yuzu": 0.20,
      "Musthave Orange Team": 0.20,
      "Satyr Ananas": 0.20,
    },
    intensity: 6,
    isFavorite: false,
    mixType: "Meyveli",
    mixTobaccoType: "Dark",
    mixWeight: 6,
    similarMixes: [],
  ),

  MixModel(
    id: "cookies_whiskey_bauah",
    name: "Cookies & Whiskey",
    description:
        "Tatlı kurabiye notalarıyla harmanlanmış yoğun ve karakterli bir whiskey dokunuşu.",
    ingredients: {
      "Trofimoffs Cookies": 0.40,
      "Bonche Whiskey": 0.20,
      "Overdose Bauah": 0.40,
    },
    intensity: 8,
    isFavorite: false,
    mixType: "Pastane",
    mixTobaccoType: "Cigar",
    mixWeight: 6,
    similarMixes: [],
  ),

  MixModel(
    id: "orange_team_blossom_guinness",
    name: "Orange Blossom Guinness",
    description:
        "Narenciye tatlılığı ile Guinness aromalarının dengeli birleşimi.",
    ingredients: {
      "Musthave Orange Team": 0.50,
      "Deus Orange Blossom": 0.20,
      "Deus Guinness": 0.30,
    },
    intensity: 4,
    isFavorite: false,
    mixType: "Citrus",
    mixTobaccoType: "Blonde",
    mixWeight: 6,
    similarMixes: [],
  ),

  MixModel(
    id: "caribbean_banano_brownie",
    name: "Caribbean Banana Brownie",
    description:
        "Karayip tütünü, muz ve brownie aromalarının yoğun ve tatlı uyumu.",
    ingredients: {
      "Morpheus Caribbean Tobacco": 0.30,
      "Overdose Black Banano": 0.20,
      "Satyr Brownie": 0.50,
    },
    intensity: 6,
    isFavorite: false,
    mixType: "Pastane",
    mixTobaccoType: "Dark",
    mixWeight: 6,
    similarMixes: [],
  ),

  MixModel(
    id: "queen_of_persia_margarita_yuzu",
    name: "Persian Margarita",
    description:
        "Egzotik ve ferah aromaların narenciye ağırlıklı canlı karışımı.",
    ingredients: {
      "Satyr Queen of Persia": 0.50,
      "Satyr Margarita": 0.30,
      "Deus Yuzu": 0.20,
    },
    intensity: 6,
    isFavorite: false,
    mixType: "Meyveli",
    mixTobaccoType: "Dark",
    mixWeight: 6,
    similarMixes: [],
  ),
];
