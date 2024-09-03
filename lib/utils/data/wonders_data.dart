List<Location> locations = [
  Location(
      name: 'Taj mahel',
      urlImage:
          'https://cdn.pixabay.com/photo/2023/03/22/16/05/tajmahal-7869968_640.jpg',
      country: 'Agra, India.',
      starRating: 4,
      latitude: 'SOUTH LAT 39',
      longitude: 'WEST LNG 41',
      reviews: Reviews.allReviews,
      description:
          "This mausoleum complex in Agra, India, is regarded as one of the world's most iconic monuments and is perhaps the finest example of Mughal architecture. It was built by Emperor Shah Jahān (reigned 1628-58) to honor his wife Mumtāz Maḥal ( Chosen One of the Palace ), who died in 1631 giving birth to their 14th child. It took about 22 years and 20,000 workers to construct the complex."),
  Location(
      name: 'Great Wall of China',
      urlImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSeBRHBf5qJZBto16HwWTGfus1oK-LvE50iYQ&s',
      country: 'Beijing, China.',
      starRating: 4,
      latitude: 'NORTH LAT 24',
      longitude: 'EAST LNG 17',
      reviews: Reviews.allReviews,
      description:
          'Great might be an understatement. One of the world\'s largest building-construction projects, the Great Wall of China is widely thought to be about 5,500 miles (8,850 km) long; a disputed Chinese study, however, claims the length is 13,170 miles (21,200 km). Work began in the 7th century BCE and continued for two millennia.'),
  Location(
      name: 'Chichén Itzá',
      urlImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2Il_uFOpfYWDUoAeDMqBk60PWz1GaD3WAVw&s',
      country: 'Yucatán, Mexico.',
      starRating: 4,
      latitude: 'SOUTH LAT 14',
      longitude: 'EAST LNG 27',
      reviews: Reviews.allReviews,
      description:
          "Chichén Itzá is a Mayan city on the Yucatán Peninsula in Mexico, which flourished in the 9th and 10th centuries CE. Under the Mayan tribe Itzá—who were strongly influenced by the Toltecs—a number of important monuments and temples were built. Among the most notable is the stepped pyramid El Castillo (The Castle), which rises 79 feet (24 meters) above the Main Plaza."),
  Location(
      name: 'Petra',
      urlImage: 'assets/sea2.jpg',
      country: 'Ma\'an Governorate, Jordan.',
      starRating: 4,
      latitude: 'NORTH LAT 24',
      longitude: 'WEST LNG 08',
      reviews: Reviews.allReviews,
      description:
          "The ancient city of Petra, Jordan, is located in a remote valley, nestled among sandstone mountains and cliffs. It was purported to be one of the places where Moses struck a rock and water gushed forth. Later the Nabataeans, an Arab tribe, made it their capital, and during this time it flourished, becoming an important trade center, especially for spices."),
  Location(
      name: 'Machu Picchu',
      urlImage:
          'https://cdn.britannica.com/30/94530-050-99493FEA/Machu-Picchu.jpg?w=600&q=60',
      country: 'Cusco Region, Peru.',
      starRating: 4,
      latitude: 'SOUTH LAT 39',
      longitude: 'WEST LNG 41',
      reviews: Reviews.allReviews,
      description:
          "This Incan site near Cuzco, Peru, was “discovered” in 1911 by Hiram Bingham, who believed it was Vilcabamba, a secret Incan stronghold used during the 16th-century rebellion against Spanish rule. Although that claim was later disproved, the purpose of Machu Picchu has confounded scholars. Bingham believed it was home to the “Virgins of the Sun,” women who lived in convents under a vow of chastity."),
  Location(
      name: 'Christ the Redeemer',
      urlImage:
          'https://cdn.britannica.com/54/150754-050-5B93A950/statue-Christ-the-Redeemer-Rio-de-Janeiro.jpg?w=600&q=60',
      country: 'Rio de Janeiro, Brazil.',
      starRating: 4,
      latitude: 'SOUTH LAT 39',
      longitude: 'WEST LNG 41',
      reviews: Reviews.allReviews,
      description:
          "Christ the Redeemer, a colossal statue of Jesus, stands atop Mount Corcovado in Rio de Janeiro. Its origins date to just after World War I, when some Brazilians feared a “tide of godlessness.” They proposed a statue, which was ultimately designed by Heitor da Silva Costa, Carlos Oswald, and Paul Landowski. Construction began in 1926 and was completed five years later."),
  Location(
      name: 'Colosseum',
      urlImage:
          'https://cdn.britannica.com/36/162636-131-E4AA93A0/Colosseum-Rome-Italy.jpg?w=600&q=60',
      country: 'Rome, Italy.',
      starRating: 4,
      latitude: 'SOUTH LAT 39',
      longitude: 'WEST LNG 41',
      reviews: Reviews.allReviews,
      description:
          "The Colosseum in Rome was built in the first century by order of the Emperor Vespasian. A feat of engineering, the amphitheater measures 620 by 513 feet (189 by 156 meters) and features a complex system of vaults. It was capable of holding 50,000 spectators, who watched a variety of events. Perhaps most notable were gladiator fights, though men battling animals was also common."),
];

class Reviews {
  static List<Review> allReviews = [
    Review(
      date: 'FEB 14th',
      username: 'Michael Scoffield',
      urlImage:
          'https://cdn.pixabay.com/photo/2015/03/04/22/35/avatar-659652_640.png',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
    ),
    Review(
      date: 'JAN 24th',
      username: 'Daniel Kraig',
      urlImage:
          'https://png.pngtree.com/png-vector/20190710/ourmid/pngtree-user-vector-avatar-png-image_1541962.jpg',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
    ),
    Review(
      date: 'MAR 18th',
      username: 'Amanda Linn',
      urlImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHqWZxoBKoq3m3mW2f52nFnKI-bFPEjAh84HIojHWSQYOn6XevhtczNdVCobwL8ulDclA&usqp=CAU',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
    ),
    Review(
      date: 'AUG 15th',
      username: 'Kim Wexler',
      urlImage:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDyVnOBlwkzudE1gDEXFmGKCM-Z4dH6_XfVMBMrpGmVcdj81LQMv13G19VhE7IN7fI47o&usqp=CAU',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat',
    ),
  ];
}

class Location {
  final String name;
  final String urlImage;
  final String latitude;
  final String longitude;
  final String country;
  final double starRating;
  final String description;
  final List<Review> reviews;

  Location({
    this.reviews = const [],
    this.name = '',
    this.urlImage = '',
    this.latitude = '',
    this.longitude = '',
    this.country = '',
    this.starRating = 0,
    this.description = '',
  });
}

class Review {
  final String username;
  final String urlImage;
  final String date;
  final String description;

  Review({
    this.username = '',
    this.urlImage = '',
    this.date = '',
    this.description = '',
  });
}
