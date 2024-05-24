import 'package:pharmacy_skeleton/models/product.dart';

List<Product> dummyProducts = [
  Product(
      id: 1,
      productName: "Organic Multivitamin Supplement",
      productImage:
          "https://images-na.ssl-images-amazon.com/images/I/719IdrJYtHL.jpg",
      productPrice: 25000,
      productUsage: "Daily dietary support",
      productDescription:
          "Contains essential vitamins and minerals to support overall health and well-being.",
      productIngredients: [
        "Vitamin A (as Retinol)",
        "Vitamin C (as Ascorbic Acid)",
        "Vitamin D3 (as Cholecalciferol)",
        "Vitamin E (as d-Alpha Tocopherol)",
        "B Vitamins (Thiamin, Riboflavin, Niacin, Vitamin B6, Folate, Biotin, Pantothenic Acid)",
        "Minerals (Calcium, Magnesium, Zinc, Iodine, Selenium)",
      ],
      productWarnings: [
        "Consult your doctor before use if pregnant, nursing, or taking medication.",
        "Keep out of reach of children."
      ],
      productTags: [
        "multivitamin",
        "vitamins",
        "minerals",
        "health",
        "wellness",
        "suppliments",
        "adults",
      ],
      quantityPerUnit: "60 capsules",
      quantity: 1),
  Product(
      id: 2,
      productName: "Natural Protein Powder",
      productImage:
          "https://i5.walmartimages.com/asr/29688e55-774b-476b-8224-95102f4fe369_1.357dd97fddce3d6c85d2938b8edff465.jpeg",
      productPrice: 30000,
      productUsage: "Support muscle growth and recovery",
      productDescription:
          "Pea protein-based powder with added BCAAs and digestive enzymes.",
      productIngredients: [
        "Pea Protein Isolate",
        "Branch Chain Amino Acids (L-Leucine, L-Isoleucine, L-Valine)",
        "Digestive Enzymes (Bromelain, Papain)",
        "Natural Flavors",
        "Stevia Extract"
      ],
      productWarnings: [
        "Consult your doctor before use if you have any allergies or medical conditions.",
        "Do not exceed recommended dosage."
      ],
      productTags: [
        "protein powder",
        "muscle growth",
        "recovery",
        "pea protein",
        "vegan",
        "adult",
        "children"
      ],
      quantityPerUnit: "30 servings",
      quantity: 1),
  Product(
      id: 3,
      productName: "Omega-3 Fish Oil Supplement",
      productImage:
          "https://i5.walmartimages.com/asr/0a144c72-8776-4462-8d9e-85f9728a36f2_1.5809f31581802b1a499b5dedb424d093.jpeg",
      productPrice: 10000,
      productUsage: "Support heart health and brain function",
      productDescription: "High-potency fish oil capsules with EPA and DHA.",
      productIngredients: [
        "Concentrated Fish Oil (Anchovies, Sardines, Mackerel)",
        "Gelatin (from bovine)",
        "Glycerin",
        "Natural Lemon Flavor",
        "Mixed Tocopherols"
      ],
      productWarnings: [
        "Consult your doctor before use if you are pregnant, nursing, or taking blood thinners.",
        "May cause fishy burp-up."
      ],
      productTags: [
        "fish oil",
        "omega-3",
        "heart health",
        "brain function",
        "EPA",
        "DHA"
      ],
      quantityPerUnit: "60 capsules",
      quantity: 1),
  Product(
      id: 4,
      productName: "Probiotic Supplement",
      productImage:
          "https://th.bing.com/th/id/R.4b59eb3531a9e429dd3a8cd6878730bc?rik=qAYbIPrvmL8JBw&pid=ImgRaw&r=0",
      productPrice: 20000,
      productUsage: "Support gut health and digestion",
      productDescription:
          "10 billion CFUs per serving with multiple probiotic strains.",
      productIngredients: [
        "Bacillus subtilis",
        "Lactobacillus acidophilus",
        "Lactobacillus rhamnosus",
        "Bifidobacterium bifidum",
        "Bifidobacterium lactis",
        "Prebiotic Blend (Fructooligosaccharides, Inulin)",
        "Vegetable Capsule Material"
      ],
      productWarnings: [
        "Keep out of reach of children.",
        "Store in a cool, dry place."
      ],
      productTags: [
        "probiotics",
        "gut health",
        "digestion",
        "microbiome",
        "CFU",
        "tablets"
      ],
      quantityPerUnit: "30 capsules",
      quantity: 1),
  Product(
      id: 5,
      productName: "Organic Green Tea",
      productImage:
          "https://th.bing.com/th/id/R.b6c4b99c0c018076bd3cc0e5441382e0?rik=%2fdCPMnbHwFrPdg&pid=ImgRaw&r=0",
      productPrice: 13000,
      productUsage: "Support energy levels and antioxidant benefits",
      productDescription:
          "Loose leaf green tea from organic, shade-grown farms.",
      productIngredients: [
        "Organic Green Tea Leaves",
      ],
      productWarnings: [
        "Consult your doctor before use if you are pregnant, nursing, or taking medication."
      ],
      productTags: [
        "green tea",
        "organic",
        "antioxidants",
        "energy",
        "caffeine",
        "adults",
        "syrup",
      ],
      quantityPerUnit: "100g",
      quantity: 1),
];
