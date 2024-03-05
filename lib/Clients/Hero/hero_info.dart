
 class HeroInfo{
  final String title;
  final String subtitle;
  final String image;

  HeroInfo({required this.title, required this.subtitle, required this.image});
 }

 class HeroItems{
  List<HeroInfo> items =[
    HeroInfo(title: "John Doe", subtitle: "john.doe@gmail.com", image: "assets/image1.png"),
    HeroInfo(title: "John Doe", subtitle: "john.doe@gmail.com", image: "assets/image2.png"),
    HeroInfo(title: "John Doe", subtitle: "john.doe@gmail.com", image: "assets/image3.png"),
    HeroInfo(title: "John Doe", subtitle: "john.doe@gmail.com", image: "assets/image4.png"),
    HeroInfo(title: "John Doe", subtitle: "john.doe@gmail.com", image: "assets/image5.png"),
    HeroInfo(title: "John Doe", subtitle: "john.doe@gmail.com", image: "assets/image6.png"),
    HeroInfo(title: "John Doe", subtitle: "john.doe@gmail.com", image: "assets/image7.png"),
    HeroInfo(title: "John Doe", subtitle: "john.doe@gmail.com", image: "assets/image8.png"),

  ];
 }