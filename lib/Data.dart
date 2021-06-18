import 'package:shared_preferences/shared_preferences.dart';


//new Data-----------------------------------------------------------------------------------------------

class EventList {
  String image;
  String name;
  String date;
  String description;
  String venue;
  String contact;
  String category;
  String popular;
  String fees;

  EventList(
      {this.image,
      this.name,
      this.date,
      this.description,
      this.venue,
      this.contact,
      this.category,
      this.popular,
      this.fees});

  String getName() {
    return name;
  }
}

final List<EventList> eventList = [
  EventList(
      image: 'images/auto expo.jpg',
      name: "AUTO EXPO",
      venue: "BASKETBALL COURT",
      description:"Auto Expo, over the last several years has grown tremendously in size and transformed itself into a huge event. Owing to the tremendous growth of Auto Expo, it becomes Tech Acme's largest event jointly organised by Tech Acme & Automobile Department OIST, Always Our Focus is to bring the best Automotives in our Event. We are located at the Basketball Court From 17th-19th of October.",
      date: "17,18,19 October",
      contact: "9340048473",
      fees: "FREE",
      category: "mis",
      popular: "true"),
  EventList(
    name: "ROADIES BATTLEYARD",
    date: "17, 18 October",
    description:"Roadies is a collection of some exciting games to test your skills, physical ability and logic.The game is designed to throw the worst at you to bring out the best in you.So,are you a ready to be a roadie ?",
    contact: "8789881801",
    fees: "Rs 100 per person",
    venue: "OCT GROUND",
    image: "images/roadies.jpg",
    category: "cultural",
    popular: "false",
  ),
  EventList(
    name: "TREASURE HUNT",
    date: "17, 18 October",
    description:
        "Treasure hunt is an event conducted in 3 rounds in time span of two days .Participants need to solve riddles in order to unlock their path towards treasure.With an exciting theme of *pirates* set your sail for unleashed Adventure.",
    contact: "9039169688",
    fees: "Rs 100 per person ",
    venue: "LT-1",
    image: "images/th.jpg",
    category: "cultural",
    popular: "false",
  ),
  EventList(
    name: "Assemble Disassemble",
    date: "17, 18 October",
    description:
        "This is the event where you will get to learn about various Automobile components by completely opening them and then assembling them back.",
    fees: "Rs 100 per person",
    venue: "Basketball Court",
    image: "images/assemble dis.jpg",
    category: "technical",
    contact: "7693096058",
    popular: "false",
  ),
  EventList(
    name: "LAN GAMING",
    date: "17, 18 October",
    description:
        "TechAcme summons all the gamers out there to showcase their talent and revel in the company of fellow gamers. The vision is for the gamers to offer a wide variety of different thrilling experiences throughout our event. So buckle up your seat belt and gear up your energy to have the real bliss as exciting coupons and prizes are waiting for you. So grab this opportunity and get yourself register for the most fascinating event Lan-Gaming.",
    fees: "Rs 100 per  person",
    venue: "Hp1 and Hp2(OIST TB-1)",
    image: "images/lan.jpg",
    category: "cultural",
    contact: "9340586731",
    popular: "true",
  ),
  EventList(
    name: "CAD designing",
    date: "17 October",
    description:
        "In this event, participants are required to design the given drawing on the computer using AutoCAD software.",
    fees: "Rs 100 per person",
    venue: "Cad lab mechanical department ,OIST",
    image: "images/cad.jpg",
    category: "technical",
    contact: "8081012110",
    popular: "false",
  ),
  EventList(
    name: "Talent Star Light",
    date: "17, 18, 19 October",
    description:
        "A platform where students can show their talents such as singing, dancing, playing an instrument or other activities to display skills. ",
    fees: "Rs 100 per person",
    venue: "Auditorium",
    image: "images/tls.jpg",
    category: "cultural",
    contact: "9454185188",
    popular: "false",
  ),    
  EventList(
    name: "Udghosh - The Mock Marliament",
    date: "17, 18 October",
    description:
        "Mock Parliament is here to bridge the gap between Dreamers and Achievers. A platform where the leaders of tomorrow learn from the leaders of today.",
    fees: "Rs 100 per person",
    venue: "MCA seminar hall , OCT , Bhopal",
    image: "images/mock.jpg",
    category: "cultural",
    contact: "9407162372",
    popular: "false",
  ),
  EventList(
    name: "CODEHUNT",
    date: "17, 18 October",
    description:
        "The CODEHUNT will be organized in three rounds. The first round will be a quiz that will be held online and the time duration for the quiz will be 1 hour after that 50 Students will qualify for HardCoding Round. In that round, some programs will be given and they have to solve them in the language of their interest. This round will be of 2 hours approximately. In the final stage, 15 students will be selected for the final round. In the final round, some hardcore programming Questions will be given to students that they have to Solve in an optimized Way with minimum complexities. The round will be of 2 hours. 3 Students will be selected from the Final round considered to be Winner.",
    fees: "Rs 100 per person",
    venue: "CS LAB ",
    image: "images/code hunt.jpg",
    category: "technical",
    contact: "9109606089",
    popular: "true",
  ),
  EventList(
    name: "Skit competition",
    date: "18 October",
    description:
        "A competition in which a group of the team will compete by performing a different skit.",
    fees: "400/- per Team (Max Team size 4)",
    venue: "Electrical seminar hall (OCT)",
    image: "images/skit.jpg",
    category: "youngsters",
    contact: "8269337804",
    popular: "false",
  ),
  EventList(
    name: "3D printing workshop",
    date: "17 October",
    description:
        "Learn what 3D printing is all about , how it works and how you can get starting making your very own objects in no time .",
    fees: "N/A",
    venue: "Automobile seminar hall ",
    image: "images/3d.jpg",
    category: "mis",
    contact: "9993374015",
    popular: "false",
  ),
  EventList(
    name: "Lensense photography workshop ",
    date: "17, 18 October",
    description:
        "TechAcme\nfancy taking pictures much? \nIf you think you're a good photographer, then it's time for you to prepare and prosper.Here's an opportunity to showcase your Photography skills and win hearts.Unleash your creativity and prove yourself\n In this workshop on Photography, you will learn,  to compose and generate quality content, from the expert who  has  established himself  in the field on his  own with his sheer talent and dedication.Followed by the workshop, we'd have an exhibition of the finest and unexceptional photographs. It's gonna be an awe-inspiring, enthralling experience. \nWelcome to the club, pal.",
    fees: "Rs 100 per person",
    venue: "CS SEMINAR HALL",
    image: "images/lensense.jpg",
    category: "mis",
    contact: "9406625133",
    popular: "false",
  ),
  EventList(
    name: "Paper Presentation",
    date: "18, 19 October",
    description:
        "Paper Presentation is all about how you put your topic or present your topic in front of the audience. They see the way you present your topic, the way you put your points, your presentation style, your language and how promptly and effectively you answer their questions",
    fees: "100/- per person",
    venue: "M.C.A Seminar hall",
    image: "images/paper pres.jpg",
    category: "technical",
    contact: "9162731210",
    popular: "false",
  ),
  EventList(
    name: "Circuit Designing ",
    date: "18, 19 October",
    description:
        "EVENT - CIRCUIT DESIGNING \n* It is a technical event in which our knowledge about electronics will be tested with a series of designing and  implementing task on breadboard. As the participant you would be ask to design a circuit for given problem , statement and implement them in the most efficient way possible on breadboard . \n*  It is organized by ELECTRICAL AND ELECTRONICS DEPARTMENT of OCT,Bhopal for techacme every year.\n* We provide free two days workshop for the participants before the event and teach them about designing and implementing of circuits.\n*  It consist of two round in which  level of competition increases at every stage :-\nFIRST ROUND - It consist of designing of simple circuit under a definite amount of time.\nHERE, we provide all require equipment for the parcipants for designing circuits.\nSECOND ROUND- Those who qualify round first are only eligible for second round.\nIt is quite difficult as compared to first round in which complicated circuit are given to the participants.\nRULES- * In each team two members are allowed. \n* Time duration for a round is fixed.\n*  Mobiles are not allowed during the competition.",
    fees: "150 per person, 300 per team",
    venue: "EX Seminar Hall OCT ",
    image: "images/circuit.jpg",
    category: "technical",
    contact: "9926873028",
    popular: "false",
  ),
  EventList(
    name: "Open Mic",
    date: "17, 18, 19 October",
    description: "A platform for all talents: Singing, rapping, poetry, shayri",
    fees: "100/- per person",
    venue: "OCT Stairs",
    image: "images/open mic.jpg",
    category: "youngsters",
    contact: "8818866582",
    popular: "true",
  ),
  EventList(
    name: "Fashion show ",
    date: "18 October",
    description:
        "Fashion show \n1st round @12 pm in Auditorium till 4 pm\n2nd round @6 pm in OCT ground",
    fees: "200/- per person",
    venue: "OGI Auditorium",
    image: "images/fashion.jpg",
    category: "mis",
    contact: "8602228152",
    popular: "true",
  ),
  EventList(
    name: "MEGA STRUCTURE",
    date: "18 October",
    description:
        "Mega structure,the event will be held on 18th Oct at microwave lab the participants must follow the given rules and regulations. Contact coordinators for details.",
    fees: "100/- per person",
    venue: "Microwave Lab,OCT",
    image: "images/mega str.jpg",
    category: "technical",
    contact: "7804088844",
    popular: "false",
  ),
  EventList(
    name: "Jugaad ",
    date: "17 October",
    description: "Its all about *KABAAD SE JUGAAD*",
    fees: "100/- per person",
    venue: "NEAR OIST WORKSHOP ",
    image: "images/jugaad.jpg",
    category: "youngsters",
    contact: "9340786163",
    popular: "false",
  ),
  EventList(
    name: "ROBODINO COMPETITION ",
    date: "17, 18 October",
    description:
        "ROBODINO is a Technical Event which contains 3 Robotics Events :-  GRIPPER ROBOT, LINE FOLLOWER and ROBO RACE. These event is based upon minimum time taken and maximum points scored. ",
    fees: "300/- Team (Max Team size 4)",
    venue: "MCA PORCH and MICROPROCESSOR LAB",
    image: "images/robot.jpg",
    category: "technical",
    contact: "7717707034",
    popular: "false",
  ),
  EventList(
    name: "WATER ROCKET PROPULSION",
    date: "17 October",
    description:
        "It is a technical event in which a model rocket is made by the participants which uses water as its reaction mass.The model to be made must attain maximum range and least deviation.",
    fees: "300/- per Team(Team Size max 3)",
    venue: "OCT GROUND",
    image: "images/ROCKET.jpg",
    category: "technical",
    contact: "7024046925",
    popular: "false",
  ),
  EventList(
    name: "Innovation Idea presentation",
    date: "18 October",
    description:
        "Innovative idea presentation provides students a platform to show their talents by making  posters using colours , crayons etc on sheet . The theme for the poster is smart village.",
    fees: "100 Rs. Per Person",
    venue: "Civil seminar hall(OIST)",
    image: "images/innovation.jpg",
    category: "technical",
    contact: "8804105245",
    popular: "false",
  ),
  EventList(
    name: "100 rs venture",
    date: "17, 18 October",
    description:
        "A fun opportunity for young minds to revel in the success with their own mini venture",
    fees: "400/- per Team(Team Size Max 6)",
    venue: "Basketball Ground",
    image: "images/100 venture.jpg",
    category: "cultural",
    contact: "8789417544",
    popular: "false",
  ),
  EventList(
    name: "Impromptu competition ",
    date: "19 October",
    description: "Your words can help you to win the competition.",
    fees: "Rs 100 per person",
    venue: "OCM",
    image: "images/impromptu.jpg",
    category: "youngsters",
    contact: "8989929250",
    popular: "false",
  ),

  EventList(
    name: "APTI AND TV QUIZ",
    date: "17 october",
    description: "A test to test your knowledge.\nIt is a test designed to determine a person's ability in a particular skill or field of knowledge.",
    fees: "Rs 100 per person",
    venue: "OCT CS LAB",
    image: "images/APTI.jpg",
    category: "technical",
    contact: "9102325617",
    popular: "false",
  ),


  EventList(
    name: "Stunt Show",
    date: "17, 18 October",
    description: "Stunt Show is a youth-based popular show. It is an Indian version of the Road Rules(1995). Roadies is full of adventure, politics and twists .It is an event which is going to fill the participants with lots of excitement .This event will challenge your physical and mental ability. Its all about giving your best in tasks. The one who will never back down will become an Ultimate ROADIE….",
    fees: "Rs 100 per person",
    venue: "OCT Ground",
    image: "images/stunt.jpg",
    category: "cultural",
    contact: "7471159759",
    popular: "false",
  ),

  
  EventList(
    name: "Smart city model",
    date: "17 October",
    description: "Smart city model making competition",
    fees: "400/- per team(max4)",
    venue: "TB 1 room no 301",
    image: "images/model.jpg",
    category: "technical",
    contact: "7440603902",
    popular: "false",
  ),

  

  // EventList(
  //   name: "",
  //   date: "",
  //   description: "",
  //   fees: "",
  //   venue: "",
  //   image: "images/roadies.jpg",
  //   category: "",
  //   contact: "",
  //   popular: "false",
  // ),

  
];




