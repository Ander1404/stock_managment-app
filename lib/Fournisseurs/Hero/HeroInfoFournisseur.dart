
 class HeroInfoFournisseur{
  final String title;
  final String subtitle;
  final String image;

  HeroInfoFournisseur({required this.title, required this.subtitle, required this.image});
 }

 class HeroItemsFourni{
  List<HeroInfoFournisseur> items =[
    HeroInfoFournisseur(title: "John Doe", subtitle: "john.doe@gmail.com", image: "assets/image1.png"),
    HeroInfoFournisseur(title: "John Doe", subtitle: "john.doe@gmail.com", image: "assets/image2.png"),
    HeroInfoFournisseur(title: "John Doe", subtitle: "john.doe@gmail.com", image: "assets/image3.png"),
    HeroInfoFournisseur(title: "John Doe", subtitle: "john.doe@gmail.com", image: "assets/image4.png"),
    HeroInfoFournisseur(title: "John Doe", subtitle: "john.doe@gmail.com", image: "assets/image5.png"),
    HeroInfoFournisseur(title: "John Doe", subtitle: "john.doe@gmail.com", image: "assets/image6.png"),
    HeroInfoFournisseur(title: "John Doe", subtitle: "john.doe@gmail.com", image: "assets/image7.png"),
    HeroInfoFournisseur(title: "John Doe", subtitle: "john.doe@gmail.com", image: "assets/image8.png"),

  ];
 }