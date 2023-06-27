class GymData {
  final String gymName;
  final String location;
  final String status;
  final num priceLow;
  final num priceHigh;
  final String imageurl;

  GymData({
    required this.gymName,
    required this.location,
    required this.status,
    required this.priceLow,
    required this.priceHigh,
    required this.imageurl,
  });
}

List<GymData> gymData = [
  GymData(
    gymName: 'Open Gym',
    location: "2 km",
    status: 'Onsite',
    priceLow: 150000,
    priceHigh: 1800000,
    imageurl: 'assets/images/open-gym.png',
  ),
  GymData(
    gymName: 'Fit3 Gym',
    location: "1.5 km",
    status: 'Onsite',
    priceLow: 650000,
    priceHigh: 7500000,
    imageurl: 'assets/images/fit3-gym.png',
  ),
  GymData(
    gymName: 'Celebirty Fitness',
    location: "2.5 km",
    status: 'Onsite',
    priceLow: 500000,
    priceHigh: 6000000,
    imageurl: 'assets/images/celebrity.png',
  ),
  GymData(
    gymName: 'Mr. Jhons',
    location: "Zoom, Google Meet",
    status: 'Online',
    priceLow: 150000,
    priceHigh: 1500000,
    imageurl: 'assets/images/jhons.png',
  ),
  GymData(
    gymName: 'Mrs. Diana',
    location: "Zoom Google Meet",
    status: 'Online',
    priceLow: 130000,
    priceHigh: 1300000,
    imageurl: 'assets/images/diana.png',
  ),
  GymData(
    gymName: 'Mrs. Angelina',
    location: "Zoom Google Meet",
    status: 'Online',
    priceLow: 160000,
    priceHigh: 1600000,
    imageurl: 'assets/images/angelina.png',
  ),
];