class CategoryList {
  String image;
  String name;
  List<EventList> list;

  CategoryList({this.image, this.name, this.list});
}

final popularList = CategoryList(
  image: "images/roadies.jpg",
    name: "Popular Events",
    list: eventList.where((obj) => obj.popular == "true").toList());

final List<CategoryList> categorylist = [
  CategoryList(
      image: 'images/technical.jpg',
      name: "Technical Events",
      list: eventList.where((obj) => obj.category == "technical").toList()),
  CategoryList(
      image: 'images/cultural1.jpg',
      name: "Cultural Events",
      list: eventList.where((obj) => obj.category == "cultural").toList()),
  CategoryList(
      image: 'images/school.jpg',
      name: "School + College",
      list: eventList.where((obj) => obj.category == "youngsters").toList()),
  CategoryList(
      image: 'images/show stoppers.jpg',
      name: "Special Events",
      list: eventList.where((obj) => obj.category == "mis").toList()),
];

List<EventList> favorites = [];
void saveFavorites() async {
  int count = 0;
  for (var i in favorites) {
    count = 0;
    for (var j in favorites) {
      if (i.name == j.name) {
        ++count;
        if (count == 2) favorites.remove(j);
      }
    }
  }
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> saved = favorites.map<String>((obj) {
    print("l");
    return (obj.image +
        "@" +
        obj.name +
        "@" +
        obj.date +
        "@" +
        obj.description +
        "@" +
        obj.contact +
        "@" +
        obj.category +
        "@" +
        obj.fees +
        "@" +
        obj.popular +
        "@" +
        obj.venue);
  }).toList();
  prefs.setStringList("favorites", saved);
}

void getFavorites() async {
  print("here");
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> saved = prefs.getStringList("favorites");
  var split;
  if (saved != null)
    favorites = saved.map<EventList>((s) {
      print(s);
      split = s.split("@");
      return EventList(
          image: split[0],
          name: split[1],
          date: split[2],
          description: split[3],
          contact: split[4],
          category: split[5],
          fees: split[6],
          popular: split[7],
          venue: split[8]);
    }).toList();
}
