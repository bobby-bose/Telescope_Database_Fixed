import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'dart:convert';

class Event {
  final String summary;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final Color color;

  Event({
    required this.summary,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.color,
  });
}

class SchedulerPage extends StatefulWidget {
  const SchedulerPage({Key? key}) : super(key: key);

  @override
  _SchedulerPageState createState() => _SchedulerPageState();
}

class _SchedulerPageState extends State<SchedulerPage> {
  late CalendarController _calendarController;
  List<Event> _events = [];

  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
    _loadEvents();
  }

  void _loadEvents() {
    // Replace this with your JSON data
    String jsonData = '''

     {
  "VCALENDAR": [
    {
      "VERSION": "2.0",
      "PRODID": "-//Celestial events//seasky.org//",
      "X-WR-CALNAME": "Celestial events",
      "VEVENT": [
        {
          "SUMMARY": "Quadrantids Meteor Shower",
          "DTSTART;VALUE=DATE": "20150103",
          "DTEND;VALUE=DATE": "20150105",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "quadrantidsmeteorshower_2015010320150105@seasky.org",
          "DESCRIPTION": "The Quadrantids is an above average shower\\n, with up to 40 meteors per hour at its peak. It is thought to be produced by dust grains left behind by an extinct comet known as 2003 EH1\\n, which was discovered in 2003. The shower runs annually from January 1-5. It peaks this year on the night of the 3rd and  morning of the 4th.  Unfortunately the nearly full moon will block out all but the brightest meteors this year. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Bootes\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20150105",
          "DTEND;VALUE=DATE": "20150106",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "fullmoon_2015010520150106@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 04:54 UTC. This full moon was known by early Native American tribes as the Full Wolf Moon because this was the time of year when hungry wolf packs howled outside their camps. This moon has also been know as the Old Moon and the Moon After Yule."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20150120",
          "DTEND;VALUE=DATE": "20150121",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "newmoon_2015012020150121@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 13:14 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20150203",
          "DTEND;VALUE=DATE": "20150204",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "fullmoon_2015020320150204@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 23:09 UTC. This full moon was known by early Native American tribes as the Full Snow Moon because the heaviest snows usually fell during this time of the year. Since hunting is difficult\\n, this moon has also been known by some tribes as the Full Hunger Moon\\n, since the harsh weather made hunting difficult."
        },
        {
          "SUMMARY": "Jupiter at Opposition",
          "DTSTART;VALUE=DATE": "20150206",
          "DTEND;VALUE=DATE": "20150207",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "jupiteratopposition_2015020620150207@seasky.org",
          "DESCRIPTION": "The giant planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Jupiter and its moons. A medium-sized telescope should be able to show you some of the details in Jupiter's cloud bands. A good pair of binoculars should allow you to see Jupiter's four largest moons\\n, appearing as bright dots on either side of the planet."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20150218",
          "DTEND;VALUE=DATE": "20150219",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "newmoon_2015021820150219@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 23:47 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Conjunction of Venus and Mars",
          "DTSTART;VALUE=DATE": "20150222",
          "DTEND;VALUE=DATE": "20150223",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "conjunctionofvenusandmars_2015022220150223@seasky.org",
          "DESCRIPTION": "A conjunction of Venus and Mars will be visible on February 22. The two bright planets will be visible within only half a degree of each other in the evening sky. Look for this impressive sight in the west just after sunset."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20150224",
          "DTEND;VALUE=DATE": "20150225",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "mercuryatgreatestwesternelongation_2015022420150225@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 26.7 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20150305",
          "DTEND;VALUE=DATE": "20150306",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "fullmoon_2015030520150306@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 18:06 UTC. This full moon was known by early Native American tribes as the Full Worm Moon because this was the time of year when the ground would begin to soften and the earthworms would reappear. This moon has also been known as the Full Crow Moon\\n, the Full Crust Moon\\n, the Full Sap Moon\\n, and the Lenten Moon.\\nn"
        },
        {
          "SUMMARY": "Dawn at Ceres",
          "DTSTART;VALUE=DATE": "20150306",
          "DTEND;VALUE=DATE": "20150307",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "dawnatceres_2015030620150307@seasky.org",
          "DESCRIPTION": "NASA’s Dawn spacecraft will encounter the dwarf planet known as Ceres on March 6. Ceres is the largest object in the asteroid belt between Mars and Jupiter. Because of its size and shape\\n, it has officially been classified as a dwarf planet\\n, which puts it in the same category as Pluto. Ceres is 590 miles (950 kilometers) in diameter and is large enough to have a round shape. Dawn will spend several months studying Ceres and will send back the first close-up images of a dwarf planet in our Solar System."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20150320",
          "DTEND;VALUE=DATE": "20150321",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "newmoon_2015032020150321@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 09:36 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Total Solar Eclipse",
          "DTSTART;VALUE=DATE": "20150320",
          "DTEND;VALUE=DATE": "20150321",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "totalsolareclipse_2015032020150321@seasky.org",
          "DESCRIPTION": "A total solar eclipse occurs when the moon completely blocks the Sun\\n, revealing the Sun's beautiful outer atmosphere known as the corona. The path of totality for this eclipse will be limited to the North Atlantic and Arctic Oceans between Greenland and northern Russia.\\nn        () ()"
        },
        {
          "SUMMARY": "March Equinox",
          "DTSTART;VALUE=DATE": "20150320",
          "DTEND;VALUE=DATE": "20150321",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "marchequinox_2015032020150321@seasky.org",
          "DESCRIPTION": "The March equinox occurs at 22:45 UTC. The Sun will shine directly on the equator and there will be nearly equal amounts of day and night throughout the world. This is also the first day of spring (vernal equinox) in the Northern Hemisphere and the first day of fall (autumnal equinox) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20150404",
          "DTEND;VALUE=DATE": "20150405",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "fullmoon_2015040420150405@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 12:05 UTC. This full moon was known by early Native American tribes as the Full Pink Moon because it marked the appearance of the moss pink\\n, or wild ground phlox\\n, which is one of the first spring flowers. This moon has also been known as the Sprouting Grass Moon\\n, the Growing Moon\\n, and the Egg Moon. Many coastal tribes called it the Full Fish Moon because this was the time that the shad swam upstream to spawn."
        },
        {
          "SUMMARY": "Total Lunar Eclipse",
          "DTSTART;VALUE=DATE": "20150404",
          "DTEND;VALUE=DATE": "20150405",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "totallunareclipse_2015040420150405@seasky.org",
          "DESCRIPTION": "A total lunar eclipse occurs when the Moon passes completely through the Earth's dark shadow\\n, or umbra. During this type of eclipse\\n, the Moon will gradually get darker and then take on a rusty or blood red color. The eclipse will be visible throughout most of North America\\n, South America\\n, eastern Asia\\n, and Australia. ()"
        },
        {
          "SUMMARY": "International Dark Sky Week",
          "DTSTART;VALUE=DATE": "20150413",
          "DTEND;VALUE=DATE": "20150419",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "internationaldarkskyweek_2015041320150419@seasky.org",
          "DESCRIPTION": "International Dark Sky Week is held during the week of the new moon in April. It is a week during which people worldwide turn out their outdoor lights in order to observe the wonders of the night sky without light pollution. It has been endorsed by the \\n, the \\n, the . So go ahead and turn out your outdoor lights this week to appreciate the beauty of the night sky!"
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20150418",
          "DTEND;VALUE=DATE": "20150419",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "newmoon_2015041820150419@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 18:56 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Lyrids Meteor Shower",
          "DTSTART;VALUE=DATE": "20150422",
          "DTEND;VALUE=DATE": "20150424",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "lyridsmeteorshower_2015042220150424@seasky.org",
          "DESCRIPTION": "The Lyrids is an average shower\\n, usually producing about 20 meteors per hour at its peak. It is produced by dust particles left behind by comet C/1861 G1 Thatcher\\n, which was discovered in 1861. The shower runs annually from April 16-25. It peaks this year on the night of the night of the 22nd and morning of the 23rd. These meteors can sometimes produce bright dust trails that last for several seconds.  The first quarter moon will set shortly after midnight\\n, leaving fairly dark skies for the what could be a good show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Lyra\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "International Astronomy Day",
          "DTSTART;VALUE=DATE": "20150425",
          "DTEND;VALUE=DATE": "20150426",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "internationalastronomyday_2015042520150426@seasky.org",
          "DESCRIPTION": "Astronomy Day is an annual event intended to provide a means of interaction between the general public and various astronomy enthusiasts\\n, groups and professionals.  The theme of Astronomy Day is Bringing Astronomy to the People \\nand on this day astronomy and stargazing clubs and other organizations around the world will plan special events. You can find out about special local events by contacting your local astronomy club or planetarium. You can also find more about Astronomy Day by checking the Web site for the ."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20150504",
          "DTEND;VALUE=DATE": "20150505",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "fullmoon_2015050420150505@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 03:42 UTC. This full moon was known by early Native American tribes as the Full Flower Moon because this was the time of year when spring flowers appeared in abundance. This moon has also been known as the Full Corn Planting Moon and the Milk Moon."
        },
        {
          "SUMMARY": "Eta Aquarids Meteor Shower",
          "DTSTART;VALUE=DATE": "20150505",
          "DTEND;VALUE=DATE": "20150507",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "etaaquaridsmeteorshower_2015050520150507@seasky.org",
          "DESCRIPTION": "The Eta Aquarids is an above average shower\\n, capable of producing up to 60 meteors per hour at its peak. Most of the activity is seen in the Southern Hemisphere. In the Northern Hemisphere\\n, the rate can reach about 30 meteors per hour. It is produced by dust particles left behind by comet Halley\\n, which has known and observed since ancient times. The shower runs annually from April 19 to May 28. It peaks this year on the night of May 5 and the morning of the May 6. The nearly full moon will be a big problem this year blocking out all but the brightest meteors. If you are patient\\n, you should still be able to catch a few good ones. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Aquarius\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20150507",
          "DTEND;VALUE=DATE": "20150508",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "mercuryatgreatesteasternelongation_2015050720150508@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 21.2 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20150518",
          "DTEND;VALUE=DATE": "20150519",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "newmoon_2015051820150519@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 04:13 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Saturn at Opposition",
          "DTSTART;VALUE=DATE": "20150523",
          "DTEND;VALUE=DATE": "20150524",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "saturnatopposition_2015052320150524@seasky.org",
          "DESCRIPTION": "The ringed planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Saturn and its moons. A medium-sized or larger telescope will allow you to see Saturn's rings and a few of its brightest moons."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20150602",
          "DTEND;VALUE=DATE": "20150603",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "fullmoon_2015060220150603@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 16:19 UTC. This full moon was known by early Native American tribes as the Full Strawberry Moon because it signaled the time of year to gather ripening fruit. It also coincides with the peak of the strawberry harvesting season. This moon has also been known as the Full Rose Moon and the Full Honey Moon."
        },
        {
          "SUMMARY": "Venus at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20150606",
          "DTEND;VALUE=DATE": "20150607",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "venusatgreatesteasternelongation_2015060620150607@seasky.org",
          "DESCRIPTION": "The planet Venus reaches greatest eastern elongation of 45.4 degrees from the Sun. This is the best time to view Venus since it will be at its highest point above the horizon in the evening sky. Look for the bright planet in the western sky after sunset."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20150616",
          "DTEND;VALUE=DATE": "20150617",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "newmoon_2015061620150617@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 14:05 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "June Solstice",
          "DTSTART;VALUE=DATE": "20150621",
          "DTEND;VALUE=DATE": "20150622",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "junesolstice_2015062120150622@seasky.org",
          "DESCRIPTION": "The June solstice occurs at 16:38 UTC. The North Pole of the earth will be tilted toward the Sun\\n, which will have reached its northernmost position in the sky and will be directly over the Tropic of Cancer at 23.44 degrees north latitude. This is the first day of summer (summer solstice) in the Northern Hemisphere and the first day of winter (winter solstice) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Mercury at Greatest  Western Elongation",
          "DTSTART;VALUE=DATE": "20150624",
          "DTEND;VALUE=DATE": "20150625",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "mercuryatgreatestwesternelongation_2015062420150625@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 22.5 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "Conjunction of Venus and Jupiter",
          "DTSTART;VALUE=DATE": "20150701",
          "DTEND;VALUE=DATE": "20150702",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "conjunctionofvenusandjupiter_2015070120150702@seasky.org",
          "DESCRIPTION": "A spectacular conjunction of Venus and Jupiter will be visible in the evening sky. The two bright planets will be extremely close\\n, appearing only 0.3 degrees apart. Look for this impressive pairing in the western sky just after sunset."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20150702",
          "DTEND;VALUE=DATE": "20150703",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "fullmoon_2015070220150703@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 02:19 UTC. This full moon was known by early Native American tribes as the Full Buck Moon because the male buck deer would begin to grow their new antlers at this time of year. This moon has also been known as the Full Thunder Moon and the Full Hay Moon."
        },
        {
          "SUMMARY": "New Horizons at Pluto",
          "DTSTART;VALUE=DATE": "20150714",
          "DTEND;VALUE=DATE": "20150715",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "newhorizonsatpluto_2015071420150715@seasky.org",
          "DESCRIPTION": "NASA’s New Horizons spacecraft is scheduled to arrive at Pluto after a nine and a half year journey. Launched on January 19\\n, 2006\\n, this will be the first spacecraft to visit Pluto. New Horizons will give us our first close-up views of the dwarf planet and its moons. After passing Pluto\\n, the spacecraft will continue on to the Kuiper belt to examine some of the other icy bodies at the edge of the Solar System."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20150716",
          "DTEND;VALUE=DATE": "20150717",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "newmoon_2015071620150717@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 01:24 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Delta Aquarids Meteor Shower",
          "DTSTART;VALUE=DATE": "20150728",
          "DTEND;VALUE=DATE": "20150730",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "deltaaquaridsmeteorshower_2015072820150730@seasky.org",
          "DESCRIPTION": "The Delta Aquarids is an average shower that can produce up to 20 meteors per hour at its peak. It is produced by debris left behind by comets Marsden and Kracht. The shower runs annually from July 12 to August 23. It peaks this year on the night of July 28 and morning of July 29. The nearly full moon will block out all but the brightest meteors this year. But if you are patient\\n, you should still be able to catch a quite few good ones. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Aquarius\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20150731",
          "DTEND;VALUE=DATE": "20150801",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "fullmoon_2015073120150801@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 10:43 UTC."
        },
        {
          "SUMMARY": "Perseids Meteor Shower",
          "DTSTART;VALUE=DATE": "20150812",
          "DTEND;VALUE=DATE": "20150814",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "perseidsmeteorshower_2015081220150814@seasky.org",
          "DESCRIPTION": "The Perseids is one of the best meteor showers to observe\\n, producing up to 60 meteors per hour at its peak. It is produced by comet Swift-Tuttle\\n, which was discovered in 1862. The Perseids are famous for producing a large number of bright meteors. The shower runs annually from July 17 to August 24. It peaks this year on the night of August 12 and the morning of August 13. The thin crescent moon will be no match for the bright Perseids this year so be prepared for a great show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Perseus\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20150814",
          "DTEND;VALUE=DATE": "20150815",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "newmoon_2015081420150815@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 14:53 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Full Moon\\n, Supermoon",
          "DTSTART;VALUE=DATE": "20150829",
          "DTEND;VALUE=DATE": "20150830",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "fullmoon\\n,supermoon_2015082920150830@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 18:35 UTC. This full moon was known by early Native American tribes as the Full Sturgeon Moon because the large sturgeon fish of the Great Lakes and other major lakes were more easily caught at this time of year. This moon has also been known as the Green Corn Moon and the Grain Moon. This is also the first of three supermoons for 2015. The Moon will be at its closest approach to the Earth and may look slightly larger and brighter than usual."
        },
        {
          "SUMMARY": "Neptune at Opposition",
          "DTSTART;VALUE=DATE": "20150901",
          "DTEND;VALUE=DATE": "20150902",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "neptuneatopposition_2015090120150902@seasky.org",
          "DESCRIPTION": "The blue giant planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Neptune. Due to its extreme distance from Earth\\n, it will only appear as a tiny blue dot in all but the most powerful telescopes."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20150904",
          "DTEND;VALUE=DATE": "20150905",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "mercuryatgreatesteasternelongation_2015090420150905@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 27 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20150913",
          "DTEND;VALUE=DATE": "20150914",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "newmoon_2015091320150914@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 06:41 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Partial Solar Eclipse",
          "DTSTART;VALUE=DATE": "20150913",
          "DTEND;VALUE=DATE": "20150914",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "partialsolareclipse_2015091320150914@seasky.org",
          "DESCRIPTION": "A partial solar eclipse occurs when the Moon covers only a part of the Sun\\n, sometimes resembling a bite taken out of a cookie. A partial solar eclipse can only be safely observed with a special solar filter or by looking at the Sun's reflection. The partial eclipse will only be visible in southern Africa\\n, Madagascar\\n, and Antarctica. ()"
        },
        {
          "SUMMARY": "September Equinox",
          "DTSTART;VALUE=DATE": "20150923",
          "DTEND;VALUE=DATE": "20150924",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "septemberequinox_2015092320150924@seasky.org",
          "DESCRIPTION": "The September equinox occurs at 08:21 UTC. The Sun will shine directly on the equator and there will be nearly equal amounts of day and night throughout the world. This is also the first day of fall (autumnal equinox) in the Northern Hemisphere and the first day of spring (vernal equinox) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Full Moon\\n, Supermoon",
          "DTSTART;VALUE=DATE": "20150928",
          "DTEND;VALUE=DATE": "20150929",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "fullmoon\\n,supermoon_2015092820150929@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 02:50 UTC. This full moon was known by early Native American tribes as the Full Corn Moon because the corn is harvested around this time of year. This moon is also known as the Harvest Moon. The Harvest Moon is the full moon that occurs closest to the September equinox each year. This is also the second of three supermoons for 2015. The Moon will be at its closest approach to the Earth and may look slightly larger and brighter than usual. This will be the closest full moon of the year."
        },
        {
          "SUMMARY": "Total Lunar Eclipse",
          "DTSTART;VALUE=DATE": "20150928",
          "DTEND;VALUE=DATE": "20150929",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "totallunareclipse_2015092820150929@seasky.org",
          "DESCRIPTION": "A total lunar eclipse occurs when the Moon passes completely through the Earth's dark shadow\\n, or umbra. During this type of eclipse\\n, the Moon will gradually get darker and then take on a rusty or blood red color. The eclipse will be visible throughout most of North and South America\\n, Europe\\n, Africa\\n, and western Asia. ()"
        },
        {
          "SUMMARY": "Comet C/2013 US10 Catalina",
          "DTSTART;VALUE=DATE": "20151001",
          "DTEND;VALUE=DATE": "20151002",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "cometc/2013us10catalina_2015100120151002@seasky.org",
          "DESCRIPTION": "Newly discovered comet C/2013 US10 Catalina may reach naked eye visibility on October 1. The comet will continue to brighten and could reach magnitude 5 by November 6."
        },
        {
          "SUMMARY": "Draconids Meteor Shower",
          "DTSTART;VALUE=DATE": "20151008",
          "DTEND;VALUE=DATE": "20151009",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "draconidsmeteorshower_2015100820151009@seasky.org",
          "DESCRIPTION": "The Draconids is a minor meteor shower producing only about 10 meteors per hour. It is produced by dust grains left behind by comet 21P Giacobini-Zinner\\n, which was first discovered in 1900. The Draconids is an unusual shower in that the best viewing is in the early evening instead of early morning like most other showers. The shower runs annually from October 6-10 and peaks this year on the the night of the 8th. The second quarter moon will block out all but the brightest meteors this year. If you are patient\\n, you may be able to spot a few good ones. Best viewing will be in the early evening from a dark location far away from city lights. Meteors will radiate from the constellation Draco\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Uranus at Opposition",
          "DTSTART;VALUE=DATE": "20151011",
          "DTEND;VALUE=DATE": "20151012",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "uranusatopposition_2015101120151012@seasky.org",
          "DESCRIPTION": "The blue-green planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view Uranus. Due to its distance\\n, it will only appear as a tiny blue-green dot in all but the most powerful telescopes."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20151016",
          "DTEND;VALUE=DATE": "20151017",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "mercuryatgreatestwesternelongation_2015101620151017@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 18.1 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20151013",
          "DTEND;VALUE=DATE": "20151014",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "newmoon_2015101320151014@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 00:06 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Orionids Meteor Shower",
          "DTSTART;VALUE=DATE": "20151021",
          "DTEND;VALUE=DATE": "20151023",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "orionidsmeteorshower_2015102120151023@seasky.org",
          "DESCRIPTION": "The Orionids is an average shower producing up to 20 meteors per hour at its peak. It is produced by dust grains left behind by comet Halley\\n, which has been known and observed since ancient times. The shower runs annually from October 2 to November 7. It peaks this year on the night of October 21 and the morning of October 22. The first quarter moon will set shortly after midnight leaving fairly dark skies for what should be a good show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Orion\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Venus at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20151026",
          "DTEND;VALUE=DATE": "20151027",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "venusatgreatestwesternelongation_2015102620151027@seasky.org",
          "DESCRIPTION": "The planet Venus reaches greatest eastern elongation of 46.4 degrees from the Sun. This is the best time to view Venus since it will be at its highest point above the horizon in the morning sky. Look for the bright planet in the eastern sky before sunrise."
        },
        {
          "SUMMARY": "Conjunction of Venus and Jupiter",
          "DTSTART;VALUE=DATE": "20151026",
          "DTEND;VALUE=DATE": "20151027",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "conjunctionofvenusandjupiter_2015102620151027@seasky.org",
          "DESCRIPTION": "A conjunction of Venus and Jupiter will take place on October 26. The two bright planets will be visible within 1 degree of each other in the early morning sky. Look to the east just before sunrise for this impressive planetary pair."
        },
        {
          "SUMMARY": "Full Moon\\n, Supermoon",
          "DTSTART;VALUE=DATE": "20151027",
          "DTEND;VALUE=DATE": "20151028",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "fullmoon\\n,supermoon_2015102720151028@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 12:05 UTC. This full moon was known by early Native American tribes as the Full Hunters Moon because at this time of year the leaves are falling and the game is fat and ready to hunt. This moon has also been known as the Travel Moon and the Blood Moon. This is also the last of three supermoons for 2015. The Moon will be at its closest approach to the Earth and may look slightly larger and brighter than usual."
        },
        {
          "SUMMARY": "Conjunction of Venus\\n, Mars\\n, and Jupiter",
          "DTSTART;VALUE=DATE": "20151028",
          "DTEND;VALUE=DATE": "20151029",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "conjunctionofvenus\\n,mars\\n,andjupiter_2015102820151029@seasky.org",
          "DESCRIPTION": "A rare\\n, 3-planet conjunction will be visible on the morning of October 28. The planets Venus\\n, Mars\\n, and Jupiter will all form a tight 1-degree triangle in the early morning sky. Look to the east just before sunrise for this spectacular event."
        },
        {
          "SUMMARY": "Taurids Meteor Shower",
          "DTSTART;VALUE=DATE": "20151105",
          "DTEND;VALUE=DATE": "20151107",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "tauridsmeteorshower_2015110520151107@seasky.org",
          "DESCRIPTION": "The Taurids is a long-running minor meteor shower producing only about 5-10 meteors per hour. It is unusual in that it consists of two separate streams. The first is produced by dust grains left behind by Asteroid 2004 TG10. The second stream is produced by debris left behind by Comet 2P Encke.  The shower runs annually from September 7 to December 10. It peaks this year on the the night of November 5. The second quarter moon will block out all but the brightest meteors this year. If you are patient\\n, you may still be able to catch a few good ones. Best viewing will be just after midnight from a dark location far away from city lights. Meteors will radiate from the constellation Taurus\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20151111",
          "DTEND;VALUE=DATE": "20151112",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "newmoon_2015111120151112@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 17:47 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Leonids Meteor Shower",
          "DTSTART;VALUE=DATE": "20151117",
          "DTEND;VALUE=DATE": "20151119",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "leonidsmeteorshower_2015111720151119@seasky.org",
          "DESCRIPTION": "The Leonids is an average shower\\n, producing an up to 15 meteors per hour at its peak. This shower is unique in that it has a cyclonic peak about every 33 years where hundreds of meteors per hour can be seen. That last of these occurred in 2001. The Leonids is produced by dust grains left behind by comet Tempel-Tuttle\\n, which was discovered in 1865. The shower runs annually from November 6-30. It peaks this year on the night of the 17th and morning of the 18th. The first quarter moon will set shortly after midnight leaving fairly dark skies for what could be a good show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Leo\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20151125",
          "DTEND;VALUE=DATE": "20151126",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "fullmoon_2015112520151126@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 22:44 UTC. This full moon was known by early Native American tribes as the Full Beaver Moon because this was the time of year to set the beaver traps before the swamps and rivers froze. It has also been known as the Frosty Moon and the Hunter's Moon."
        },
        {
          "SUMMARY": "Conjunction of the Moon and Venus",
          "DTSTART;VALUE=DATE": "20151207",
          "DTEND;VALUE=DATE": "20151208",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "conjunctionofthemoonandvenus_2015120720151208@seasky.org",
          "DESCRIPTION": "A conjunction of the Moon and Venus will take place on the morning of December 7. The crescent moon will come with 2 degrees of bright planet Venus in the early morning sky. Look to the east just before sunrise."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20151211",
          "DTEND;VALUE=DATE": "20151212",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "newmoon_2015121120151212@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 10:29 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Geminids Meteor Shower",
          "DTSTART;VALUE=DATE": "20151213",
          "DTEND;VALUE=DATE": "20151215",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "geminidsmeteorshower_2015121320151215@seasky.org",
          "DESCRIPTION": "The Geminids is the  king of the meteor showers. It is considered by many to be the best shower in the heavens\\n, producing up to 120 multicolored meteors per hour at its peak. It is produced by debris left behind by an asteroid known as 3200 Phaethon\\n, which was discovered in 1982. The shower runs annually from December 7-17. It peaks this year on the night of the 13th and morning of the 14th. The crescent moon will set early in the evening leaving dark skies for what should be an excellent show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Gemini\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "December Solstice",
          "DTSTART;VALUE=DATE": "20151222",
          "DTEND;VALUE=DATE": "20151223",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "decembersolstice_2015122220151223@seasky.org",
          "DESCRIPTION": "The December solstice occurs at 04:48 UTC. The South Pole of the earth will be tilted toward the Sun\\n, which will have reached its southernmost position in the sky and will be directly over the Tropic of Capricorn at 23.44 degrees south latitude. This is the first day of winter (winter solstice) in the Northern Hemisphere and the first day of summer (summer solstice) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Ursids Meteor Shower",
          "DTSTART;VALUE=DATE": "20151221",
          "DTEND;VALUE=DATE": "20151223",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "ursidsmeteorshower_2015122120151223@seasky.org",
          "DESCRIPTION": "The Ursids is a minor meteor shower producing about 5-10 meteors per hour. It is produced by dust grains left behind by comet Tuttle\\n, which was first discovered in 1790. The shower runs annually from December 17-25. It peaks this year on the the night of the 21st and morning of the 22nd. This year the waxing gibbous moon will be bright enough to hide most of the fainter meteors. If you are patient\\n, you might still be able to catch some of the brighter ones. Best viewing will be just after midnight from a dark location far away from city lights. Meteors will radiate from the constellation Ursa Minor\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20151225",
          "DTEND;VALUE=DATE": "20151226",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "fullmoon_2015122520151226@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 11:11 UTC. This full moon was known by early Native American tribes as the Full Cold Moon because this is the time of year when the cold winter air settles in and the nights become long and dark. This moon has also been known as the Moon Before Yule and the Full Long Nights Moon."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20151229",
          "DTEND;VALUE=DATE": "20151230",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194717Z",
          "UID": "mercuryatgreatesteasternelongation_2015122920151230@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 19.7 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "Quadrantids Meteor Shower",
          "DTSTART;VALUE=DATE": "20160103",
          "DTEND;VALUE=DATE": "20160105",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "quadrantidsmeteorshower_2016010320160105@seasky.org",
          "DESCRIPTION": "The Quadrantids is an above average shower\\n, with up to 40 meteors per hour at its peak. It is thought to be produced by dust grains left behind by an extinct comet known as 2003 EH1\\n, which was discovered in 2003. The shower runs annually from January 1-5. It peaks this year on the night of the 3rd and  morning of the 4th.  The second quarter moon will block out all but the brightest meteors this year\\n, but it could still be a good show if you are patient. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Bootes\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20160110",
          "DTEND;VALUE=DATE": "20160111",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "newmoon_2016011020160111@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 01:30 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20160124",
          "DTEND;VALUE=DATE": "20160125",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "fullmoon_2016012420160125@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 01:46 UTC. This full moon was known by early Native American tribes as the Full Wolf Moon because this was the time of year when hungry wolf packs howled outside their camps. This moon has also been know as the Old Moon and the Moon After Yule."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20160207",
          "DTEND;VALUE=DATE": "20160208",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "mercuryatgreatestwesternelongation_2016020720160208@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 25.6 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20160208",
          "DTEND;VALUE=DATE": "20160209",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "newmoon_2016020820160209@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 14:39 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20160222",
          "DTEND;VALUE=DATE": "20160223",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "fullmoon_2016022220160223@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 18:20 UTC. This full moon was known by early Native American tribes as the Full Snow Moon because the heaviest snows usually fell during this time of the year. Since hunting is difficult\\n, this moon has also been known by some tribes as the Full Hunger Moon\\n, since the harsh weather made hunting difficult."
        },
        {
          "SUMMARY": "Jupiter at Opposition",
          "DTSTART;VALUE=DATE": "20160308",
          "DTEND;VALUE=DATE": "20160309",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "jupiteratopposition_2016030820160309@seasky.org",
          "DESCRIPTION": "The giant planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Jupiter and its moons. A medium-sized telescope should be able to show you some of the details in Jupiter's cloud bands. A good pair of binoculars should allow you to see Jupiter's four largest moons\\n, appearing as bright dots on either side of the planet."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20160309",
          "DTEND;VALUE=DATE": "20160310",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "newmoon_2016030920160310@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 01:54 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Total Solar Eclipse",
          "DTSTART;VALUE=DATE": "20160309",
          "DTEND;VALUE=DATE": "20160310",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "totalsolareclipse_2016030920160310@seasky.org",
          "DESCRIPTION": "A total solar eclipse occurs when the moon completely blocks the Sun\\n, revealing the Sun's beautiful outer atmosphere known as the corona. The path of totality will only be visible in parts of central Indonesia and the Pacific Ocean. A partial eclipse will be visible in most parts of northern Australia and southeast Asia. () ()"
        },
        {
          "SUMMARY": "March Equinox",
          "DTSTART;VALUE=DATE": "20160320",
          "DTEND;VALUE=DATE": "20160321",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "marchequinox_2016032020160321@seasky.org",
          "DESCRIPTION": "The March equinox occurs at 04:30 UTC. The Sun will shine directly on the equator and there will be nearly equal amounts of day and night throughout the world. This is also the first day of spring (vernal equinox) in the Northern Hemisphere and the first day of fall (autumnal equinox) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20160323",
          "DTEND;VALUE=DATE": "20160324",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "fullmoon_2016032320160324@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 12:02 UTC. This full moon was known by early Native American tribes as the Full Worm Moon because this was the time of year when the ground would begin to soften and the earthworms would reappear. This moon has also been known as the Full Crow Moon\\n, the Full Crust Moon\\n, the Full Sap Moon\\n, and the Lenten Moon.\\nn"
        },
        {
          "SUMMARY": "Penumbral Lunar Eclipse",
          "DTSTART;VALUE=DATE": "20160323",
          "DTEND;VALUE=DATE": "20160324",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "penumbrallunareclipse_2016032320160324@seasky.org",
          "DESCRIPTION": "A penumbral lunar eclipse occurs when the Moon passes through the Earth's partial shadow\\n, or penumbra. During this type of eclipse the Moon will darken slightly but not completely. The eclipse will be visible throughout most of extreme eastern Asia\\n, eastern Australia\\n, the Pacific Ocean\\n, and the west coast of North America including Alaska. ()"
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20160407",
          "DTEND;VALUE=DATE": "20160408",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "newmoon_2016040720160408@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 11:24 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20160418",
          "DTEND;VALUE=DATE": "20160419",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "mercuryatgreatesteasternelongation_2016041820160419@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 19.9 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20160422",
          "DTEND;VALUE=DATE": "20160423",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "fullmoon_2016042220160423@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 05:24 UTC. This full moon was known by early Native American tribes as the Full Pink Moon because it marked the appearance of the moss pink\\n, or wild ground phlox\\n, which is one of the first spring flowers. This moon has also been known as the Sprouting Grass Moon\\n, the Growing Moon\\n, and the Egg Moon. Many coastal tribes called it the Full Fish Moon because this was the time that the shad swam upstream to spawn."
        },
        {
          "SUMMARY": "Lyrids Meteor Shower",
          "DTSTART;VALUE=DATE": "20160422",
          "DTEND;VALUE=DATE": "20160424",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "lyridsmeteorshower_2016042220160424@seasky.org",
          "DESCRIPTION": "The Lyrids is an average shower\\n, usually producing about 20 meteors per hour at its peak. It is produced by dust particles left behind by comet C/1861 G1 Thatcher\\n, which was discovered in 1861. The shower runs annually from April 16-25. It peaks this year on the night of the night of the 22nd and morning of the 23rd. These meteors can sometimes produce bright dust trails that last for several seconds.  Unfortunately this year the glare from the full moon will block out all but the brightest meteors. If you are patient\\n, you should still be able to catch a few good ones. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Lyra\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20160506",
          "DTEND;VALUE=DATE": "20160507",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "newmoon_2016050620160507@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 19:29 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Eta Aquarids Meteor Shower",
          "DTSTART;VALUE=DATE": "20160506",
          "DTEND;VALUE=DATE": "20160508",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "etaaquaridsmeteorshower_2016050620160508@seasky.org",
          "DESCRIPTION": "The Eta Aquarids is an above average shower\\n, capable of producing up to 60 meteors per hour at its peak. Most of the activity is seen in the Southern Hemisphere. In the Northern Hemisphere\\n, the rate can reach about 30 meteors per hour. It is produced by dust particles left behind by comet Halley\\n, which has known and observed since ancient times. The shower runs annually from April 19 to May 28. It peaks this year on the night of May 6 and the morning of the May 7. The new moon will ensure dark skies this year  for what could be an excellent show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Aquarius\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Rare Transit of Mercury Across the Sun",
          "DTSTART;VALUE=DATE": "20160509",
          "DTEND;VALUE=DATE": "20160510",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "raretransitofmercuryacrossthesun_2016050920160510@seasky.org",
          "DESCRIPTION": "The planet Mercury will move directly between the Earth and the Sun. Viewers with telescopes and approved solar filters will be able to observe the dark disk of the planet Mercury moving across the face of the Sun. This is an extremely rare event that occurs only once every few years. There will be one other transit of Mercury in 2019 and then the next one will not take place until 2039. This transit will be visible throughout North America\\n, Mexico\\n, Central America\\n, South America\\n, and parts of Europe\\n, Asia\\n, and Africa. The best place to view this event in its entirety will be the eastern United States and eastern South America. ()"
        },
        {
          "SUMMARY": "Full Moon\\n, Blue Moon",
          "DTSTART;VALUE=DATE": "20160521",
          "DTEND;VALUE=DATE": "20160522",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "fullmoon\\n,bluemoon_2016052120160522@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 21:15 UTC. This full moon was known by early Native American tribes as the Full Flower Moon because this was the time of year when spring flowers appeared in abundance. This moon has also been known as the Full Corn Planting Moon and the Milk Moon. Since this is the third of four full moons in this season\\n, it is known as a blue moon. This rare calendar event only happens once every few years\\n, giving rise to the term\\n, “once in a blue moon.” There are normally only three full moons in each season of the year. But since full moons occur every 29.53 days\\n, occasionally a season will contain 4 full moons. The extra full moon of the season is known as a blue moon. Blue moons occur on average once every 2.7 years."
        },
        {
          "SUMMARY": "Mars at Opposition",
          "DTSTART;VALUE=DATE": "20160522",
          "DTEND;VALUE=DATE": "20160523",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "marsatopposition_2016052220160523@seasky.org",
          "DESCRIPTION": "The red planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Mars. A medium-sized telescope will allow you to see some of the dark details on the planet's orange surface."
        },
        {
          "SUMMARY": "Saturn at Opposition",
          "DTSTART;VALUE=DATE": "20160603",
          "DTEND;VALUE=DATE": "20160604",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "saturnatopposition_2016060320160604@seasky.org",
          "DESCRIPTION": "The ringed planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Saturn and its moons. A medium-sized or larger telescope will allow you to see Saturn's rings and a few of its brightest moons."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20160605",
          "DTEND;VALUE=DATE": "20160606",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "newmoon_2016060520160606@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 02:59 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20160605",
          "DTEND;VALUE=DATE": "20160606",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "mercuryatgreatestwesternelongation_2016060520160606@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 24.2 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20160620",
          "DTEND;VALUE=DATE": "20160621",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "fullmoon_2016062020160621@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 11:02 UTC. This full moon was known by early Native American tribes as the Full Strawberry Moon because it signaled the time of year to gather ripening fruit. It also coincides with the peak of the strawberry harvesting season. This moon has also been known as the Full Rose Moon and the Full Honey Moon."
        },
        {
          "SUMMARY": "June Solstice",
          "DTSTART;VALUE=DATE": "20160620",
          "DTEND;VALUE=DATE": "20160621",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "junesolstice_2016062020160621@seasky.org",
          "DESCRIPTION": "The June solstice occurs at 22:34 UTC. The North Pole of the earth will be tilted toward the Sun\\n, which will have reached its northernmost position in the sky and will be directly over the Tropic of Cancer at 23.44 degrees north latitude. This is the first day of summer (summer solstice) in the Northern Hemisphere and the first day of winter (winter solstice) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20160704",
          "DTEND;VALUE=DATE": "20160705",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "newmoon_2016070420160705@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 11:01 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Juno at Jupiter",
          "DTSTART;VALUE=DATE": "20160704",
          "DTEND;VALUE=DATE": "20160705",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "junoatjupiter_2016070420160705@seasky.org",
          "DESCRIPTION": "NASA’s Juno spacecraft is scheduled to arrive at Jupiter after a five year journey. Launched on August 5\\n, 2011\\n, Juno will be inserted into a polar orbit around the giant planet on or around July 4\\n, 2016. From this orbit the spacecraft will study Jupiter’s atmosphere and magnetic field. Juno will remain in orbit until October 2017\\n, when the spacecraft will be de-orbited  to crash into Jupiter."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20160719",
          "DTEND;VALUE=DATE": "20160720",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "fullmoon_2016071920160720@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 22:57 UTC. This full moon was known by early Native American tribes as the Full Buck Moon because the male buck deer would begin to grow their new antlers at this time of year. This moon has also been known as the Full Thunder Moon and the Full Hay Moon."
        },
        {
          "SUMMARY": "Delta Aquarids Meteor Shower",
          "DTSTART;VALUE=DATE": "20160728",
          "DTEND;VALUE=DATE": "20160730",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "deltaaquaridsmeteorshower_2016072820160730@seasky.org",
          "DESCRIPTION": "The Delta Aquarids is an average shower that can produce up to 20 meteors per hour at its peak. It is produced by debris left behind by comets Marsden and Kracht. The shower runs annually from July 12 to August 23. It peaks this year on the night of July 28 and morning of July 29. The second quarter moon will block most of the fainter meteors this year but if you are patient you should still be able to catch quite a few good ones. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Aquarius\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20160802",
          "DTEND;VALUE=DATE": "20160803",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "newmoon_2016080220160803@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 20:44 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Perseids Meteor Shower",
          "DTSTART;VALUE=DATE": "20160812",
          "DTEND;VALUE=DATE": "20160814",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "perseidsmeteorshower_2016081220160814@seasky.org",
          "DESCRIPTION": "The Perseids is one of the best meteor showers to observe\\n, producing up to 60 meteors per hour at its peak. It is produced by comet Swift-Tuttle\\n, which was discovered in 1862. The Perseids are famous for producing a large number of bright meteors. The shower runs annually from July 17 to August 24. It peaks this year on the night of August 12 and the morning of August 13. The waxing gibbous moon will set shortly after midnight\\n, leaving fairly dark skies for should be an excellent early morning show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Perseus\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20160816",
          "DTEND;VALUE=DATE": "20160817",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "mercuryatgreatesteasternelongation_2016081620160817@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 27.4 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20160818",
          "DTEND;VALUE=DATE": "20160819",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "fullmoon_2016081820160819@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 09:26 UTC. This full moon was known by early Native American tribes as the Full Sturgeon Moon because the large sturgeon fish of the Great Lakes and other major lakes were more easily caught at this time of year. This moon has also been known as the Green Corn Moon and the Grain Moon."
        },
        {
          "SUMMARY": "Conjunction of Venus and Jupiter",
          "DTSTART;VALUE=DATE": "20160827",
          "DTEND;VALUE=DATE": "20160828",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "conjunctionofvenusandjupiter_2016082720160828@seasky.org",
          "DESCRIPTION": "A spectacular conjunction of Venus and Jupiter will be visible in the evening sky. The two bright planets will be extremely close\\n, appearing only 0.06 degrees apart. Look for this impressive pairing in the western sky just after sunset."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20160901",
          "DTEND;VALUE=DATE": "20160902",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "newmoon_2016090120160902@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 09:03 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Annular Solar Eclipse",
          "DTSTART;VALUE=DATE": "20160901",
          "DTEND;VALUE=DATE": "20160902",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "annularsolareclipse_2016090120160902@seasky.org",
          "DESCRIPTION": "An annular solar eclipse occurs when the Moon is too far away from the Earth to completely cover the Sun. This results in a ring of light around the darkened Moon. The Sun's corona is not visible during an annular eclipse. The path of the eclipse will begin off the eastern coast of central Africa and travel through Gabon\\n, Congo\\n, Tanzania\\n, and Madagascar before ending in the Indian Ocean. A partial eclipse will be visible throughout most of Africa and the Indian Ocean. () ()"
        },
        {
          "SUMMARY": "Neptune at Opposition",
          "DTSTART;VALUE=DATE": "20160903",
          "DTEND;VALUE=DATE": "20160904",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "neptuneatopposition_2016090320160904@seasky.org",
          "DESCRIPTION": "The blue giant planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Neptune. Due to its extreme distance from Earth\\n, it will only appear as a tiny blue dot in all but the most powerful telescopes."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20160916",
          "DTEND;VALUE=DATE": "20160917",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "fullmoon_2016091620160917@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 19:05 UTC. This full moon was known by early Native American tribes as the Full Corn Moon because the corn is harvested around this time of year. This moon is also known as the Harvest Moon. The Harvest Moon is the full moon that occurs closest to the September equinox each year."
        },
        {
          "SUMMARY": "Penumbral Lunar Eclipse",
          "DTSTART;VALUE=DATE": "20160916",
          "DTEND;VALUE=DATE": "20160917",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "penumbrallunareclipse_2016091620160917@seasky.org",
          "DESCRIPTION": "A penumbral lunar eclipse occurs when the Moon passes through the Earth's partial shadow\\n, or penumbra. During this type of eclipse the Moon will darken slightly but not completely. The eclipse will be visible throughout most of eastern Europe\\n, eastern Africa\\n, Asia\\n, and western Australia. ()"
        },
        {
          "SUMMARY": "September Equinox",
          "DTSTART;VALUE=DATE": "20160922",
          "DTEND;VALUE=DATE": "20160923",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "septemberequinox_2016092220160923@seasky.org",
          "DESCRIPTION": "The September equinox occurs at 14:21 UTC. The Sun will shine directly on the equator and there will be nearly equal amounts of day and night throughout the world. This is also the first day of fall (autumnal equinox) in the Northern Hemisphere and the first day of spring (vernal equinox) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20160928",
          "DTEND;VALUE=DATE": "20160929",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "mercuryatgreatestwesternelongation_2016092820160929@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 17.9 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20161001",
          "DTEND;VALUE=DATE": "20161002",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "newmoon_2016100120161002@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 00:11 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Draconids Meteor Shower",
          "DTSTART;VALUE=DATE": "20161007",
          "DTEND;VALUE=DATE": "20161008",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "draconidsmeteorshower_2016100720161008@seasky.org",
          "DESCRIPTION": "The Draconids is a minor meteor shower producing only about 10 meteors per hour. It is produced by dust grains left behind by comet 21P Giacobini-Zinner\\n, which was first discovered in 1900. The Draconids is an unusual shower in that the best viewing is in the early evening instead of early morning like most other showers. The shower runs annually from October 6-10 and peaks this year on the the night of the 7th. The first quarter moon will block the fainter meteors in the early evening. It will set shortly after midnight leaving darker skies for observing any lingering stragglers. Best viewing will be in the early evening from a dark location far away from city lights. Meteors will radiate from the constellation Draco\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Uranus at Opposition",
          "DTSTART;VALUE=DATE": "20161015",
          "DTEND;VALUE=DATE": "20161016",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "uranusatopposition_2016101520161016@seasky.org",
          "DESCRIPTION": "The blue-green planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view Uranus. Due to its distance\\n, the planet will only appear as a tiny blue-green dot in all but the most powerful telescopes."
        },
        {
          "SUMMARY": "Full Moon\\n, Supermoon",
          "DTSTART;VALUE=DATE": "20161016",
          "DTEND;VALUE=DATE": "20161017",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "fullmoon\\n,supermoon_2016101620161017@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 04:23 UTC. This full moon was known by early Native American tribes as the Full Hunters Moon because at this time of year the leaves are falling and the game is fat and ready to hunt. This moon has also been known as the Travel Moon and the Blood Moon. This is also the first of three supermoons for 2016. The Moon will be at its closest approach to the Earth and may look slightly larger and brighter than usual."
        },
        {
          "SUMMARY": "Orionids Meteor Shower",
          "DTSTART;VALUE=DATE": "20161021",
          "DTEND;VALUE=DATE": "20161023",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "orionidsmeteorshower_2016102120161023@seasky.org",
          "DESCRIPTION": "The Orionids is an average shower producing up to 20 meteors per hour at its peak. It is produced by dust grains left behind by comet Halley\\n, which has been known and observed since ancient times. The shower runs annually from October 2 to November 7. It peaks this year on the night of October 21 and the morning of October 22. The second quarter moon will block some of the fainter meteors this year\\n, but the Orionids tend to be fairly bright so it could still be a good show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Orion\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20161030",
          "DTEND;VALUE=DATE": "20161031",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "newmoon_2016103020161031@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 17:38 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Taurids Meteor Shower",
          "DTSTART;VALUE=DATE": "20161104",
          "DTEND;VALUE=DATE": "20161106",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "tauridsmeteorshower_2016110420161106@seasky.org",
          "DESCRIPTION": "The Taurids is a long-running minor meteor shower producing only about 5-10 meteors per hour. It is unusual in that it consists of two separate streams. The first is produced by dust grains left behind by Asteroid 2004 TG10. The second stream is produced by debris left behind by Comet 2P Encke. The shower runs annually from September 7 to December 10. It peaks this year on the the night of November 4. The first quarter moon will set just after midnight leaving dark skies for viewing. Best viewing will be just after midnight from a dark location far away from city lights. Meteors will radiate from the constellation Taurus\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon\\n, Supermoon",
          "DTSTART;VALUE=DATE": "20161114",
          "DTEND;VALUE=DATE": "20161115",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "fullmoon\\n,supermoon_2016111420161115@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 13:52 UTC. This full moon was known by early Native American tribes as the Full Beaver Moon because this was the time of year to set the beaver traps before the swamps and rivers froze. It has also been known as the Frosty Moon and the Hunter's Moon. This is also the second of three supermoons for 2016. The Moon will be at its closest approach to the Earth and may look slightly larger and brighter than usual."
        },
        {
          "SUMMARY": "Leonids Meteor Shower",
          "DTSTART;VALUE=DATE": "20161117",
          "DTEND;VALUE=DATE": "20161119",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "leonidsmeteorshower_2016111720161119@seasky.org",
          "DESCRIPTION": "The Leonids is an average shower\\n, producing up to 15 meteors per hour at its peak. This shower is unique in that it has a cyclonic peak about every 33 years where hundreds of meteors per hour can be seen. That last of these occurred in 2001. The Leonids is produced by dust grains left behind by comet Tempel-Tuttle\\n, which was discovered in 1865. The shower runs annually from November 6-30. It peaks this year on the night of the 17th and morning of the 18th. The waning gibbous moon will block many of the fainter meteors this year\\n, but if you are patient you should be able to catch quite a few good ones. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Leo\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20161129",
          "DTEND;VALUE=DATE": "20161130",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "newmoon_2016112920161130@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 12:18 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20161211",
          "DTEND;VALUE=DATE": "20161212",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "mercuryatgreatesteasternelongation_2016121120161212@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 20.8 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "Geminids Meteor Shower",
          "DTSTART;VALUE=DATE": "20161213",
          "DTEND;VALUE=DATE": "20161215",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "geminidsmeteorshower_2016121320161215@seasky.org",
          "DESCRIPTION": "The Geminids is the  king of the meteor showers. It is considered by many to be the best shower in the heavens\\n, producing up to 120 multicolored meteors per hour at its peak. It is produced by debris left behind by an asteroid known as 3200 Phaethon\\n, which was discovered in 1982. The shower runs annually from December 7-17. It peaks this year on the night of the 13th and morning of the 14th. The nearly full moon will block out many of the fainter meteors this year\\n, but the Geminids are so bright and numerous that it could still be a good show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Gemini\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon\\n, Supermoon",
          "DTSTART;VALUE=DATE": "20161214",
          "DTEND;VALUE=DATE": "20161215",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "fullmoon\\n,supermoon_2016121420161215@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 00:06 UTC. This full moon was known by early Native American tribes as the Full Cold Moon because this is the time of year when the cold winter air settles in and the nights become long and dark. This moon has also been known as the Full Long Nights Moon and the Moon Before Yule. This is also the last of three supermoons for 2016. The Moon will be at its closest approach to the Earth and may look slightly larger and brighter than usual."
        },
        {
          "SUMMARY": "December Solstice",
          "DTSTART;VALUE=DATE": "20161221",
          "DTEND;VALUE=DATE": "20161222",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "decembersolstice_2016122120161222@seasky.org",
          "DESCRIPTION": "The December solstice occurs at 10:44 UTC. The South Pole of the earth will be tilted toward the Sun\\n, which will have reached its southernmost position in the sky and will be directly over the Tropic of Capricorn at 23.44 degrees south latitude. This is the first day of winter (winter solstice) in the Northern Hemisphere and the first day of summer (summer solstice) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Ursids Meteor Shower",
          "DTSTART;VALUE=DATE": "20161221",
          "DTEND;VALUE=DATE": "20161223",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "ursidsmeteorshower_2016122120161223@seasky.org",
          "DESCRIPTION": "The Ursids is a minor meteor shower producing about 5-10 meteors per hour. It is produced by dust grains left behind by comet Tuttle\\n, which was first discovered in 1790. The shower runs annually from December 17-25. It peaks this year on the the night of the 21st and morning of the 22nd. The second quarter moon will block many of the fainter meteors. But if you are patient\\n, you might still be able to catch a few of the brighter ones. Best viewing will be just after midnight from a dark location far away from city lights. Meteors will radiate from the constellation Ursa Minor\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20161229",
          "DTEND;VALUE=DATE": "20161230",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194719Z",
          "UID": "newmoon_2016122920161230@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 06:53 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Quadrantids Meteor Shower",
          "DTSTART;VALUE=DATE": "20170103",
          "DTEND;VALUE=DATE": "20170105",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "quadrantidsmeteorshower_2017010320170105@seasky.org",
          "DESCRIPTION": "The Quadrantids is an above average shower\\n, with up to 40 meteors per hour at its peak. It is thought to be produced by dust grains left behind by an extinct comet known as 2003 EH1\\n, which was discovered in 2003. The shower runs annually from January 1-5. It peaks this year on the night of the 3rd and  morning of the 4th.  The first quarter moon will set shortly after midnight leaving fairly dark skies for what could be a good show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Bootes\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20170112",
          "DTEND;VALUE=DATE": "20170113",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "fullmoon_2017011220170113@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 11:34 UTC. This full moon was known by early Native American tribes as the Full Wolf Moon because this was the time of year when hungry wolf packs howled outside their camps. This moon has also been know as the Old Moon and the Moon After Yule."
        },
        {
          "SUMMARY": "Venus at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20170112",
          "DTEND;VALUE=DATE": "20170113",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "venusatgreatesteasternelongation_2017011220170113@seasky.org",
          "DESCRIPTION": "The planet Venus reaches greatest eastern elongation of 47.1 degrees from the Sun. This is the best time to view Venus since it will be at its highest point above the horizon in the evening sky. Look for the bright planet in the western sky after sunset."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20170119",
          "DTEND;VALUE=DATE": "20170120",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "mercuryatgreatestwesternelongation_2017011920170120@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 24.1 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20170128",
          "DTEND;VALUE=DATE": "20170129",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "newmoon_2017012820170129@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 00:07 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20170211",
          "DTEND;VALUE=DATE": "20170212",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "fullmoon_2017021120170212@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 00:33 UTC. This full moon was known by early Native American tribes as the Full Snow Moon because the heaviest snows usually fell during this time of the year. Since hunting is difficult\\n, this moon has also been known by some tribes as the Full Hunger Moon\\n, since the harsh weather made hunting difficult."
        },
        {
          "SUMMARY": "Penumbral Lunar Eclipse",
          "DTSTART;VALUE=DATE": "20170211",
          "DTEND;VALUE=DATE": "20170212",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "penumbrallunareclipse_2017021120170212@seasky.org",
          "DESCRIPTION": "A penumbral lunar eclipse occurs when the Moon passes through the Earth's partial shadow\\n, or penumbra. During this type of eclipse the Moon will darken slightly but not completely.  The eclipse will be visible throughout most of eastern South America\\n, eastern Canada\\n, the Atlantic Ocean\\n, Europe\\n, Africa\\n, and western Asia. ()"
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20170226",
          "DTEND;VALUE=DATE": "20170227",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "newmoon_2017022620170227@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 14:59 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Annular Solar Eclipse",
          "DTSTART;VALUE=DATE": "20170226",
          "DTEND;VALUE=DATE": "20170227",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "annularsolareclipse_2017022620170227@seasky.org",
          "DESCRIPTION": "An annular solar eclipse occurs when the Moon is too far away from the Earth to completely cover the Sun. This results in a ring of light around the darkened Moon. The Sun's corona is not visible during an annular eclipse. The path of the eclipse will begin off the coast of Chile and pass through southern Chile and southern Argentina\\n, across the southern Atlantic Ocean\\n, and into Angola and Congo in Africa. A partial eclipse will be visible throughout parts of southern South America and southwestern Africa.\\nn        () ()"
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20170312",
          "DTEND;VALUE=DATE": "20170313",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "fullmoon_2017031220170313@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 14:54 UTC. This full moon was known by early Native American tribes as the Full Worm Moon because this was the time of year when the ground would begin to soften and the earthworms would reappear. This moon has also been known as the Full Crow Moon\\n, the Full Crust Moon\\n, the Full Sap Moon\\n, and the Lenten Moon."
        },
        {
          "SUMMARY": "March Equinox",
          "DTSTART;VALUE=DATE": "20170320",
          "DTEND;VALUE=DATE": "20170321",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "marchequinox_2017032020170321@seasky.org",
          "DESCRIPTION": "The March equinox occurs at 10:29 UTC. The Sun will shine directly on the equator and there will be nearly equal amounts of day and night throughout the world. This is also the first day of spring (vernal equinox) in the Northern Hemisphere and the first day of fall (autumnal equinox) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20170328",
          "DTEND;VALUE=DATE": "20170329",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "newmoon_2017032820170329@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 02:58 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20170401",
          "DTEND;VALUE=DATE": "20170402",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "mercuryatgreatesteasternelongation_2017040120170402@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 19 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "Jupiter at Opposition",
          "DTSTART;VALUE=DATE": "20170407",
          "DTEND;VALUE=DATE": "20170408",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "jupiteratopposition_2017040720170408@seasky.org",
          "DESCRIPTION": "The giant planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Jupiter and its moons. A medium-sized telescope should be able to show you some of the details in Jupiter's cloud bands. A good pair of binoculars should allow you to see Jupiter's four largest moons\\n, appearing as bright dots on either side of the planet."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20170411",
          "DTEND;VALUE=DATE": "20170412",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "fullmoon_2017041120170412@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 06:08 UTC. This full moon was known by early Native American tribes as the Full Pink Moon because it marked the appearance of the moss pink\\n, or wild ground phlox\\n, which is one of the first spring flowers. This moon has also been known as the Sprouting Grass Moon\\n, the Growing Moon\\n, and the Egg Moon. Many coastal tribes called it the Full Fish Moon because this was the time that the shad swam upstream to spawn."
        },
        {
          "SUMMARY": "Lyrids Meteor Shower",
          "DTSTART;VALUE=DATE": "20170422",
          "DTEND;VALUE=DATE": "20170424",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "lyridsmeteorshower_2017042220170424@seasky.org",
          "DESCRIPTION": "The Lyrids is an average shower\\n, usually producing about 20 meteors per hour at its peak. It is produced by dust particles left behind by comet C/1861 G1 Thatcher\\n, which was discovered in 1861. The shower runs annually from April 16-25. It peaks this year on the night of the night of the 22nd and morning of the 23rd. These meteors can sometimes produce bright dust trails that last for several seconds.  The crescent moon should not be too much of a problem this year. Skies should still be dark enough for a good show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Lyra\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20170426",
          "DTEND;VALUE=DATE": "20170427",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "newmoon_2017042620170427@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 12:17 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Eta Aquarids Meteor Shower",
          "DTSTART;VALUE=DATE": "20170506",
          "DTEND;VALUE=DATE": "20170508",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "etaaquaridsmeteorshower_2017050620170508@seasky.org",
          "DESCRIPTION": "The Eta Aquarids is an above average shower\\n, capable of producing up to 60 meteors per hour at its peak. Most of the activity is seen in the Southern Hemisphere. In the Northern Hemisphere\\n, the rate can reach about 30 meteors per hour. It is produced by dust particles left behind by comet Halley\\n, which has known and observed since ancient times. The shower runs annually from April 19 to May 28. It peaks this year on the night of May 6 and the morning of the May 7. The waxing gibbous moon will block out many of the fainter meteors this year. But if you are patient\\n, you should be able to catch quite a few of the brighter ones. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Aquarius\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20170510",
          "DTEND;VALUE=DATE": "20170511",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "fullmoon_2017051020170511@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 21:42 UTC. This full moon was known by early Native American tribes as the Full Flower Moon because this was the time of year when spring flowers appeared in abundance. This moon has also been known as the Full Corn Planting Moon and the Milk Moon."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20170517",
          "DTEND;VALUE=DATE": "20170518",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "mercuryatgreatestwesternelongation_2017051720170518@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 25.8 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20170525",
          "DTEND;VALUE=DATE": "20170526",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "newmoon_2017052520170526@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 19:45 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Venus at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20170603",
          "DTEND;VALUE=DATE": "20170604",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "venusatgreatestwesternelongation_2017060320170604@seasky.org",
          "DESCRIPTION": "The planet Venus reaches greatest eastern elongation of 45.9 degrees from the Sun. This is the best time to view Venus since it will be at its highest point above the horizon in the morning sky. Look for the bright planet in the eastern sky before sunrise."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20170609",
          "DTEND;VALUE=DATE": "20170610",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "fullmoon_2017060920170610@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 13:10 UTC. This full moon was known by early Native American tribes as the Full Strawberry Moon because it signaled the time of year to gather ripening fruit. It also coincides with the peak of the strawberry harvesting season. This moon has also been known as the Full Rose Moon and the Full Honey Moon."
        },
        {
          "SUMMARY": "Saturn at Opposition",
          "DTSTART;VALUE=DATE": "20170615",
          "DTEND;VALUE=DATE": "20170616",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "saturnatopposition_2017061520170616@seasky.org",
          "DESCRIPTION": "The ringed planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Saturn and its moons. A medium-sized or larger telescope will allow you to see Saturn's rings and a few of its brightest moons."
        },
        {
          "SUMMARY": "June Solstice",
          "DTSTART;VALUE=DATE": "20170621",
          "DTEND;VALUE=DATE": "20170622",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "junesolstice_2017062120170622@seasky.org",
          "DESCRIPTION": "The June solstice occurs at 04:24 UTC. The North Pole of the earth will be tilted toward the Sun\\n, which will have reached its northernmost position in the sky and will be directly over the Tropic of Cancer at 23.44 degrees north latitude. This is the first day of summer (summer solstice) in the Northern Hemisphere and the first day of winter (winter solstice) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20170624",
          "DTEND;VALUE=DATE": "20170625",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "newmoon_2017062420170625@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 02:31 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20170709",
          "DTEND;VALUE=DATE": "20170710",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "fullmoon_2017070920170710@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 04:07 UTC. This full moon was known by early Native American tribes as the Full Buck Moon because the male buck deer would begin to grow their new antlers at this time of year. This moon has also been known as the Full Thunder Moon and the Full Hay Moon."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20170723",
          "DTEND;VALUE=DATE": "20170724",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "newmoon_2017072320170724@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 09:46 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Delta Aquarids Meteor Shower",
          "DTSTART;VALUE=DATE": "20170728",
          "DTEND;VALUE=DATE": "20170730",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "deltaaquaridsmeteorshower_2017072820170730@seasky.org",
          "DESCRIPTION": "The Delta Aquarids is an average shower that can produce up to 20 meteors per hour at its peak. It is produced by debris left behind by comets Marsden and Kracht. The shower runs annually from July 12 to August 23. It peaks this year on the night of July 28 and morning of July 29. The crescent moon will set by midnight\\n, leaving dark skies for what should be a good early morning show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Aquarius\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20170730",
          "DTEND;VALUE=DATE": "20170731",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "mercuryatgreatesteasternelongation_2017073020170731@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 27.2 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20170807",
          "DTEND;VALUE=DATE": "20170808",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "fullmoon_2017080720170808@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 18:11 UTC. This full moon was known by early Native American tribes as the Full Sturgeon Moon because the large sturgeon fish of the Great Lakes and other major lakes were more easily caught at this time of year. This moon has also been known as the Green Corn Moon and the Grain Moon."
        },
        {
          "SUMMARY": "Partial Lunar Eclipse",
          "DTSTART;VALUE=DATE": "20170807",
          "DTEND;VALUE=DATE": "20170808",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "partiallunareclipse_2017080720170808@seasky.org",
          "DESCRIPTION": "A partial lunar eclipse occurs when the Moon passes through the Earth's partial shadow\\n, or penumbra\\n, and only a portion of it passes through the darkest shadow\\n, or umbra. During this type of eclipse a part of the Moon will darken as it moves through the Earth's shadow. The eclipse will be visible throughout most of eastern Africa\\n, central Asia\\n, the Indian Ocean\\n, and Australia. ()"
        },
        {
          "SUMMARY": "Perseids Meteor Shower",
          "DTSTART;VALUE=DATE": "20170812",
          "DTEND;VALUE=DATE": "20170814",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "perseidsmeteorshower_2017081220170814@seasky.org",
          "DESCRIPTION": "The Perseids is one of the best meteor showers to observe\\n, producing up to 60 meteors per hour at its peak. It is produced by comet Swift-Tuttle\\n, which was discovered in 1862. The Perseids are famous for producing a large number of bright meteors. The shower runs annually from July 17 to August 24. It peaks this year on the night of August 12 and the morning of August 13. The waning gibbous moon will block out many of the fainter meteors this year\\n, but the Perseids are so bright and numerous that it should still be a good show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Perseus\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20170821",
          "DTEND;VALUE=DATE": "20170822",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "newmoon_2017082120170822@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 18:30 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "",
          "DTSTART;VALUE=DATE": "20170821",
          "DTEND;VALUE=DATE": "20170822",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "_2017082120170822@seasky.org",
          "DESCRIPTION": "A total solar eclipse occurs when the moon completely blocks the Sun\\n, revealing the Sun's beautiful outer atmosphere known as the corona. This is a  for viewers in the United States. The last total solar eclipse visible in the continental United States occurred in 1979 and the next one will not take place until 2024. The path of totality will begin in the Pacific Ocean and travel through the center of the United States. The total eclipse will be visible in parts of Oregon\\n, Idaho\\n, Wyoming\\n, Nebraska\\n, Missouri\\n, Kentucky\\n, Tennessee\\n, North Carolina\\n, and South Carolina before ending in the Atlantic Ocean. A partial eclipse will be visible in most of North America and parts of northern South America. ( | )"
        },
        {
          "SUMMARY": "Neptune at Opposition",
          "DTSTART;VALUE=DATE": "20170905",
          "DTEND;VALUE=DATE": "20170906",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "neptuneatopposition_2017090520170906@seasky.org",
          "DESCRIPTION": "The blue giant planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Neptune. Due to its extreme distance from Earth\\n, it will only appear as a tiny blue dot in all but the most powerful telescopes."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20170906",
          "DTEND;VALUE=DATE": "20170907",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "fullmoon_2017090620170907@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 07:03 UTC. This full moon was known by early Native American tribes as the Full Corn Moon because the corn is harvested around this time of year."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20170912",
          "DTEND;VALUE=DATE": "20170913",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "mercuryatgreatestwesternelongation_2017091220170913@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 17.9 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20170920",
          "DTEND;VALUE=DATE": "20170921",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "newmoon_2017092020170921@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 05:30 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "September Equinox",
          "DTSTART;VALUE=DATE": "20170922",
          "DTEND;VALUE=DATE": "20170923",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "septemberequinox_2017092220170923@seasky.org",
          "DESCRIPTION": "The September equinox occurs at 20:02 UTC. The Sun will shine directly on the equator and there will be nearly equal amounts of day and night throughout the world. This is also the first day of fall (autumnal equinox) in the Northern Hemisphere and the first day of spring (vernal equinox) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20171005",
          "DTEND;VALUE=DATE": "20171006",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "fullmoon_2017100520171006@seasky.org",
          "DESCRIPTION": "Moon will be directly opposite the Earth from the Sun and will be fully illuminated as seen from Earth. This phase occurs at 18:40 UTC. This full moon was known by early Native American tribes as the Full Hunters Moon because at this time of year the leaves are falling and the game is fat and ready to hunt. This moon has also been known as the Travel Moon and the Blood Moon. This moon is also known as the Harvest Moon. The Harvest Moon is the full moon that occurs closest to the September equinox each year."
        },
        {
          "SUMMARY": "Draconids Meteor Shower",
          "DTSTART;VALUE=DATE": "20171007",
          "DTEND;VALUE=DATE": "20171008",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "draconidsmeteorshower_2017100720171008@seasky.org",
          "DESCRIPTION": "The Draconids is a minor meteor shower producing only about 10 meteors per hour. It is produced by dust grains left behind by comet 21P Giacobini-Zinner\\n, which was first discovered in 1900. The Draconids is an unusual shower in that the best viewing is in the early evening instead of early morning like most other showers. The shower runs annually from October 6-10 and peaks this year on the the night of the 7th. Unfortunately\\n, the nearly full moon will block all but the brightest meteors this year. If you are extremely patient\\n, you may be able to catch a few good ones. Best viewing will be in the early evening from a dark location far away from city lights. Meteors will radiate from the constellation Draco\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20171019",
          "DTEND;VALUE=DATE": "20171020",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "newmoon_2017101920171020@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 19:12 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Uranus at Opposition",
          "DTSTART;VALUE=DATE": "20171019",
          "DTEND;VALUE=DATE": "20171020",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "uranusatopposition_2017101920171020@seasky.org",
          "DESCRIPTION": "The blue-green planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view Uranus. Due to its distance\\n, it will only appear as a tiny blue-green dot in all but the most powerful telescopes."
        },
        {
          "SUMMARY": "Orionids Meteor Shower",
          "DTSTART;VALUE=DATE": "20171021",
          "DTEND;VALUE=DATE": "20171023",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "orionidsmeteorshower_2017102120171023@seasky.org",
          "DESCRIPTION": "The Orionids is an average shower producing up to 20 meteors per hour at its peak. It is produced by dust grains left behind by comet Halley\\n, which has been known and observed since ancient times. The shower runs annually from October 2 to November 7. It peaks this year on the night of October 21 and the morning of October 22. The crescent moon will set early in the evening leaving dark skies for what should be a good show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Orion\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20171104",
          "DTEND;VALUE=DATE": "20171105",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "fullmoon_2017110420171105@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 05:23 UTC. This full moon was known by early Native American tribes as the Full Beaver Moon because this was the time of year to set the beaver traps before the swamps and rivers froze. It has also been known as the Frosty Moon and the Hunter's Moon."
        },
        {
          "SUMMARY": "Taurids Meteor Shower",
          "DTSTART;VALUE=DATE": "20171104",
          "DTEND;VALUE=DATE": "20171106",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "tauridsmeteorshower_2017110420171106@seasky.org",
          "DESCRIPTION": "The Taurids is a long-running minor meteor shower producing only about 5-10 meteors per hour. It is unusual in that it consists of two separate streams. The first is produced by dust grains left behind by Asteroid 2004 TG10. The second stream is produced by debris left behind by Comet 2P Encke. The shower runs annually from September 7 to December 10. It peaks this year on the the night of November 4. Unfortunately the glare from the full moon will block out all but the brightest meteors. If you are extremely patient\\n, you may still be able to catch a few good ones. Best viewing will be just after midnight from a dark location far away from city lights. Meteors will radiate from the constellation Taurus\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Conjunction of Venus and Jupiter",
          "DTSTART;VALUE=DATE": "20171113",
          "DTEND;VALUE=DATE": "20171114",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "conjunctionofvenusandjupiter_2017111320171114@seasky.org",
          "DESCRIPTION": "A spectacular conjunction of Venus and Jupiter will be visible in the evening sky. The two bright planets will be extremely close\\n, appearing only 0.3 degrees apart. Look for this impressive pairing in the Eastern sky just before sunrise."
        },
        {
          "SUMMARY": "Leonids Meteor Shower",
          "DTSTART;VALUE=DATE": "20171117",
          "DTEND;VALUE=DATE": "20171119",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "leonidsmeteorshower_2017111720171119@seasky.org",
          "DESCRIPTION": "The Leonids is an average shower\\n, producing up to 15 meteors per hour at its peak. This shower is unique in that it has a cyclonic peak about every 33 years where hundreds of meteors per hour can be seen. That last of these occurred in 2001. The Leonids is produced by dust grains left behind by comet Tempel-Tuttle\\n, which was discovered in 1865. The shower runs annually from November 6-30. It peaks this year on the night of the 17th and morning of the 18th. The nearly new moon will not be a problem this year. Skies should be dark enough for what should be good show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Leo\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20171118",
          "DTEND;VALUE=DATE": "20171119",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "newmoon_2017111820171119@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 11:42 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20171124",
          "DTEND;VALUE=DATE": "20171125",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "mercuryatgreatesteasternelongation_2017112420171125@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 22.0 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "Full Moon\\n, Supermoon",
          "DTSTART;VALUE=DATE": "20171203",
          "DTEND;VALUE=DATE": "20171204",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "fullmoon\\n,supermoon_2017120320171204@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 15:47 UTC. This full moon was known by early Native American tribes as the Full Cold Moon because this is the time of year when the cold winter air settles in and the nights become long and dark. This moon has also been known as the Full Long Nights Moon and the Moon Before Yule. This is also the only supermoon for 2017. The Moon will be at its closest approach to the Earth and may look slightly larger and brighter than usual."
        },
        {
          "SUMMARY": "Geminids Meteor Shower",
          "DTSTART;VALUE=DATE": "20171213",
          "DTEND;VALUE=DATE": "20171215",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "geminidsmeteorshower_2017121320171215@seasky.org",
          "DESCRIPTION": "The Geminids is the  king of the meteor showers. It is considered by many to be the best shower in the heavens\\n, producing up to 120 multicolored meteors per hour at its peak. It is produced by debris left behind by an asteroid known as 3200 Phaethon\\n, which was discovered in 1982. The shower runs annually from December 7-17. It peaks this year on the night of the 13th and morning of the 14th. The waning crescent moon will be no match for the Geminids this year. The skies should still be dark enough for an excellent show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Gemini\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20171218",
          "DTEND;VALUE=DATE": "20171219",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "newmoon_2017121820171219@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 06:30 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "December Solstice",
          "DTSTART;VALUE=DATE": "20171221",
          "DTEND;VALUE=DATE": "20171222",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "decembersolstice_2017122120171222@seasky.org",
          "DESCRIPTION": "The December solstice occurs at 16:28 UTC. The South Pole of the earth will be tilted toward the Sun\\n, which will have reached its southernmost position in the sky and will be directly over the Tropic of Capricorn at 23.44 degrees south latitude. This is the first day of winter (winter solstice) in the Northern Hemisphere and the first day of summer (summer solstice) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Ursids Meteor Shower",
          "DTSTART;VALUE=DATE": "20171221",
          "DTEND;VALUE=DATE": "20171223",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194720Z",
          "UID": "ursidsmeteorshower_2017122120171223@seasky.org",
          "DESCRIPTION": "The Ursids is a minor meteor shower producing about 5-10 meteors per hour. It is produced by dust grains left behind by comet Tuttle\\n, which was first discovered in 1790. The shower runs annually from December 17-25. It peaks this year on the the night of the 21st and morning of the 22nd. The crescent moon will set early in the evening leaving dark skies for optimal observing. Best viewing will be just after midnight from a dark location far away from city lights. Meteors will radiate from the constellation Ursa Minor\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20180101",
          "DTEND;VALUE=DATE": "20180102",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "mercuryatgreatestwesternelongation_2018010120180102@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 22.7 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "Full Moon\\n, Supermoon",
          "DTSTART;VALUE=DATE": "20180102",
          "DTEND;VALUE=DATE": "20180103",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "fullmoon\\n,supermoon_2018010220180103@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 02:24 UTC. This full moon was known by early Native American tribes as the Full Wolf Moon because this was the time of year when hungry wolf packs howled outside their camps. This moon has also been know as the Old Moon and the Moon After Yule. This is also the first of two supermoons for 2018. The Moon will be at its closest approach to the Earth and may look slightly larger and brighter than usual."
        },
        {
          "SUMMARY": "Quadrantids Meteor Shower",
          "DTSTART;VALUE=DATE": "20180103",
          "DTEND;VALUE=DATE": "20180105",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "quadrantidsmeteorshower_2018010320180105@seasky.org",
          "DESCRIPTION": "The Quadrantids is an above average shower\\n, with up to 40 meteors per hour at its peak. It is thought to be produced by dust grains left behind by an extinct comet known as 2003 EH1\\n, which was discovered in 2003. The shower runs annually from January 1-5. It peaks this year on the night of the 3rd and  morning of the 4th.  Unfortunately the nearly full moon will block out all but the brightest meteors this year. If you are patient\\n, you should still be able to catch some of the brightest ones. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Bootes\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20180117",
          "DTEND;VALUE=DATE": "20180118",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "newmoon_2018011720180118@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 02:17 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Full Moon\\n, Supermoon\\n, Blue Moon",
          "DTSTART;VALUE=DATE": "20180131",
          "DTEND;VALUE=DATE": "20180201",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "fullmoon\\n,supermoon\\n,bluemoon_2018013120180201@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 13:27 UTC.  Since this is the second full moon in the same month\\n, it is sometimes referred to as a blue moon. This is also the last of two supermoons for 2018. The Moon will be at its closest approach to the Earth and may look slightly larger and brighter than usual."
        },
        {
          "SUMMARY": "Total Lunar Eclipse",
          "DTSTART;VALUE=DATE": "20180131",
          "DTEND;VALUE=DATE": "20180201",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "totallunareclipse_2018013120180201@seasky.org",
          "DESCRIPTION": "A total lunar eclipse occurs when the Moon passes completely through the Earth's dark shadow\\n, or umbra. During this type of eclipse\\n, the Moon will gradually get darker and then take on a rusty or blood red color. The eclipse will be visible throughout most of western North America\\n, eastern Asia\\n, Australia\\n, and the Pacific Ocean. ()"
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20180215",
          "DTEND;VALUE=DATE": "20180216",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "newmoon_2018021520180216@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 21:05 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Partial Solar Eclipse",
          "DTSTART;VALUE=DATE": "20180215",
          "DTEND;VALUE=DATE": "20180216",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "partialsolareclipse_2018021520180216@seasky.org",
          "DESCRIPTION": "A partial solar eclipse occurs when the Moon covers only a part of the Sun\\n, sometimes resembling a bite taken out of a cookie. A partial solar eclipse can only be safely observed with a special solar filter or by looking at the Sun's reflection. This partial eclipse will only be visible in parts of Chile\\n, Argentina\\n, and Antarctica. ()"
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20180302",
          "DTEND;VALUE=DATE": "20180303",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "fullmoon_2018030220180303@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 00:51 UTC. This full moon was known by early Native American tribes as the Full Worm Moon because this was the time of year when the ground would begin to soften and the earthworms would reappear. This moon has also been known as the Full Crow Moon\\n, the Full Crust Moon\\n, the Full Sap Moon\\n, and the Lenten Moon.\\nn"
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20180315",
          "DTEND;VALUE=DATE": "20180316",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "mercuryatgreatesteasternelongation_2018031520180316@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 18.4 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20180317",
          "DTEND;VALUE=DATE": "20180318",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "newmoon_2018031720180318@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 13:12 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "March Equinox",
          "DTSTART;VALUE=DATE": "20180320",
          "DTEND;VALUE=DATE": "20180321",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "marchequinox_2018032020180321@seasky.org",
          "DESCRIPTION": "The March equinox occurs at 16:15 UTC. The Sun will shine directly on the equator and there will be nearly equal amounts of day and night throughout the world. This is also the first day of spring (vernal equinox) in the Northern Hemisphere and the first day of fall (autumnal equinox) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Full Moon\\n, Blue Moon",
          "DTSTART;VALUE=DATE": "20180331",
          "DTEND;VALUE=DATE": "20180401",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "fullmoon\\n,bluemoon_2018033120180401@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 12:37 UTC.    Since this is the second full moon in the same month\\n, it is sometimes referred to as a blue moon. This year is particularly unique in that January and March both contain two full moons while February has no full moon."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20180416",
          "DTEND;VALUE=DATE": "20180417",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "newmoon_2018041620180417@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 01:58 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Lyrids Meteor Shower",
          "DTSTART;VALUE=DATE": "20180422",
          "DTEND;VALUE=DATE": "20180424",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "lyridsmeteorshower_2018042220180424@seasky.org",
          "DESCRIPTION": "The Lyrids is an average shower\\n, usually producing about 20 meteors per hour at its peak. It is produced by dust particles left behind by comet C/1861 G1 Thatcher\\n, which was discovered in 1861. The shower runs annually from April 16-25. It peaks this year on the night of the night of the 22nd and morning of the 23rd. These meteors can sometimes produce bright dust trails that last for several seconds.  The first quarter moon will set shortly after midnight\\n, leaving dark skies for the what could be a good show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Lyra\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20180429",
          "DTEND;VALUE=DATE": "20180430",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "mercuryatgreatestwesternelongation_2018042920180430@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 27 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20180430",
          "DTEND;VALUE=DATE": "20180501",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "fullmoon_2018043020180501@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 00:58 UTC. This full moon was known by early Native American tribes as the Full Pink Moon because it marked the appearance of the moss pink\\n, or wild ground phlox\\n, which is one of the first spring flowers. This moon has also been known as the Sprouting Grass Moon\\n, the Growing Moon\\n, and the Egg Moon. Many coastal tribes called it the Full Fish Moon because this was the time that the shad swam upstream to spawn."
        },
        {
          "SUMMARY": "Eta Aquarids",
          "DTSTART;VALUE=DATE": "20180506",
          "DTEND;VALUE=DATE": "20180508",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "etaaquarids_2018050620180508@seasky.org",
          "DESCRIPTION": "The Eta Aquarids is an above average shower\\n, capable of producing up to 60 meteors per hour at its peak. Most of the activity is seen in the Southern Hemisphere. In the Northern Hemisphere\\n, the rate can reach about 30 meteors per hour. It is produced by dust particles left behind by comet Halley\\n, which has known and observed since ancient times. The shower runs annually from April 19 to May 28. It peaks this year on the night of May 6 and the morning of the May 7. The waning gibbous moon will block most of the fainter meteors this year\\n, but you should be able to catch quite A few good ones if you are patient. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Aquarius\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Jupiter at Opposition",
          "DTSTART;VALUE=DATE": "20180509",
          "DTEND;VALUE=DATE": "20180510",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "jupiteratopposition_2018050920180510@seasky.org",
          "DESCRIPTION": "The giant planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Jupiter and its moons. A medium-sized telescope should be able to show you some of the details in Jupiter's cloud bands. A good pair of binoculars should allow you to see Jupiter's four largest moons\\n, appearing as bright dots on either side of the planet."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20180515",
          "DTEND;VALUE=DATE": "20180516",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "newmoon_2018051520180516@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 11:48 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20180529",
          "DTEND;VALUE=DATE": "20180530",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "fullmoon_2018052920180530@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 14:19 UTC. This full moon was known by early Native American tribes as the Full Flower Moon because this was the time of year when spring flowers appeared in abundance. This moon has also been known as the Full Corn Planting Moon and the Milk Moon."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20180613",
          "DTEND;VALUE=DATE": "20180614",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "newmoon_2018061320180614@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 19:44 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "June Solstice",
          "DTSTART;VALUE=DATE": "20180621",
          "DTEND;VALUE=DATE": "20180622",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "junesolstice_2018062120180622@seasky.org",
          "DESCRIPTION": "The June solstice occurs at 10:07 UTC. The North Pole of the earth will be tilted toward the Sun\\n, which will have reached its northernmost position in the sky and will be directly over the Tropic of Cancer at 23.44 degrees north latitude. This is the first day of summer (summer solstice) in the Northern Hemisphere and the first day of winter (winter solstice) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Saturn at Opposition",
          "DTSTART;VALUE=DATE": "20180627",
          "DTEND;VALUE=DATE": "20180628",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "saturnatopposition_2018062720180628@seasky.org",
          "DESCRIPTION": "The ringed planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Saturn and its moons. A medium-sized or larger telescope will allow you to see Saturn's rings and a few of its brightest moons."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20180628",
          "DTEND;VALUE=DATE": "20180629",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "fullmoon_2018062820180629@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 04:53 UTC. This full moon was known by early Native American tribes as the Full Strawberry Moon because it signaled the time of year to gather ripening fruit. It also coincides with the peak of the strawberry harvesting season. This moon has also been known as the Full Rose Moon and the Full Honey Moon."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20180712",
          "DTEND;VALUE=DATE": "20180713",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "mercuryatgreatesteasternelongation_2018071220180713@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 26.4 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20180713",
          "DTEND;VALUE=DATE": "20180714",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "newmoon_2018071320180714@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 02:48 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Partial Solar Eclipse",
          "DTSTART;VALUE=DATE": "20180713",
          "DTEND;VALUE=DATE": "20180714",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "partialsolareclipse_2018071320180714@seasky.org",
          "DESCRIPTION": "A partial solar eclipse occurs when the Moon covers only a part of the Sun\\n, sometimes resembling a bite taken out of a cookie. A partial solar eclipse can only be safely observed with a special solar filter or by looking at the Sun's reflection. This partial eclipse will only be visible in extreme southern Australia and Antarctica. ()"
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20180727",
          "DTEND;VALUE=DATE": "20180728",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "fullmoon_2018072720180728@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 20:22 UTC. This full moon was known by early Native American tribes as the Full Buck Moon because the male buck deer would begin to grow their new antlers at this time of year. This moon has also been known as the Full Thunder Moon and the Full Hay Moon."
        },
        {
          "SUMMARY": "Total Lunar Eclipse",
          "DTSTART;VALUE=DATE": "20180727",
          "DTEND;VALUE=DATE": "20180728",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "totallunareclipse_2018072720180728@seasky.org",
          "DESCRIPTION": "A total lunar eclipse occurs when the Moon passes completely through the Earth's dark shadow\\n, or umbra. During this type of eclipse\\n, the Moon will gradually get darker and then take on a rusty or blood red color. The eclipse will be visible throughout most of Europe\\n, Africa\\n, western and central Asia\\n, the Indian Ocean\\n, and Western Australia. ()"
        },
        {
          "SUMMARY": "Mars at Opposition",
          "DTSTART;VALUE=DATE": "20180727",
          "DTEND;VALUE=DATE": "20180728",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "marsatopposition_2018072720180728@seasky.org",
          "DESCRIPTION": "The red planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Mars. A medium-sized telescope will allow you to see some of the dark details on the planet's orange surface."
        },
        {
          "SUMMARY": "Delta Aquarids Meteor Shower",
          "DTSTART;VALUE=DATE": "20180728",
          "DTEND;VALUE=DATE": "20180730",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "deltaaquaridsmeteorshower_2018072820180730@seasky.org",
          "DESCRIPTION": "The Delta Aquarids is an average shower that can produce up to 20 meteors per hour at its peak. It is produced by debris left behind by comets Marsden and Kracht. The shower runs annually from July 12 to August 23. It peaks this year on the night of July 28 and morning of July 29. The nearly full moon will be a problem this year\\n, blocking out all but the brightest meteors. But if you are patient\\n, you should still be able to catch a few good ones. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Aquarius\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20180811",
          "DTEND;VALUE=DATE": "20180812",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "newmoon_2018081120180812@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 09:58 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Partial Solar Eclipse",
          "DTSTART;VALUE=DATE": "20180811",
          "DTEND;VALUE=DATE": "20180812",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "partialsolareclipse_2018081120180812@seasky.org",
          "DESCRIPTION": "A partial solar eclipse occurs when the Moon covers only a part of the Sun\\n, sometimes resembling a bite taken out of a cookie. A partial solar eclipse can only be safely observed with a special solar filter or by looking at the Sun's reflection. The partial eclipse will be visible in parts of northeast Canada\\n, Greenland\\n, extreme northern Europe\\n, and northern and eastern Asia. It will be best seen in northern Russia with 68% coverage. ()"
        },
        {
          "SUMMARY": "Perseids Meteor Shower",
          "DTSTART;VALUE=DATE": "20180812",
          "DTEND;VALUE=DATE": "20180814",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "perseidsmeteorshower_2018081220180814@seasky.org",
          "DESCRIPTION": "The Perseids is one of the best meteor showers to observe\\n, producing up to 60 meteors per hour at its peak. It is produced by comet Swift-Tuttle\\n, which was discovered in 1862. The Perseids are famous for producing a large number of bright meteors. The shower runs annually from July 17 to August 24. It peaks this year on the night of August 12 and the morning of August 13. The thin crescent moon will set early in the evening leaving dark skies for what should be an excellent show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Perseus\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Venus at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20180817",
          "DTEND;VALUE=DATE": "20180818",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "venusatgreatesteasternelongation_2018081720180818@seasky.org",
          "DESCRIPTION": "The planet Venus reaches greatest eastern elongation of 45.9 degrees from the Sun. This is the best time to view Venus since it will be at its highest point above the horizon in the evening sky. Look for the bright planet in the western sky after sunset."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20180826",
          "DTEND;VALUE=DATE": "20180827",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "fullmoon_2018082620180827@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 11:57 UTC. This full moon was known by early Native American tribes as the Full Sturgeon Moon because the large sturgeon fish of the Great Lakes and other major lakes were more easily caught at this time of year. This moon has also been known as the Green Corn Moon and the Grain Moon."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20180826",
          "DTEND;VALUE=DATE": "20180827",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "mercuryatgreatestwesternelongation_2018082620180827@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 18.3 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "Neptune at Opposition",
          "DTSTART;VALUE=DATE": "20180907",
          "DTEND;VALUE=DATE": "20180908",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "neptuneatopposition_2018090720180908@seasky.org",
          "DESCRIPTION": "The blue giant planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Neptune. Due to its extreme distance from Earth\\n, it will only appear as a tiny blue dot in all but the most powerful telescopes."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20180909",
          "DTEND;VALUE=DATE": "20180910",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "newmoon_2018090920180910@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 18:01 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "September Equinox",
          "DTSTART;VALUE=DATE": "20180923",
          "DTEND;VALUE=DATE": "20180924",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "septemberequinox_2018092320180924@seasky.org",
          "DESCRIPTION": "The September equinox occurs at 01:54 UTC. The Sun will shine directly on the equator and there will be nearly equal amounts of day and night throughout the world. This is also the first day of fall (autumnal equinox) in the Northern Hemisphere and the first day of spring (vernal equinox) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20180925",
          "DTEND;VALUE=DATE": "20180926",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "fullmoon_2018092520180926@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 02:53 UTC. This full moon was known by early Native American tribes as the Full Corn Moon because the corn is harvested around this time of year. This moon is also known as the Harvest Moon. The Harvest Moon is the full moon that occurs closest to the September equinox each year."
        },
        {
          "SUMMARY": "Draconids Meteor Shower",
          "DTSTART;VALUE=DATE": "20181008",
          "DTEND;VALUE=DATE": "20181009",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "draconidsmeteorshower_2018100820181009@seasky.org",
          "DESCRIPTION": "The Draconids is a minor meteor shower producing only about 10 meteors per hour. It is produced by dust grains left behind by comet 21P Giacobini-Zinner\\n, which was first discovered in 1900. The Draconids is an unusual shower in that the best viewing is in the early evening instead of early morning like most other showers. The shower runs annually from October 6-10 and peaks this year on the the night of the 8th. This will be an excellent year to observe the Draconids because there will be no moonlight to spoil the show. Best viewing will be in the early evening from a dark location far away from city lights. Meteors will radiate from the constellation Draco\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20181009",
          "DTEND;VALUE=DATE": "20181010",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "newmoon_2018100920181010@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 03:47 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Orionids Meteor Shower",
          "DTSTART;VALUE=DATE": "20181021",
          "DTEND;VALUE=DATE": "20181023",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "orionidsmeteorshower_2018102120181023@seasky.org",
          "DESCRIPTION": "The Orionids is an average shower producing up to 20 meteors per hour at its peak. It is produced by dust grains left behind by comet Halley\\n, which has been known and observed since ancient times. The shower runs annually from October 2 to November 7. It peaks this year on the night of October 21 and the morning of October 22. The nearly full moon will block some of the fainter meteors this year\\n, but the Orionids tend to be fairly bright so it could still be a good show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Orion\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Uranus at Opposition",
          "DTSTART;VALUE=DATE": "20181023",
          "DTEND;VALUE=DATE": "20181024",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "uranusatopposition_2018102320181024@seasky.org",
          "DESCRIPTION": "The blue-green planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view Uranus. Due to its distance\\n, it will only appear as a tiny blue-green dot in all but the most powerful telescopes."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20181024",
          "DTEND;VALUE=DATE": "20181025",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "fullmoon_2018102420181025@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 16:46 UTC. This full moon was known by early Native American tribes as the Full Hunters Moon because at this time of year the leaves are falling and the game is fat and ready to hunt. This moon has also been known as the Travel Moon and the Blood Moon."
        },
        {
          "SUMMARY": "Taurids Meteor Shower",
          "DTSTART;VALUE=DATE": "20181105",
          "DTEND;VALUE=DATE": "20181107",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "tauridsmeteorshower_2018110520181107@seasky.org",
          "DESCRIPTION": "The Taurids is a long-running minor meteor shower producing only about 5-10 meteors per hour. It is unusual in that it consists of two separate streams. The first is produced by dust grains left behind by Asteroid 2004 TG10. The second stream is produced by debris left behind by Comet 2P Encke. The shower runs annually from September 7 to December 10. It peaks this year on the the night of November 5. The thin crescent moon will set early in the evening leaving dark skies for viewing. Best viewing will be just after midnight from a dark location far away from city lights. Meteors will radiate from the constellation Taurus\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20181106",
          "DTEND;VALUE=DATE": "20181107",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "mercuryatgreatesteasternelongation_2018110620181107@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of  23.3 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20181107",
          "DTEND;VALUE=DATE": "20181108",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "newmoon_2018110720181108@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 16:02 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Leonids Meteor Shower",
          "DTSTART;VALUE=DATE": "20181117",
          "DTEND;VALUE=DATE": "20181119",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "leonidsmeteorshower_2018111720181119@seasky.org",
          "DESCRIPTION": "The Leonids is an average shower\\n, producing up to 15 meteors per hour at its peak. This shower is unique in that it has a cyclonic peak about every 33 years where hundreds of meteors per hour can be seen. That last of these occurred in 2001. The Leonids is produced by dust grains left behind by comet Tempel-Tuttle\\n, which was discovered in 1865. The shower runs annually from November 6-30. It peaks this year on the night of the 17th and morning of the 18th. The waxing gibbous moon will set shortly after midnight leaving fairly dark skies for what could be a good early morning show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Leo\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20181123",
          "DTEND;VALUE=DATE": "20181124",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "fullmoon_2018112320181124@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 05:40 UTC. This full moon was known by early Native American tribes as the Full Beaver Moon because this was the time of year to set the beaver traps before the swamps and rivers froze. It has also been known as the Frosty Moon and the Hunter's Moon."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20181207",
          "DTEND;VALUE=DATE": "20181208",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "newmoon_2018120720181208@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 07:20 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Geminids Meteor Shower",
          "DTSTART;VALUE=DATE": "20181213",
          "DTEND;VALUE=DATE": "20181215",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "geminidsmeteorshower_2018121320181215@seasky.org",
          "DESCRIPTION": "The Geminids is the  king of the meteor showers. It is considered by many to be the best shower in the heavens\\n, producing up to 120 multicolored meteors per hour at its peak. It is produced by debris left behind by an asteroid known as 3200 Phaethon\\n, which was discovered in 1982. The shower runs annually from December 7-17. It peaks this year on the night of the 13th and morning of the 14th. The first quarter moon will set shortly after midnight leaving dark skies for what should be an excellent early morning show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Gemini\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20181215",
          "DTEND;VALUE=DATE": "20181216",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "mercuryatgreatestwesternelongation_2018121520181216@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 21.3 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "December Solstice",
          "DTSTART;VALUE=DATE": "20181221",
          "DTEND;VALUE=DATE": "20181222",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "decembersolstice_2018122120181222@seasky.org",
          "DESCRIPTION": "The December solstice occurs at 22:23 UTC. The South Pole of the earth will be tilted toward the Sun\\n, which will have reached its southernmost position in the sky and will be directly over the Tropic of Capricorn at 23.44 degrees south latitude. This is the first day of winter (winter solstice) in the Northern Hemisphere and the first day of summer (summer solstice) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20181222",
          "DTEND;VALUE=DATE": "20181223",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "fullmoon_2018122220181223@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 17:49 UTC. This full moon was known by early Native American tribes as the Full Cold Moon because this is the time of year when the cold winter air settles in and the nights become long and dark. This moon has also been known as the Full Long Nights Moon and the Moon Before Yule.\\nn"
        },
        {
          "SUMMARY": "Ursids Meteor Shower",
          "DTSTART;VALUE=DATE": "20181221",
          "DTEND;VALUE=DATE": "20181223",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194721Z",
          "UID": "ursidsmeteorshower_2018122120181223@seasky.org",
          "DESCRIPTION": "The Ursids is a minor meteor shower producing about 5-10 meteors per hour. It is produced by dust grains left behind by comet Tuttle\\n, which was first discovered in 1790. The shower runs annually from December 17-25. It peaks this year on the the night of the 21st and morning of the 22nd. This year the glare from the full moon will  hide all but the brightest meteors. If you are extremely patient\\n, you might still be able to catch a few good ones. Best viewing will be just after midnight from a dark location far away from city lights. Meteors will radiate from the constellation Ursa Minor\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Quadrantids Meteor Shower",
          "DTSTART;VALUE=DATE": "20190103",
          "DTEND;VALUE=DATE": "20190105",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "quadrantidsmeteorshower_2019010320190105@seasky.org",
          "DESCRIPTION": "The Quadrantids is an above average shower\\n, with up to 40 meteors per hour at its peak. It is thought to be produced by dust grains left behind by an extinct comet known as 2003 EH1\\n, which was discovered in 2003. The shower runs annually from January 1-5. It peaks this year on the night of the 3rd and  morning of the 4th.  The moon will be a thin crescent and should not interfere with what could be a good show this year. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Bootes\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20190106",
          "DTEND;VALUE=DATE": "20190107",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "newmoon_2019010620190107@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 01:28 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Venus at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20190106",
          "DTEND;VALUE=DATE": "20190107",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "venusatgreatestwesternelongation_2019010620190107@seasky.org",
          "DESCRIPTION": "The planet Venus reaches greatest eastern elongation of 47 degrees from the Sun. This is the best time to view Venus since it will be at its highest point above the horizon in the morning sky. Look for the bright planet in the eastern sky before sunrise."
        },
        {
          "SUMMARY": "Partial Solar Eclipse",
          "DTSTART;VALUE=DATE": "20190106",
          "DTEND;VALUE=DATE": "20190107",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "partialsolareclipse_2019010620190107@seasky.org",
          "DESCRIPTION": "A partial solar eclipse occurs when the Moon covers only a part of the Sun\\n, sometimes resembling a bite taken out of a cookie. A partial solar eclipse can only be safely observed with a special solar filter or by looking at the Sun's reflection. The partial eclipse will be visible in parts of eastern Asia and the northern Pacific Ocean. It will be best seen from northeastern Russia with 62% coverage.\\nn        ()"
        },
        {
          "SUMMARY": "Full Moon\\n, Supermoon",
          "DTSTART;VALUE=DATE": "20190121",
          "DTEND;VALUE=DATE": "20190122",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "fullmoon\\n,supermoon_2019012120190122@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 05:16 UTC. This full moon was known by early Native American tribes as the Full Wolf Moon because this was the time of year when hungry wolf packs howled outside their camps. This moon has also been know as the Old Moon and the Moon After Yule. This is also the first of three supermoons for 2019. The Moon will be at its closest approach to the Earth and may look slightly larger and brighter than usual."
        },
        {
          "SUMMARY": "Conjunction of Venus and Jupiter",
          "DTSTART;VALUE=DATE": "20190122",
          "DTEND;VALUE=DATE": "20190123",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "conjunctionofvenusandjupiter_2019012220190123@seasky.org",
          "DESCRIPTION": "A conjunction of Venus and Jupiter will be visible on January 22. The two bright planets will be visible within 2.4 degrees of each other in the early morning sky. Look for this impressive sight in the east just before sunrise."
        },
        {
          "SUMMARY": "Total Lunar Eclipse",
          "DTSTART;VALUE=DATE": "20190121",
          "DTEND;VALUE=DATE": "20190122",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "totallunareclipse_2019012120190122@seasky.org",
          "DESCRIPTION": "A total lunar eclipse occurs when the Moon passes completely through the Earth's dark shadow\\n, or umbra. During this type of eclipse\\n, the Moon will gradually get darker and then take on a rusty or blood red color. The eclipse will be visible throughout most of North America\\n, South America\\n, the eastern Pacific Ocean\\n, western Atlantic Ocean\\n, extreme western Europe\\n, and extreme western Africa.\\nn        ()"
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20190204",
          "DTEND;VALUE=DATE": "20190205",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "newmoon_2019020420190205@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 21:03 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Full Moon\\n, Supermoon",
          "DTSTART;VALUE=DATE": "20190219",
          "DTEND;VALUE=DATE": "20190220",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "fullmoon\\n,supermoon_2019021920190220@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 15:53 UTC. This full moon was known by early Native American tribes as the Full Snow Moon because the heaviest snows usually fell during this time of the year. Since hunting is difficult\\n, this moon has also been known by some tribes as the Full Hunger Moon\\n, since the harsh weather made hunting difficult. This is also the second of three supermoons for 2019. The Moon will be at its closest approach to the Earth and may look slightly larger and brighter than usual."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20190227",
          "DTEND;VALUE=DATE": "20190228",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "mercuryatgreatesteasternelongation_2019022720190228@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 18.1 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20190306",
          "DTEND;VALUE=DATE": "20190307",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "newmoon_2019030620190307@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 16:04 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "March Equinox",
          "DTSTART;VALUE=DATE": "20190320",
          "DTEND;VALUE=DATE": "20190321",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "marchequinox_2019032020190321@seasky.org",
          "DESCRIPTION": "The March equinox occurs at 21:58 UTC. The Sun will shine directly on the equator and there will be nearly equal amounts of day and night throughout the world. This is also the first day of spring (vernal equinox) in the Northern Hemisphere and the first day of fall (autumnal equinox) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Full Moon\\n, Supermoon",
          "DTSTART;VALUE=DATE": "20190321",
          "DTEND;VALUE=DATE": "20190322",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "fullmoon\\n,supermoon_2019032120190322@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 01:43 UTC. This full moon was known by early Native American tribes as the Full Worm Moon because this was the time of year when the ground would begin to soften and the earthworms would reappear. This moon has also been known as the Full Crow Moon\\n, the Full Crust Moon\\n, the Full Sap Moon\\n, and the Lenten Moon. This is also the last of three supermoons for 2019. The Moon will be at its closest approach to the Earth and may look slightly larger and brighter than usual."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20190405",
          "DTEND;VALUE=DATE": "20190406",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "newmoon_2019040520190406@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 08:51 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20190411",
          "DTEND;VALUE=DATE": "20190412",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "mercuryatgreatestwesternelongation_2019041120190412@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 27.7 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20190419",
          "DTEND;VALUE=DATE": "20190420",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "fullmoon_2019041920190420@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 11:12 UTC. This full moon was known by early Native American tribes as the Full Pink Moon because it marked the appearance of the moss pink\\n, or wild ground phlox\\n, which is one of the first spring flowers. This moon has also been known as the Sprouting Grass Moon\\n, the Growing Moon\\n, and the Egg Moon. Many coastal tribes called it the Full Fish Moon because this was the time that the shad swam upstream to spawn."
        },
        {
          "SUMMARY": "Lyrids Meteor Shower",
          "DTSTART;VALUE=DATE": "20190422",
          "DTEND;VALUE=DATE": "20190424",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "lyridsmeteorshower_2019042220190424@seasky.org",
          "DESCRIPTION": "The Lyrids is an average shower\\n, usually producing about 20 meteors per hour at its peak. It is produced by dust particles left behind by comet C/1861 G1 Thatcher\\n, which was discovered in 1861. The shower runs annually from April 16-25. It peaks this year on the night of the night of the 22nd and morning of the 23rd. These meteors can sometimes produce bright dust trails that last for several seconds.  The waning gibbous moon will block out many of the fainter meteors this year\\n, but if you are patient you should still be able to catch a few of the brightest ones. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Lyra\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20190504",
          "DTEND;VALUE=DATE": "20190505",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "newmoon_2019050420190505@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 22:46 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Eta Aquarids Meteor Shower",
          "DTSTART;VALUE=DATE": "20190506",
          "DTEND;VALUE=DATE": "20190508",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "etaaquaridsmeteorshower_2019050620190508@seasky.org",
          "DESCRIPTION": "The Eta Aquarids is an above average shower\\n, capable of producing up to 60 meteors per hour at its peak. Most of the activity is seen in the Southern Hemisphere. In the Northern Hemisphere\\n, the rate can reach about 30 meteors per hour. It is produced by dust particles left behind by comet Halley\\n, which has known and observed since ancient times. The shower runs annually from April 19 to May 28. It peaks this year on the night of May 6 and the morning of the May 7. The thin crescent moon will set early in the evening leaving dark skies for what should be a good show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Aquarius\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon\\n, Blue Moon",
          "DTSTART;VALUE=DATE": "20190518",
          "DTEND;VALUE=DATE": "20190519",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "fullmoon\\n,bluemoon_2019051820190519@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 21:11 UTC. This full moon was known by early Native American tribes as the Full Flower Moon because this was the time of year when spring flowers appeared in abundance. This moon has also been known as the Full Corn Planting Moon and the Milk Moon. Since this is the third of four full moons in this season\\n, it is known as a blue moon. This rare calendar event only happens once every few years\\n, giving rise to the term\\n, “once in a blue moon.” There are normally only three full moons in each season of the year. But since full moons occur every 29.53 days\\n, occasionally a season will contain 4 full moons. The extra full moon of the season is known as a blue moon. Blue moons occur on average once every 2.7 years."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20190603",
          "DTEND;VALUE=DATE": "20190604",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "newmoon_2019060320190604@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 10:02 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Jupiter at Opposition",
          "DTSTART;VALUE=DATE": "20190610",
          "DTEND;VALUE=DATE": "20190611",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "jupiteratopposition_2019061020190611@seasky.org",
          "DESCRIPTION": "The giant planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Jupiter and its moons. A medium-sized telescope should be able to show you some of the details in Jupiter's cloud bands. A good pair of binoculars should allow you to see Jupiter's four largest moons\\n, appearing as bright dots on either side of the planet."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20190617",
          "DTEND;VALUE=DATE": "20190618",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "fullmoon_2019061720190618@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 08:31 UTC. This full moon was known by early Native American tribes as the Full Strawberry Moon because it signaled the time of year to gather ripening fruit. It also coincides with the peak of the strawberry harvesting season. This moon has also been known as the Full Rose Moon and the Full Honey Moon."
        },
        {
          "SUMMARY": "June Solstice",
          "DTSTART;VALUE=DATE": "20190621",
          "DTEND;VALUE=DATE": "20190622",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "junesolstice_2019062120190622@seasky.org",
          "DESCRIPTION": "The June solstice occurs at 15:54 UTC. The North Pole of the earth will be tilted toward the Sun\\n, which will have reached its northernmost position in the sky and will be directly over the Tropic of Cancer at 23.44 degrees north latitude. This is the first day of summer (summer solstice) in the Northern Hemisphere and the first day of winter (winter solstice) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20190623",
          "DTEND;VALUE=DATE": "20190624",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "mercuryatgreatesteasternelongation_2019062320190624@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 25.2 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20190702",
          "DTEND;VALUE=DATE": "20190703",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "newmoon_2019070220190703@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 19:16 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Total Solar Eclipse",
          "DTSTART;VALUE=DATE": "20190702",
          "DTEND;VALUE=DATE": "20190703",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "totalsolareclipse_2019070220190703@seasky.org",
          "DESCRIPTION": "A total solar eclipse occurs when the moon completely blocks the Sun\\n, revealing the Sun's beautiful outer atmosphere known as the corona. The path of totality will only be visible in parts of the southern pacific Ocean\\n, central Chile\\n, and central Argentina. A partial eclipse will be visible in most parts of the southern Pacific Ocean and western South America. ()\\nn        ()"
        },
        {
          "SUMMARY": "Saturn at Opposition",
          "DTSTART;VALUE=DATE": "20190709",
          "DTEND;VALUE=DATE": "20190710",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "saturnatopposition_2019070920190710@seasky.org",
          "DESCRIPTION": "The ringed planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Saturn and its moons. A medium-sized or larger telescope will allow you to see Saturn's rings and a few of its brightest moons."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20190716",
          "DTEND;VALUE=DATE": "20190717",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "fullmoon_2019071620190717@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 21:38 UTC. This full moon was known by early Native American tribes as the Full Buck Moon because the male buck deer would begin to grow their new antlers at this time of year. This moon has also been known as the Full Thunder Moon and the Full Hay Moon."
        },
        {
          "SUMMARY": "Partial Lunar Eclipse",
          "DTSTART;VALUE=DATE": "20190716",
          "DTEND;VALUE=DATE": "20190717",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "partiallunareclipse_2019071620190717@seasky.org",
          "DESCRIPTION": "A partial lunar eclipse occurs when the Moon passes through the Earth's partial shadow\\n, or penumbra\\n, and only a portion of it passes through the darkest shadow\\n, or umbra. During this type of eclipse a part of the Moon will darken as it moves through the Earth's shadow. The eclipse will be visible throughout most of Europe\\n, Africa\\n, central Asia\\n, and the Indian Ocean. ()"
        },
        {
          "SUMMARY": "Delta Aquarids Meteor Shower",
          "DTSTART;VALUE=DATE": "20190728",
          "DTEND;VALUE=DATE": "20190730",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "deltaaquaridsmeteorshower_2019072820190730@seasky.org",
          "DESCRIPTION": "The Delta Aquarids is an average shower that can produce up to 20 meteors per hour at its peak. It is produced by debris left behind by comets Marsden and Kracht. The shower runs annually from July 12 to August 23. It peaks this year on the night of July 28 and morning of July 29. The waning crescent moon will not be too much of a problem this year. The skies should be dark enough for what could be a good show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Aquarius\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20190801",
          "DTEND;VALUE=DATE": "20190802",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "newmoon_2019080120190802@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 03:12 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20190809",
          "DTEND;VALUE=DATE": "20190810",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "mercuryatgreatestwesternelongation_2019080920190810@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 19.0 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "Perseids Meteor Shower",
          "DTSTART;VALUE=DATE": "20190812",
          "DTEND;VALUE=DATE": "20190814",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "perseidsmeteorshower_2019081220190814@seasky.org",
          "DESCRIPTION": "The Perseids is one of the best meteor showers to observe\\n, producing up to 60 meteors per hour at its peak. It is produced by comet Swift-Tuttle\\n, which was discovered in 1862. The Perseids are famous for producing a large number of bright meteors. The shower runs annually from July 17 to August 24. It peaks this year on the night of August 12 and the morning of August 13. The nearly full moon will block out most of the fainter meteors this year\\n, but the Perseids are so bright and numerous that it could still be a good show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Perseus\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20190815",
          "DTEND;VALUE=DATE": "20190816",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "fullmoon_2019081520190816@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 12:30 UTC. This full moon was known by early Native American tribes as the Full Sturgeon Moon because the large sturgeon fish of the Great Lakes and other major lakes were more easily caught at this time of year. This moon has also been known as the Green Corn Moon and the Grain Moon."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20190830",
          "DTEND;VALUE=DATE": "20190831",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "newmoon_2019083020190831@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 10:37 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Neptune at Opposition",
          "DTSTART;VALUE=DATE": "20190909",
          "DTEND;VALUE=DATE": "20190910",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "neptuneatopposition_2019090920190910@seasky.org",
          "DESCRIPTION": "The blue giant planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Neptune. Due to its extreme distance from Earth\\n, it will only appear as a tiny blue dot in all but the most powerful telescopes."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20190914",
          "DTEND;VALUE=DATE": "20190915",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "fullmoon_2019091420190915@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 04:34 UTC. This full moon was known by early Native American tribes as the Full Corn Moon because the corn is harvested around this time of year. This moon is also known as the Harvest Moon. The Harvest Moon is the full moon that occurs closest to the September equinox each year."
        },
        {
          "SUMMARY": "September Equinox",
          "DTSTART;VALUE=DATE": "20190923",
          "DTEND;VALUE=DATE": "20190924",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "septemberequinox_2019092320190924@seasky.org",
          "DESCRIPTION": "The September equinox occurs at 07:50 UTC. The Sun will shine directly on the equator and there will be nearly equal amounts of day and night throughout the world. This is also the first day of fall (autumnal equinox) in the Northern Hemisphere and the first day of spring (vernal equinox) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20190928",
          "DTEND;VALUE=DATE": "20190929",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "newmoon_2019092820190929@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 18:26 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Draconids Meteor Shower",
          "DTSTART;VALUE=DATE": "20191008",
          "DTEND;VALUE=DATE": "20191009",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "draconidsmeteorshower_2019100820191009@seasky.org",
          "DESCRIPTION": "The Draconids is a minor meteor shower producing only about 10 meteors per hour. It is produced by dust grains left behind by comet 21P Giacobini-Zinner\\n, which was first discovered in 1900. The Draconids is an unusual shower in that the best viewing is in the early evening instead of early morning like most other showers. The shower runs annually from October 6-10 and peaks this year on the the night of the 8th. The first quarter moon will set shortly after midnight leaving fairly dark skies for observing. Best viewing will be in the early evening from a dark location far away from city lights. Meteors will radiate from the constellation Draco\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20191013",
          "DTEND;VALUE=DATE": "20191014",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "fullmoon_2019101320191014@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 21:09 UTC. This full moon was known by early Native American tribes as the Full Hunters Moon because at this time of year the leaves are falling and the game is fat and ready to hunt. This moon has also been known as the Travel Moon and the Blood Moon."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20191020",
          "DTEND;VALUE=DATE": "20191021",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "mercuryatgreatesteasternelongation_2019102020191021@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 24.6 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "Orionids Meteor Shower",
          "DTSTART;VALUE=DATE": "20191021",
          "DTEND;VALUE=DATE": "20191023",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "orionidsmeteorshower_2019102120191023@seasky.org",
          "DESCRIPTION": "The Orionids is an average shower producing up to 20 meteors per hour at its peak. It is produced by dust grains left behind by comet Halley\\n, which has been known and observed since ancient times. The shower runs annually from October 2 to November 7. It peaks this year on the night of October 21 and the morning of October 22. The second quarter moon will block some of the fainter meteors this year\\n, but the Orionids tend to be fairly bright so it could still be a good show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Orion\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Uranus at Opposition",
          "DTSTART;VALUE=DATE": "20191027",
          "DTEND;VALUE=DATE": "20191028",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "uranusatopposition_2019102720191028@seasky.org",
          "DESCRIPTION": "The blue-green planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view Uranus. Due to its distance\\n, it will only appear as a tiny blue-green dot in all but the most powerful telescopes."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20191028",
          "DTEND;VALUE=DATE": "20191029",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "newmoon_2019102820191029@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 03:39 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Taurids Meteor Shower",
          "DTSTART;VALUE=DATE": "20191105",
          "DTEND;VALUE=DATE": "20191107",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "tauridsmeteorshower_2019110520191107@seasky.org",
          "DESCRIPTION": "The Taurids is a long-running minor meteor shower producing only about 5-10 meteors per hour. It is unusual in that it consists of two separate streams. The first is produced by dust grains left behind by Asteroid 2004 TG10. The second stream is produced by debris left behind by Comet 2P Encke. The shower runs annually from September 7 to December 10. It peaks this year on the the night of November 5. The first quarter moon will set shortly after midnight leaving dark skies for viewing. Best viewing will be just after midnight from a dark location far away from city lights. Meteors will radiate from the constellation Taurus\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Rare Transit of Mercury Across the Sun",
          "DTSTART;VALUE=DATE": "20191111",
          "DTEND;VALUE=DATE": "20191112",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "raretransitofmercuryacrossthesun_2019111120191112@seasky.org",
          "DESCRIPTION": "The planet Mercury will move directly between the Earth and the Sun. Viewers with telescopes and approved solar filters will be able to observe the dark disk of the planet Mercury moving across the face of the Sun. This is an extremely rare event that occurs only once every few years. The next transit of Mercury will not take place until 2039. This transit will be visible throughout all of South America and Central America\\n, and parts of North America\\n, Mexico\\n, Europe\\n, the Middle East\\n, and Africa. The best place to view this event in its entirety will be the eastern United States\\n, Central America\\n, and South America. ()"
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20191112",
          "DTEND;VALUE=DATE": "20191113",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "fullmoon_2019111220191113@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 13:36 UTC. This full moon was known by early Native American tribes as the Full Beaver Moon because this was the time of year to set the beaver traps before the swamps and rivers froze. It has also been known as the Frosty Moon and the Hunter's Moon."
        },
        {
          "SUMMARY": "Leonids Meteor Shower",
          "DTSTART;VALUE=DATE": "20191117",
          "DTEND;VALUE=DATE": "20191119",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "leonidsmeteorshower_2019111720191119@seasky.org",
          "DESCRIPTION": "The Leonids is an average shower\\n, producing up to 15 meteors per hour at its peak. This shower is unique in that it has a cyclonic peak about every 33 years where hundreds of meteors per hour can be seen. That last of these occurred in 2001. The Leonids is produced by dust grains left behind by comet Tempel-Tuttle\\n, which was discovered in 1865. The shower runs annually from November 6-30. It peaks this year on the night of the 17th and morning of the 18th. The second quarter moon will block many of the fainter meteors this year\\n, but if you are patient you should be able to catch quite a few of the brightest ones. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Leo\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Conjunction of Venus and Jupiter",
          "DTSTART;VALUE=DATE": "20191124",
          "DTEND;VALUE=DATE": "20191125",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "conjunctionofvenusandjupiter_2019112420191125@seasky.org",
          "DESCRIPTION": "A conjunction of Venus and Jupiter will be visible on November 24. The two bright planets will be visible within 1.4 degrees of each other in the evening sky. Look for this impressive sight in the western sky just after sunset."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20191126",
          "DTEND;VALUE=DATE": "20191127",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "newmoon_2019112620191127@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 15:06 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20191128",
          "DTEND;VALUE=DATE": "20191129",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "mercuryatgreatestwesternelongation_2019112820191129@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 20.1 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20191212",
          "DTEND;VALUE=DATE": "20191213",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "fullmoon_2019121220191213@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 05:14 UTC. This full moon was known by early Native American tribes as the Full Cold Moon because this is the time of year when the cold winter air settles in and the nights become long and dark. This moon has also been known as the Full Long Nights Moon and the Moon Before Yule."
        },
        {
          "SUMMARY": "Geminids Meteor Shower",
          "DTSTART;VALUE=DATE": "20191213",
          "DTEND;VALUE=DATE": "20191215",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "geminidsmeteorshower_2019121320191215@seasky.org",
          "DESCRIPTION": "The Geminids is the  king of the meteor showers. It is considered by many to be the best shower in the heavens\\n, producing up to 120 multicolored meteors per hour at its peak. It is produced by debris left behind by an asteroid known as 3200 Phaethon\\n, which was discovered in 1982. The shower runs annually from December 7-17. It peaks this year on the night of the 13th and morning of the 14th. Unfortunately the nearly full moon will block out many of the meteors this year\\n, but the Geminids are so bright and numerous that it could still be a good show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Gemini\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "December Solstice",
          "DTSTART;VALUE=DATE": "20191222",
          "DTEND;VALUE=DATE": "20191223",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "decembersolstice_2019122220191223@seasky.org",
          "DESCRIPTION": "The December solstice occurs at 04:19 UTC. The South Pole of the earth will be tilted toward the Sun\\n, which will have reached its southernmost position in the sky and will be directly over the Tropic of Capricorn at 23.44 degrees south latitude. This is the first day of winter (winter solstice) in the Northern Hemisphere and the first day of summer (summer solstice) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Ursids Meteor Shower",
          "DTSTART;VALUE=DATE": "20191221",
          "DTEND;VALUE=DATE": "20191223",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "ursidsmeteorshower_2019122120191223@seasky.org",
          "DESCRIPTION": "The Ursids is a minor meteor shower producing about 5-10 meteors per hour. It is produced by dust grains left behind by comet Tuttle\\n, which was first discovered in 1790. The shower runs annually from December 17 - 25. It peaks this year on the the night of the 21st and morning of the 22nd. The waning crescent moon should not  interfere too much this year. Skies should still be dark enough for what could be a good show. Best viewing will be just after midnight from a dark location far away from city lights. Meteors will radiate from the constellation Ursa Minor\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20191226",
          "DTEND;VALUE=DATE": "20191227",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "newmoon_2019122620191227@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 05:15 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Annular Solar Eclipse",
          "DTSTART;VALUE=DATE": "20191226",
          "DTEND;VALUE=DATE": "20191227",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194722Z",
          "UID": "annularsolareclipse_2019122620191227@seasky.org",
          "DESCRIPTION": "An annular solar eclipse occurs when the Moon is too far away from the Earth to completely cover the Sun. This results in a ring of light around the darkened Moon. The Sun's corona is not visible during an annular eclipse. The path of of the eclipse will begin in Saudi Arabia and move east through southern India\\n, northern Sri Lanka\\n, parts of the Indian Ocean\\n, and Indonesia before ending in the Pacific Ocean. A partial eclipse will be visible throughout most of Asia and northern Australia.\\nn        () ()"
        },
        {
          "SUMMARY": "Quadrantids Meteor Shower",
          "DTSTART;VALUE=DATE": "20200103",
          "DTEND;VALUE=DATE": "20200105",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "quadrantidsmeteorshower_2020010320200105@seasky.org",
          "DESCRIPTION": "The Quadrantids is an above average shower\\n, with up to 40 meteors per hour at its peak. It is thought to be produced by dust grains left behind by an extinct comet known as 2003 EH1\\n, which was discovered in 2003. The shower runs annually from January 1-5. It peaks this year on the night of the 3rd and  morning of the 4th. The first quarter moon will set shortly after midnight\\n, leaving fairly dark skies for what could be a good show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Bootes\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20200110",
          "DTEND;VALUE=DATE": "20200111",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "fullmoon_2020011020200111@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 19:23 UTC. This full moon was known by early Native American tribes as the Full Wolf Moon because this was the time of year when hungry wolf packs howled outside their camps. This moon has also been know as the Old Moon and the Moon After Yule."
        },
        {
          "SUMMARY": "Penumbral Lunar Eclipse",
          "DTSTART;VALUE=DATE": "20200110",
          "DTEND;VALUE=DATE": "20200111",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "penumbrallunareclipse_2020011020200111@seasky.org",
          "DESCRIPTION": "A penumbral lunar eclipse occurs when the Moon passes through the Earth's partial shadow\\n, or penumbra. During this type of eclipse the Moon will darken slightly but not completely. The eclipse will be visible throughout most of Europe\\n, Africa\\n, Asia\\n, the Indian Ocean\\n, and Western Australia. ()"
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20200124",
          "DTEND;VALUE=DATE": "20200125",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "newmoon_2020012420200125@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 21:44 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Full Moon\\n, Supermoon",
          "DTSTART;VALUE=DATE": "20200209",
          "DTEND;VALUE=DATE": "20200210",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "fullmoon\\n,supermoon_2020020920200210@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 07:34 UTC. This full moon was known by early Native American tribes as the Full Snow Moon because the heaviest snows usually fell during this time of the year. Since hunting is difficult\\n, this moon has also been known by some tribes as the Full Hunger Moon\\n, since the harsh weather made hunting difficult. This is also the first of four supermoons for 2020. The Moon will be at its closest approach to the Earth and may look slightly larger and brighter than usual."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20200210",
          "DTEND;VALUE=DATE": "20200211",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "mercuryatgreatesteasternelongation_2020021020200211@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 18.2 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20200223",
          "DTEND;VALUE=DATE": "20200224",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "newmoon_2020022320200224@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 15:33 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Full Moon\\n, Supermoon",
          "DTSTART;VALUE=DATE": "20200309",
          "DTEND;VALUE=DATE": "20200310",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "fullmoon\\n,supermoon_2020030920200310@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 17:48 UTC. This full moon was known by early Native American tribes as the Full Worm Moon because this was the time of year when the ground would begin to soften and the earthworms would reappear. This moon has also been known as the Full Crow Moon\\n, the Full Crust Moon\\n, the Full Sap Moon\\n, and the Lenten Moon. This is also the second of four supermoons for 2020. The Moon will be at its closest approach to the Earth and may look slightly larger and brighter than usual."
        },
        {
          "SUMMARY": "March Equinox",
          "DTSTART;VALUE=DATE": "20200320",
          "DTEND;VALUE=DATE": "20200321",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "marchequinox_2020032020200321@seasky.org",
          "DESCRIPTION": "The March equinox occurs at 03:50 UTC. The Sun will shine directly on the equator and there will be nearly equal amounts of day and night throughout the world. This is also the first day of spring (vernal equinox) in the Northern Hemisphere and the first day of fall (autumnal equinox) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20200324",
          "DTEND;VALUE=DATE": "20200325",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "newmoon_2020032420200325@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 09:29 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20200324",
          "DTEND;VALUE=DATE": "20200325",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "mercuryatgreatestwesternelongation_2020032420200325@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 27.8 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "Venus at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20200324",
          "DTEND;VALUE=DATE": "20200325",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "venusatgreatesteasternelongation_2020032420200325@seasky.org",
          "DESCRIPTION": "The planet Venus reaches greatest eastern elongation of 46.1 degrees from the Sun. This is the best time to view Venus since it will be at its highest point above the horizon in the evening sky. Look for the bright planet in the western sky after sunset."
        },
        {
          "SUMMARY": "Full Moon\\n, Supermoon",
          "DTSTART;VALUE=DATE": "20200408",
          "DTEND;VALUE=DATE": "20200409",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "fullmoon\\n,supermoon_2020040820200409@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 02:35 UTC. This full moon was known by early Native American tribes as the Full Pink Moon because it marked the appearance of the moss pink\\n, or wild ground phlox\\n, which is one of the first spring flowers. This moon has also been known as the Sprouting Grass Moon\\n, the Growing Moon\\n, and the Egg Moon. Many coastal tribes called it the Full Fish Moon because this was the time that the shad swam upstream to spawn. This is also the third of four supermoons for 2020. The Moon will be at its closest approach to the Earth and may look slightly larger and brighter than usual."
        },
        {
          "SUMMARY": "Lyrids Meteor Shower",
          "DTSTART;VALUE=DATE": "20200422",
          "DTEND;VALUE=DATE": "20200424",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "lyridsmeteorshower_2020042220200424@seasky.org",
          "DESCRIPTION": "The Lyrids is an average shower\\n, usually producing about 20 meteors per hour at its peak. It is produced by dust particles left behind by comet C/1861 G1 Thatcher\\n, which was discovered in 1861. The shower runs annually from April 16-25. It peaks this year on the night of the night of the 22nd and morning of the 23rd. These meteors can sometimes produce bright dust trails that last for several seconds.  The nearly new moon will ensure dark skies for what should be a good show this year. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Lyra\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20200423",
          "DTEND;VALUE=DATE": "20200424",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "newmoon_2020042320200424@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 02:27 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Eta Aquarids Meteor Shower",
          "DTSTART;VALUE=DATE": "20200506",
          "DTEND;VALUE=DATE": "20200508",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "etaaquaridsmeteorshower_2020050620200508@seasky.org",
          "DESCRIPTION": "The Eta Aquarids is an above average shower\\n, capable of producing up to 60 meteors per hour at its peak. Most of the activity is seen in the Southern Hemisphere. In the Northern Hemisphere\\n, the rate can reach about 30 meteors per hour. It is produced by dust particles left behind by comet Halley\\n, which has known and observed since ancient times. The shower runs annually from April 19 to May 28. It peaks this year on the night of May 6 and the morning of the May 7. The nearly full moon will be a problem this year\\n, blocking out all but the brightest meteors. But if you are patient\\n, you should still should be able to catch a few good ones. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Aquarius\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon\\n, Supermoon",
          "DTSTART;VALUE=DATE": "20200507",
          "DTEND;VALUE=DATE": "20200508",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "fullmoon\\n,supermoon_2020050720200508@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 10:45 UTC. This full moon was known by early Native American tribes as the Full Flower Moon because this was the time of year when spring flowers appeared in abundance. This moon has also been known as the Full Corn Planting Moon and the Milk Moon. This is also the last of four supermoons for 2020. The Moon will be at its closest approach to the Earth and may look slightly larger and brighter than usual."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20200522",
          "DTEND;VALUE=DATE": "20200523",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "newmoon_2020052220200523@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 17:39 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20200604",
          "DTEND;VALUE=DATE": "20200605",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "mercuryatgreatesteasternelongation_2020060420200605@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 23.6 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20200605",
          "DTEND;VALUE=DATE": "20200606",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "fullmoon_2020060520200606@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 19:12 UTC. This full moon was known by early Native American tribes as the Full Strawberry Moon because it signaled the time of year to gather ripening fruit. It also coincides with the peak of the strawberry harvesting season. This moon has also been known as the Full Rose Moon and the Full Honey Moon."
        },
        {
          "SUMMARY": "Penumbral Lunar Eclipse",
          "DTSTART;VALUE=DATE": "20200605",
          "DTEND;VALUE=DATE": "20200606",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "penumbrallunareclipse_2020060520200606@seasky.org",
          "DESCRIPTION": "A penumbral lunar eclipse occurs when the Moon passes through the Earth's partial shadow\\n, or penumbra. During this type of eclipse the Moon will darken slightly but not completely. The eclipse will be visible throughout most of Europe\\n, Africa\\n, Asia\\n, Australia\\n, the Indian Ocean\\n, and Australia. \\nn      ()"
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20200621",
          "DTEND;VALUE=DATE": "20200622",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "newmoon_2020062120200622@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 06:42 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Annular Solar Eclipse",
          "DTSTART;VALUE=DATE": "20200621",
          "DTEND;VALUE=DATE": "20200622",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "annularsolareclipse_2020062120200622@seasky.org",
          "DESCRIPTION": "An annular solar eclipse occurs when the Moon is too far away from the Earth to completely cover the Sun. This results in a ring of light around the darkened Moon. The Sun's corona is not visible during an annular eclipse. The path of the eclipse will begin in central Africa and travel through Saudi Arabia\\n, northern India\\n, and southern China before ending in the Pacific Ocean. A partial eclipse will be visible throughout most of eastern Africa\\n, the Middle East\\n, and southern Asia. () ()"
        },
        {
          "SUMMARY": "June Solstice",
          "DTSTART;VALUE=DATE": "20200622",
          "DTEND;VALUE=DATE": "20200623",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "junesolstice_2020062220200623@seasky.org",
          "DESCRIPTION": "The June solstice occurs at 21:44 UTC. The North Pole of the earth will be tilted toward the Sun\\n, which will have reached its northernmost position in the sky and will be directly over the Tropic of Cancer at 23.44 degrees north latitude. This is the first day of summer (summer solstice) in the Northern Hemisphere and the first day of winter (winter solstice) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20200705",
          "DTEND;VALUE=DATE": "20200706",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "fullmoon_2020070520200706@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 04:44 UTC. This full moon was known by early Native American tribes as the Full Buck Moon because the male buck deer would begin to grow their new antlers at this time of year. This moon has also been known as the Full Thunder Moon and the Full Hay Moon."
        },
        {
          "SUMMARY": "Penumbral Lunar Eclipse",
          "DTSTART;VALUE=DATE": "20200705",
          "DTEND;VALUE=DATE": "20200706",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "penumbrallunareclipse_2020070520200706@seasky.org",
          "DESCRIPTION": "A penumbral lunar eclipse occurs when the Moon passes through the Earth's partial shadow\\n, or penumbra. During this type of eclipse the Moon will darken slightly but not completely. The eclipse will be visible throughout most of North America\\n, South America\\n, the eastern Pacific Ocean\\n, the western Atlantic Ocean\\n, and extreme western Africa. ()"
        },
        {
          "SUMMARY": "Jupiter at Opposition",
          "DTSTART;VALUE=DATE": "20200714",
          "DTEND;VALUE=DATE": "20200715",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "jupiteratopposition_2020071420200715@seasky.org",
          "DESCRIPTION": "The giant planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Jupiter and its moons. A medium-sized telescope should be able to show you some of the details in Jupiter's cloud bands. A good pair of binoculars should allow you to see Jupiter's four largest moons\\n, appearing as bright dots on either side of the planet."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20200720",
          "DTEND;VALUE=DATE": "20200721",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "newmoon_2020072020200721@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 17:33 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Saturn at Opposition",
          "DTSTART;VALUE=DATE": "20200720",
          "DTEND;VALUE=DATE": "20200721",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "saturnatopposition_2020072020200721@seasky.org",
          "DESCRIPTION": "The ringed planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Saturn and its moons. A medium-sized or larger telescope will allow you to see Saturn's rings and a few of its brightest moons."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20200722",
          "DTEND;VALUE=DATE": "20200723",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "mercuryatgreatestwesternelongation_2020072220200723@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 20.1 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "Delta Aquarids Meteor Shower",
          "DTSTART;VALUE=DATE": "20200728",
          "DTEND;VALUE=DATE": "20200730",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "deltaaquaridsmeteorshower_2020072820200730@seasky.org",
          "DESCRIPTION": "The Delta Aquarids is an average shower that can produce up to 20 meteors per hour at its peak. It is produced by debris left behind by comets Marsden and Kracht. The shower runs annually from July 12 to August 23. It peaks this year on the night of July 28 and morning of July 29. The second quarter moon will block many of the fainter meteors this year. But if you are patient\\n, you should still be able to catch a few of the brighter ones. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Aquarius\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20200803",
          "DTEND;VALUE=DATE": "20200804",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "fullmoon_2020080320200804@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 15:59 UTC. This full moon was known by early Native American tribes as the Full Sturgeon Moon because the large sturgeon fish of the Great Lakes and other major lakes were more easily caught at this time of year. This moon has also been known as the Green Corn Moon and the Grain Moon."
        },
        {
          "SUMMARY": "Perseids Meteor Shower",
          "DTSTART;VALUE=DATE": "20200812",
          "DTEND;VALUE=DATE": "20200814",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "perseidsmeteorshower_2020081220200814@seasky.org",
          "DESCRIPTION": "The Perseids is one of the best meteor showers to observe\\n, producing up to 60 meteors per hour at its peak. It is produced by comet Swift-Tuttle\\n, which was discovered in 1862. The Perseids are famous for producing a large number of bright meteors. The shower runs annually from July 17 to August 24. It peaks this year on the night of August 12 and the morning of August 13. The second quarter moon will block out some of the fainter meteors this year\\n, but the Perseids are so bright and numerous that it should still be a good show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Perseus\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Venus at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20200813",
          "DTEND;VALUE=DATE": "20200814",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "venusatgreatestwesternelongation_2020081320200814@seasky.org",
          "DESCRIPTION": "The planet Venus reaches greatest eastern elongation of 45.8 degrees from the Sun. This is the best time to view Venus since it will be at its highest point above the horizon in the morning sky. Look for the bright planet in the eastern sky before sunrise."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20200819",
          "DTEND;VALUE=DATE": "20200820",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "newmoon_2020081920200820@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 02:42 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20200902",
          "DTEND;VALUE=DATE": "20200903",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "fullmoon_2020090220200903@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 05:23 UTC. This full moon was known by early Native American tribes as the Full Corn Moon because the corn is harvested around this time of year."
        },
        {
          "SUMMARY": "Neptune at Opposition",
          "DTSTART;VALUE=DATE": "20200911",
          "DTEND;VALUE=DATE": "20200912",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "neptuneatopposition_2020091120200912@seasky.org",
          "DESCRIPTION": "The blue giant planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Neptune. Due to its extreme distance from Earth\\n, it will only appear as a tiny blue dot in all but the most powerful telescopes."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20200917",
          "DTEND;VALUE=DATE": "20200918",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "newmoon_2020091720200918@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 11:00 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "September Equinox",
          "DTSTART;VALUE=DATE": "20200922",
          "DTEND;VALUE=DATE": "20200923",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "septemberequinox_2020092220200923@seasky.org",
          "DESCRIPTION": "The September equinox occurs at 13:31 UTC. The Sun will shine directly on the equator and there will be nearly equal amounts of day and night throughout the world. This is also the first day of fall (autumnal equinox) in the Northern Hemisphere and the first day of spring (vernal equinox) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20201001",
          "DTEND;VALUE=DATE": "20201002",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "fullmoon_2020100120201002@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 21:06 UTC. This full moon was known by early Native American tribes as the Full Hunters Moon because at this time of year the leaves are falling and the game is fat and ready to hunt. This moon has also been known as the Travel Moon and the Blood Moon. This moon is also known as the Harvest Moon. The Harvest Moon is the full moon that occurs closest to the September equinox each year."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20201001",
          "DTEND;VALUE=DATE": "20201002",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "mercuryatgreatesteasternelongation_2020100120201002@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 25.8 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "Draconids Meteor Shower",
          "DTSTART;VALUE=DATE": "20201007",
          "DTEND;VALUE=DATE": "20201008",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "draconidsmeteorshower_2020100720201008@seasky.org",
          "DESCRIPTION": "The Draconids is a minor meteor shower producing only about 10 meteors per hour. It is produced by dust grains left behind by comet 21P Giacobini-Zinner\\n, which was first discovered in 1900. The Draconids is an unusual shower in that the best viewing is in the early evening instead of early morning like most other showers. The shower runs annually from October 6-10 and peaks this year on the the night of the 7th. The second quarter moon will ensure dark skies in the early evening for what should be a good show. Best viewing will be in the early evening from a dark location far away from city lights. Meteors will radiate from the constellation Draco\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Mars at Opposition",
          "DTSTART;VALUE=DATE": "20201013",
          "DTEND;VALUE=DATE": "20201014",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "marsatopposition_2020101320201014@seasky.org",
          "DESCRIPTION": "The red planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Mars. A medium-sized telescope will allow you to see some of the dark details on the planet's orange surface."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20201016",
          "DTEND;VALUE=DATE": "20201017",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "newmoon_2020101620201017@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 19:32 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Orionids Meteor Shower",
          "DTSTART;VALUE=DATE": "20201021",
          "DTEND;VALUE=DATE": "20201023",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "orionidsmeteorshower_2020102120201023@seasky.org",
          "DESCRIPTION": "The Orionids is an average shower producing up to 20 meteors per hour at its peak. It is produced by dust grains left behind by comet Halley\\n, which has been known and observed since ancient times. The shower runs annually from October 2 to November 7. It peaks this year on the night of October 21 and the morning of October 22. The waxing crescent moon will set before midnight leaving dark skies for what should be a good show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Orion\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon\\n, Blue Moon",
          "DTSTART;VALUE=DATE": "20201031",
          "DTEND;VALUE=DATE": "20201101",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "fullmoon\\n,bluemoon_2020103120201101@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 14:51 UTC. Since this is the second full moon in the same month\\n, it is sometimes referred to as a blue moon. This rare calendar event only occurs every few months\\n, giving rise to the term once in a blue moon."
        },
        {
          "SUMMARY": "Uranus at Opposition",
          "DTSTART;VALUE=DATE": "20201031",
          "DTEND;VALUE=DATE": "20201101",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "uranusatopposition_2020103120201101@seasky.org",
          "DESCRIPTION": "The blue-green planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view Uranus. Due to its distance\\n, it will only appear as a tiny blue-green dot in all but the most powerful telescopes."
        },
        {
          "SUMMARY": "Taurids Meteor Shower",
          "DTSTART;VALUE=DATE": "20201104",
          "DTEND;VALUE=DATE": "20201106",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "tauridsmeteorshower_2020110420201106@seasky.org",
          "DESCRIPTION": "The Taurids is a long-running minor meteor shower producing only about 5-10 meteors per hour. It is unusual in that it consists of two separate streams. The first is produced by dust grains left behind by Asteroid 2004 TG10. The second stream is produced by debris left behind by Comet 2P Encke. The shower runs annually from September 7 to December 10. It peaks this year on the the night of November 4. The first quarter moon will block out all but the brightest meteors this year. If you are patient\\n, you may still be able to catch a few good ones. Best viewing will be just after midnight from a dark location far away from city lights. Meteors will radiate from the constellation Taurus\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20201110",
          "DTEND;VALUE=DATE": "20201111",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "mercuryatgreatestwesternelongation_2020111020201111@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 19.1 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20201115",
          "DTEND;VALUE=DATE": "20201116",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "newmoon_2020111520201116@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 05:08 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Leonids Meteor Shower",
          "DTSTART;VALUE=DATE": "20201117",
          "DTEND;VALUE=DATE": "20201119",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "leonidsmeteorshower_2020111720201119@seasky.org",
          "DESCRIPTION": "The Leonids is an average shower\\n, producing up to 15 meteors per hour at its peak. This shower is unique in that it has a cyclonic peak about every 33 years where hundreds of meteors per hour can be seen. That last of these occurred in 2001. The Leonids is produced by dust grains left behind by comet Tempel-Tuttle\\n, which was discovered in 1865. The shower runs annually from November 6-30. It peaks this year on the night of the 17th and morning of the 18th. The crescent moon will set early in the evening leaving dark skies for what should be an excellent show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Leo\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20201130",
          "DTEND;VALUE=DATE": "20201201",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "fullmoon_2020113020201201@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 09:32 UTC. This full moon was known by early Native American tribes as the Full Beaver Moon because this was the time of year to set the beaver traps before the swamps and rivers froze. It has also been known as the Frosty Moon and the Hunter's Moon."
        },
        {
          "SUMMARY": "Penumbral Lunar Eclipse",
          "DTSTART;VALUE=DATE": "20201130",
          "DTEND;VALUE=DATE": "20201201",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "penumbrallunareclipse_2020113020201201@seasky.org",
          "DESCRIPTION": "A penumbral lunar eclipse occurs when the Moon passes through the Earth's partial shadow\\n, or penumbra. During this type of eclipse the Moon will darken slightly but not completely. The eclipse will be visible throughout most of North America\\n, the Pacific Ocean\\n, and northeastern Asia including Japan. ()"
        },
        {
          "SUMMARY": "Geminids Meteor Shower",
          "DTSTART;VALUE=DATE": "20201213",
          "DTEND;VALUE=DATE": "20201215",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "geminidsmeteorshower_2020121320201215@seasky.org",
          "DESCRIPTION": "The Geminids is the  king of the meteor showers. It is considered by many to be the best shower in the heavens\\n, producing up to 120 multicolored meteors per hour at its peak. It is produced by debris left behind by an asteroid known as 3200 Phaethon\\n, which was discovered in 1982. The shower runs annually from December 7-17. It peaks this year on the night of the 13th and morning of the 14th. The morning of the 15th could also be nearly as active this year. The nearly new moon will ensure dark skies for what should be an excellent show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Gemini\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20201214",
          "DTEND;VALUE=DATE": "20201215",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "newmoon_2020121420201215@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 16:18 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Total Solar Eclipse",
          "DTSTART;VALUE=DATE": "20201214",
          "DTEND;VALUE=DATE": "20201215",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "totalsolareclipse_2020121420201215@seasky.org",
          "DESCRIPTION": "A total solar eclipse occurs when the moon completely blocks the Sun\\n, revealing the Sun's beautiful outer atmosphere known as the corona. The path of totality will only be visible in parts of southern Chile and southern Argentina. A partial eclipse will be visible in most parts of southern South America\\n, the southeastern Pacific Ocean and the southern Atlantic Ocean.\\nn        () ()"
        },
        {
          "SUMMARY": "December Solstice",
          "DTSTART;VALUE=DATE": "20201221",
          "DTEND;VALUE=DATE": "20201222",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "decembersolstice_2020122120201222@seasky.org",
          "DESCRIPTION": "The December solstice occurs at 10:02 UTC. The South Pole of the earth will be tilted toward the Sun\\n, which will have reached its southernmost position in the sky and will be directly over the Tropic of Capricorn at 23.44 degrees south latitude. This is the first day of winter (winter solstice) in the Northern Hemisphere and the first day of summer (summer solstice) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Rare Conjunction of Jupiter and Saturn",
          "DTSTART;VALUE=DATE": "20201221",
          "DTEND;VALUE=DATE": "20201222",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "rareconjunctionofjupiterandsaturn_2020122120201222@seasky.org",
          "DESCRIPTION": "A conjunction of Jupiter and Saturn will take place on December 21. This rare conjunction of these two planets is known as a great conjunction. The last great conjunction occurred in the year 2000. The two bright planets will appear only 7 arc minutes of each other in the night sky. They will be so close that they will appear to make a bright double planet. Look to the west just after sunset for this impressive and rare planetary pair."
        },
        {
          "SUMMARY": "Ursids Meteor Shower",
          "DTSTART;VALUE=DATE": "20201221",
          "DTEND;VALUE=DATE": "20201223",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "ursidsmeteorshower_2020122120201223@seasky.org",
          "DESCRIPTION": "The Ursids is a minor meteor shower producing about 5-10 meteors per hour. It is produced by dust grains left behind by comet Tuttle\\n, which was first discovered in 1790. The shower runs annually from December 17-25. It peaks this year on the the night of the 21st and morning of the 22nd. The first quarter moon should set just after midnight leaving dark skies for what could be a good show. Best viewing will be just after midnight from a dark location far away from city lights. Meteors will radiate from the constellation Ursa Minor\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20201230",
          "DTEND;VALUE=DATE": "20201231",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194723Z",
          "UID": "fullmoon_2020123020201231@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 03:30 UTC. This full moon was known by early Native American tribes as the Full Cold Moon because this is the time of year when the cold winter air settles in and the nights become long and dark. This moon has also been known as the Full Long Nights Moon and the Moon Before Yule."
        },
        {
          "SUMMARY": "Quadrantids Meteor Shower",
          "DTSTART;VALUE=DATE": "20210103",
          "DTEND;VALUE=DATE": "20210105",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "quadrantidsmeteorshower_2021010320210105@seasky.org",
          "DESCRIPTION": "The Quadrantids is an above average shower\\n, with up to 40 meteors per hour at its peak. It is thought to be produced by dust grains left behind by an extinct comet known as 2003 EH1\\n, which was discovered in 2003. The shower runs annually from January 1-5. It peaks this year on the night of the 3rd and  morning of the 4th. The waning gibbous  moon will block out most of the faintest meteors this year. But if you are patient\\n, you should still be able to catch a few good ones. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Bootes\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20210113",
          "DTEND;VALUE=DATE": "20210114",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "newmoon_2021011320210114@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 05:02 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20210124",
          "DTEND;VALUE=DATE": "20210125",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "mercuryatgreatesteasternelongation_2021012420210125@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 18.6 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20210128",
          "DTEND;VALUE=DATE": "20210129",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "fullmoon_2021012820210129@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 19:18 UTC. This full moon was known by early Native American tribes as the Full Wolf Moon because this was the time of year when hungry wolf packs howled outside their camps. This moon has also been know as the Old Moon and the Moon After Yule."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20210211",
          "DTEND;VALUE=DATE": "20210212",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "newmoon_2021021120210212@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 19:08 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20210227",
          "DTEND;VALUE=DATE": "20210228",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "fullmoon_2021022720210228@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 08:19 UTC. This full moon was known by early Native American tribes as the Full Snow Moon because the heaviest snows usually fell during this time of the year. Since hunting is difficult\\n, this moon has also been known by some tribes as the Full Hunger Moon\\n, since the harsh weather made hunting difficult."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20210306",
          "DTEND;VALUE=DATE": "20210307",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "mercuryatgreatestwesternelongation_2021030620210307@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 27.3 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20210313",
          "DTEND;VALUE=DATE": "20210314",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "newmoon_2021031320210314@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 10:23 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "March Equinox",
          "DTSTART;VALUE=DATE": "20210320",
          "DTEND;VALUE=DATE": "20210321",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "marchequinox_2021032020210321@seasky.org",
          "DESCRIPTION": "The March equinox occurs at 09:27 UTC. The Sun will shine directly on the equator and there will be nearly equal amounts of day and night throughout the world. This is also the first day of spring (vernal equinox) in the Northern Hemisphere and the first day of fall (autumnal equinox) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Venus at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20210320",
          "DTEND;VALUE=DATE": "20210321",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "venusatgreatestwesternelongation_2021032020210321@seasky.org",
          "DESCRIPTION": "The planet Venus reaches greatest eastern elongation of 46.6 degrees from the Sun. This is the best time to view Venus since it will be at its highest point above the horizon in the morning sky. Look for the bright planet in the eastern sky before sunrise."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20210328",
          "DTEND;VALUE=DATE": "20210329",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "fullmoon_2021032820210329@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 18:49 UTC. This full moon was known by early Native American tribes as the Full Worm Moon because this was the time of year when the ground would begin to soften and the earthworms would reappear. This moon has also been known as the Full Crow Moon\\n, the Full Crust Moon\\n, the Full Sap Moon\\n, and the Lenten Moon.\\nn"
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20210412",
          "DTEND;VALUE=DATE": "20210413",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "newmoon_2021041220210413@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 02:32 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Lyrids Meteor Shower",
          "DTSTART;VALUE=DATE": "20210422",
          "DTEND;VALUE=DATE": "20210424",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "lyridsmeteorshower_2021042220210424@seasky.org",
          "DESCRIPTION": "The Lyrids is an average shower\\n, usually producing about 20 meteors per hour at its peak. It is produced by dust particles left behind by comet C/1861 G1 Thatcher\\n, which was discovered in 1861. The shower runs annually from April 16-25. It peaks this year on the night of the night of the 22nd and morning of the 23rd. These meteors can sometimes produce bright dust trails that last for several seconds.  The nearly full moon will be a problem this year. Its glare will block out all but the brightest meteors. But if you are patient you may still be able to catch a few good ones. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Lyra\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon\\n, Supermoon",
          "DTSTART;VALUE=DATE": "20210427",
          "DTEND;VALUE=DATE": "20210428",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "fullmoon\\n,supermoon_2021042720210428@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 03:33 UTC. This full moon was known by early Native American tribes as the Full Pink Moon because it marked the appearance of the moss pink\\n, or wild ground phlox\\n, which is one of the first spring flowers. This moon has also been known as the Sprouting Grass Moon\\n, the Growing Moon\\n, and the Egg Moon. Many coastal tribes called it the Full Fish Moon because this was the time that the shad swam upstream to spawn. This is also the first of three supermoons for 2021. The Moon will be at its closest approach to the Earth and may look slightly larger and brighter than usual."
        },
        {
          "SUMMARY": "Eta Aquarids Meteor Shower",
          "DTSTART;VALUE=DATE": "20210506",
          "DTEND;VALUE=DATE": "20210508",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "etaaquaridsmeteorshower_2021050620210508@seasky.org",
          "DESCRIPTION": "The Eta Aquarids is an above average shower\\n, capable of producing up to 60 meteors per hour at its peak. Most of the activity is seen in the Southern Hemisphere. In the Northern Hemisphere\\n, the rate can reach about 30 meteors per hour. It is produced by dust particles left behind by comet Halley\\n, which has known and observed since ancient times. The shower runs annually from April 19 to May 28. It peaks this year on the night of May 6 and the morning of the May 7. The second quarter moon will block out some of the faintest meteors this year. But if you are patient\\n, you should still should be able to catch quite a few good ones. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Aquarius\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20210511",
          "DTEND;VALUE=DATE": "20210512",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "newmoon_2021051120210512@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 19:01 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20210517",
          "DTEND;VALUE=DATE": "20210518",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "mercuryatgreatesteasternelongation_2021051720210518@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 22 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "Full Moon\\n, Supermoon",
          "DTSTART;VALUE=DATE": "20210526",
          "DTEND;VALUE=DATE": "20210527",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "fullmoon\\n,supermoon_2021052620210527@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 11:14 UTC. This full moon was known by early Native American tribes as the Full Flower Moon because this was the time of year when spring flowers appeared in abundance. This moon has also been known as the Full Corn Planting Moon and the Milk Moon. This is also the second of three supermoons for 2021. The Moon will be at its closest approach to the Earth and may look slightly larger and brighter than usual."
        },
        {
          "SUMMARY": "Total Lunar Eclipse",
          "DTSTART;VALUE=DATE": "20210526",
          "DTEND;VALUE=DATE": "20210527",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "totallunareclipse_2021052620210527@seasky.org",
          "DESCRIPTION": "A total lunar eclipse occurs when the Moon passes completely through the Earth's dark shadow\\n, or umbra. During this type of eclipse\\n, the Moon will gradually get darker and then take on a rusty or blood red color. The eclipse will be visible throughout the Pacific Ocean and parts of eastern Asia\\n, Japan\\n, Australia\\n, and western North America. ()"
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20210610",
          "DTEND;VALUE=DATE": "20210611",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "newmoon_2021061020210611@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 10:54 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Annular Solar Eclipse",
          "DTSTART;VALUE=DATE": "20210610",
          "DTEND;VALUE=DATE": "20210611",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "annularsolareclipse_2021061020210611@seasky.org",
          "DESCRIPTION": "An annular solar eclipse occurs when the Moon is too far away from the Earth to completely cover the Sun. This results in a ring of light around the darkened Moon. The Sun's corona is not visible during an annular eclipse. The path of this eclipse will be confined to extreme eastern Russia\\n, the Arctic Ocean\\n, western Greenland\\n, and Canada. A partial eclipse will be visible in the northeastern United States\\n, Europe\\n, and most of Russia. () ()"
        },
        {
          "SUMMARY": "June Solstice",
          "DTSTART;VALUE=DATE": "20210621",
          "DTEND;VALUE=DATE": "20210622",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "junesolstice_2021062120210622@seasky.org",
          "DESCRIPTION": "The June solstice occurs at 03:21 UTC. The North Pole of the earth will be tilted toward the Sun\\n, which will have reached its northernmost position in the sky and will be directly over the Tropic of Cancer at 23.44 degrees north latitude. This is the first day of summer (summer solstice) in the Northern Hemisphere and the first day of winter (winter solstice) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Full Moon\\n, Supermoon",
          "DTSTART;VALUE=DATE": "20210624",
          "DTEND;VALUE=DATE": "20210625",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "fullmoon\\n,supermoon_2021062420210625@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 18:40 UTC. This full moon was known by early Native American tribes as the Full Strawberry Moon because it signaled the time of year to gather ripening fruit. It also coincides with the peak of the strawberry harvesting season. This moon has also been known as the Full Rose Moon and the Full Honey Moon. This is also the last of three supermoons for 2021. The Moon will be at its closest approach to the Earth and may look slightly larger and brighter than usual."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20210704",
          "DTEND;VALUE=DATE": "20210705",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "mercuryatgreatestwesternelongation_2021070420210705@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 21.6 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20210710",
          "DTEND;VALUE=DATE": "20210711",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "newmoon_2021071020210711@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 01:17 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20210724",
          "DTEND;VALUE=DATE": "20210725",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "fullmoon_2021072420210725@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 02:37 UTC. This full moon was known by early Native American tribes as the Full Buck Moon because the male buck deer would begin to grow their new antlers at this time of year. This moon has also been known as the Full Thunder Moon and the Full Hay Moon."
        },
        {
          "SUMMARY": "Delta Aquarids Meteor Shower",
          "DTSTART;VALUE=DATE": "20210728",
          "DTEND;VALUE=DATE": "20210730",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "deltaaquaridsmeteorshower_2021072820210730@seasky.org",
          "DESCRIPTION": "The Delta Aquarids is an average shower that can produce up to 20 meteors per hour at its peak. It is produced by debris left behind by comets Marsden and Kracht. The shower runs annually from July 12 to August 23. It peaks this year on the night of July 28 and morning of July 29. The nearly full moon will be a problem this year. It's glare will block block most of the faintest meteors. But if you are patient\\n, you should still be able to catch a few good ones. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Aquarius\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Saturn at Opposition",
          "DTSTART;VALUE=DATE": "20210802",
          "DTEND;VALUE=DATE": "20210803",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "saturnatopposition_2021080220210803@seasky.org",
          "DESCRIPTION": "The ringed planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Saturn and its moons. A medium-sized or larger telescope will allow you to see Saturn's rings and a few of its brightest moons."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20210808",
          "DTEND;VALUE=DATE": "20210809",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "newmoon_2021080820210809@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 13:51 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Perseids Meteor Shower",
          "DTSTART;VALUE=DATE": "20210812",
          "DTEND;VALUE=DATE": "20210814",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "perseidsmeteorshower_2021081220210814@seasky.org",
          "DESCRIPTION": "The Perseids is one of the best meteor showers to observe\\n, producing up to 60 meteors per hour at its peak. It is produced by comet Swift-Tuttle\\n, which was discovered in 1862. The Perseids are famous for producing a large number of bright meteors. The shower runs annually from July 17 to August 24. It peaks this year on the night of August 12 and the morning of August 13. The waxing crescent moon will set early in the evening\\n, leaving dark skies for what should be an excellent show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Perseus\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Jupiter at Opposition",
          "DTSTART;VALUE=DATE": "20210819",
          "DTEND;VALUE=DATE": "20210820",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "jupiteratopposition_2021081920210820@seasky.org",
          "DESCRIPTION": "The giant planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Jupiter and its moons. A medium-sized telescope should be able to show you some of the details in Jupiter's cloud bands. A good pair of binoculars should allow you to see Jupiter's four largest moons\\n, appearing as bright dots on either side of the planet."
        },
        {
          "SUMMARY": "Full Moon\\n, Blue Moon",
          "DTSTART;VALUE=DATE": "20210822",
          "DTEND;VALUE=DATE": "20210823",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "fullmoon\\n,bluemoon_2021082220210823@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 12:02 UTC. This full moon was known by early Native American tribes as the Full Sturgeon Moon because the large sturgeon fish of the Great Lakes and other major lakes were more easily caught at this time of year. This moon has also been known as the Green Corn Moon and the Grain Moon. Since this is the third of four full moons in this season\\n, it is known as a blue moon. This rare calendar event only happens once every few years\\n, giving rise to the term\\n, “once in a blue moon.” There are normally only three full moons in each season of the year. But since full moons occur every 29.53 days\\n, occasionally a season will contain 4 full moons. The extra full moon of the season is known as a blue moon. Blue moons occur on average once every 2.7 years."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20210907",
          "DTEND;VALUE=DATE": "20210908",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "newmoon_2021090720210908@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 00:52 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Neptune at Opposition",
          "DTSTART;VALUE=DATE": "20210914",
          "DTEND;VALUE=DATE": "20210915",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "neptuneatopposition_2021091420210915@seasky.org",
          "DESCRIPTION": "The blue giant planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Neptune. Due to its extreme distance from Earth\\n, it will only appear as a tiny blue dot in all but the most powerful telescopes."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20210914",
          "DTEND;VALUE=DATE": "20210915",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "mercuryatgreatesteasternelongation_2021091420210915@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 26.8 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20210920",
          "DTEND;VALUE=DATE": "20210921",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "fullmoon_2021092020210921@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 23:54 UTC. This full moon was known by early Native American tribes as the Full Corn Moon because the corn is harvested around this time of year. This moon is also known as the Harvest Moon. The Harvest Moon is the full moon that occurs closest to the September equinox each year."
        },
        {
          "SUMMARY": "September Equinox",
          "DTSTART;VALUE=DATE": "20210922",
          "DTEND;VALUE=DATE": "20210923",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "septemberequinox_2021092220210923@seasky.org",
          "DESCRIPTION": "The September equinox occurs at 19:11 UTC. The Sun will shine directly on the equator and there will be nearly equal amounts of day and night throughout the world. This is also the first day of fall (autumnal equinox) in the Northern Hemisphere and the first day of spring (vernal equinox) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20211006",
          "DTEND;VALUE=DATE": "20211007",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "newmoon_2021100620211007@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 11:05 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Draconids Meteor Shower",
          "DTSTART;VALUE=DATE": "20211007",
          "DTEND;VALUE=DATE": "20211008",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "draconidsmeteorshower_2021100720211008@seasky.org",
          "DESCRIPTION": "The Draconids is a minor meteor shower producing only about 10 meteors per hour. It is produced by dust grains left behind by comet 21P Giacobini-Zinner\\n, which was first discovered in 1900. The Draconids is an unusual shower in that the best viewing is in the early evening instead of early morning like most other showers. The shower runs annually from October 6-10 and peaks this year on the the night of the 7th. This year\\n, the nearly new moon will leave dark skies for what should be an excellent show. Best viewing will be in the early evening from a dark location far away from city lights. Meteors will radiate from the constellation Draco\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20211020",
          "DTEND;VALUE=DATE": "20211021",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "fullmoon_2021102020211021@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 14:57 UTC. This full moon was known by early Native American tribes as the Full Hunters Moon because at this time of year the leaves are falling and the game is fat and ready to hunt. This moon has also been known as the Travel Moon and the Blood Moon.\\nn"
        },
        {
          "SUMMARY": "Orionids Meteor Shower",
          "DTSTART;VALUE=DATE": "20211021",
          "DTEND;VALUE=DATE": "20211023",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "orionidsmeteorshower_2021102120211023@seasky.org",
          "DESCRIPTION": "The Orionids is an average shower producing up to 20 meteors per hour at its peak. It is produced by dust grains left behind by comet Halley\\n, which has been known and observed since ancient times. The shower runs annually from October 2 to November 7. It peaks this year on the night of October 21 and the morning of October 22. The full moon will be a problem this year for the Orionids. Its glare will block out all but the brightest meteors. But if you are patient\\n, you should still be able to catch a few good ones. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Orion\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20211025",
          "DTEND;VALUE=DATE": "20211026",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "mercuryatgreatestwesternelongation_2021102520211026@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 18.4 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "Venus at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20211029",
          "DTEND;VALUE=DATE": "20211030",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "venusatgreatesteasternelongation_2021102920211030@seasky.org",
          "DESCRIPTION": "The planet Venus reaches greatest eastern elongation of 47 degrees from the Sun. This is the best time to view Venus since it will be at its highest point above the horizon in the evening sky. Look for the bright planet in the western sky after sunset."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20211104",
          "DTEND;VALUE=DATE": "20211105",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "newmoon_2021110420211105@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 21:15 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Taurids Meteor Shower",
          "DTSTART;VALUE=DATE": "20211104",
          "DTEND;VALUE=DATE": "20211106",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "tauridsmeteorshower_2021110420211106@seasky.org",
          "DESCRIPTION": "The Taurids is a long-running minor meteor shower producing only about 5-10 meteors per hour. It is unusual in that it consists of two separate streams. The first is produced by dust grains left behind by Asteroid 2004 TG10. The second stream is produced by debris left behind by Comet 2P Encke. The shower runs annually from September 7 to December 10. It peaks this year on the the night of November 4. The new moon will leave dark skies this year for what should be an excellent show. Best viewing will be just after midnight from a dark location far away from city lights. Meteors will radiate from the constellation Taurus\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Uranus at Opposition",
          "DTSTART;VALUE=DATE": "20211105",
          "DTEND;VALUE=DATE": "20211106",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "uranusatopposition_2021110520211106@seasky.org",
          "DESCRIPTION": "The blue-green planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view Uranus. Due to its distance\\n, it will only appear as a tiny blue-green dot in all but the most powerful telescopes."
        },
        {
          "SUMMARY": "Leonids Meteor Shower",
          "DTSTART;VALUE=DATE": "20211117",
          "DTEND;VALUE=DATE": "20211119",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "leonidsmeteorshower_2021111720211119@seasky.org",
          "DESCRIPTION": "The Leonids is an average shower\\n, producing up to 15 meteors per hour at its peak. This shower is unique in that it has a cyclonic peak about every 33 years where hundreds of meteors per hour can be seen. That last of these occurred in 2001. The Leonids is produced by dust grains left behind by comet Tempel-Tuttle\\n, which was discovered in 1865. The shower runs annually from November 6-30. It peaks this year on the night of the 17th and morning of the 18th. Unfortunately the nearly full moon will dominate the sky this year\\n, blocking all but the brightest meteors. But if you are patient\\n, you should still be able to catch a few good ones. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Leo\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20211119",
          "DTEND;VALUE=DATE": "20211120",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "fullmoon_2021111920211120@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 08:59 UTC. This full moon was known by early Native American tribes as the Full Beaver Moon because this was the time of year to set the beaver traps before the swamps and rivers froze. It has also been known as the Frosty Moon and the Hunter's Moon."
        },
        {
          "SUMMARY": "Partial Lunar Eclipse",
          "DTSTART;VALUE=DATE": "20211119",
          "DTEND;VALUE=DATE": "20211120",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "partiallunareclipse_2021111920211120@seasky.org",
          "DESCRIPTION": "A partial lunar eclipse occurs when the Moon passes through the Earth's partial shadow\\n, or penumbra\\n, and only a portion of it passes through the darkest shadow\\n, or umbra. During this type of eclipse a part of the Moon will darken as it moves through the Earth's shadow. The eclipse will be visible throughout most of eastern Russia\\n, Japan\\n, the Pacific Ocean\\n, North America\\n, Mexico\\n, Central America\\n, and parts of western South America. ()"
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20211204",
          "DTEND;VALUE=DATE": "20211205",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "newmoon_2021120420211205@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 07:44 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Total Solar Eclipse",
          "DTSTART;VALUE=DATE": "20211204",
          "DTEND;VALUE=DATE": "20211205",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "totalsolareclipse_2021120420211205@seasky.org",
          "DESCRIPTION": "A total solar eclipse occurs when the moon completely blocks the Sun\\n, revealing the Sun's beautiful outer atmosphere known as the corona. The path of totality will for this eclipse will be limited to Antarctica and the southern Atlantic Ocean. A partial eclipse will bee visible throughout much of South Africa. () ()"
        },
        {
          "SUMMARY": "Geminids Meteor Shower",
          "DTSTART;VALUE=DATE": "20211213",
          "DTEND;VALUE=DATE": "20211215",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "geminidsmeteorshower_2021121320211215@seasky.org",
          "DESCRIPTION": "The Geminids is the  king of the meteor showers. It is considered by many to be the best shower in the heavens\\n, producing up to 120 multicolored meteors per hour at its peak. It is produced by debris left behind by an asteroid known as 3200 Phaethon\\n, which was discovered in 1982. The shower runs annually from December 7-17. It peaks this year on the night of the 13th and morning of the 14th. The waxing gibbous moon will block out most of the fainter meteors this year. But the Geminids are so numerous and bright that this could still be a good show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Gemini\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20211219",
          "DTEND;VALUE=DATE": "20211220",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "fullmoon_2021121920211220@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 04:37 UTC. This full moon was known by early Native American tribes as the Full Cold Moon because this is the time of year when the cold winter air settles in and the nights become long and dark. This moon has also been known as the Full Long Nights Moon and the Moon Before Yule."
        },
        {
          "SUMMARY": "December Solstice",
          "DTSTART;VALUE=DATE": "20211221",
          "DTEND;VALUE=DATE": "20211222",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "decembersolstice_2021122120211222@seasky.org",
          "DESCRIPTION": "The December solstice occurs at 15:50 UTC. The South Pole of the earth will be tilted toward the Sun\\n, which will have reached its southernmost position in the sky and will be directly over the Tropic of Capricorn at 23.44 degrees south latitude. This is the first day of winter (winter solstice) in the Northern Hemisphere and the first day of summer (summer solstice) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Ursids Meteor Shower",
          "DTSTART;VALUE=DATE": "20211221",
          "DTEND;VALUE=DATE": "20211223",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194724Z",
          "UID": "ursidsmeteorshower_2021122120211223@seasky.org",
          "DESCRIPTION": "The Ursids is a minor meteor shower producing about 5-10 meteors per hour. It is produced by dust grains left behind by comet Tuttle\\n, which was first discovered in 1790. The shower runs annually from December 17-25. It peaks this year on the the night of the 21st and morning of the 22nd. The nearly full moon will be a problem this year\\n, blocking all but the brightest meteors. But if you are patient enough\\n, you may still be able to catch a few good ones. Best viewing will be just after midnight from a dark location far away from city lights. Meteors will radiate from the constellation Ursa Minor\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20220102",
          "DTEND;VALUE=DATE": "20220103",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "newmoon_2022010220220103@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 18:35 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Quadrantids Meteor Shower",
          "DTSTART;VALUE=DATE": "20220103",
          "DTEND;VALUE=DATE": "20220105",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "quadrantidsmeteorshower_2022010320220105@seasky.org",
          "DESCRIPTION": "The Quadrantids is an above average shower\\n, with up to 40 meteors per hour at its peak. It is thought to be produced by dust grains left behind by an extinct comet known as 2003 EH1\\n, which was discovered in 2003. The shower runs annually from January 1-5. It peaks this year on the night of the 3rd and  morning of the 4th. The thin\\n, crescent moon will set early in the evening leaving dark skies for what should be an excellent show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Bootes\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20220107",
          "DTEND;VALUE=DATE": "20220108",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "mercuryatgreatesteasternelongation_2022010720220108@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 19.2 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20220117",
          "DTEND;VALUE=DATE": "20220118",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "fullmoon_2022011720220118@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 23:51 UTC. This full moon was known by early Native American tribes as the Full Wolf Moon because this was the time of year when hungry wolf packs howled outside their camps. This moon has also been know as the Old Moon and the Moon After Yule."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20220201",
          "DTEND;VALUE=DATE": "20220202",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "newmoon_2022020120220202@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 05:48 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20220216",
          "DTEND;VALUE=DATE": "20220217",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "fullmoon_2022021620220217@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 16:59 UTC. This full moon was known by early Native American tribes as the Full Snow Moon because the heaviest snows usually fell during this time of the year. Since hunting is difficult\\n, this moon has also been known by some tribes as the Full Hunger Moon\\n, since the harsh weather made hunting difficult."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20220216",
          "DTEND;VALUE=DATE": "20220217",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "mercuryatgreatestwesternelongation_2022021620220217@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 26.3 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20220302",
          "DTEND;VALUE=DATE": "20220303",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "newmoon_2022030220220303@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 17:38 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20220318",
          "DTEND;VALUE=DATE": "20220319",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "fullmoon_2022031820220319@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 07:20 UTC. This full moon was known by early Native American tribes as the Full Worm Moon because this was the time of year when the ground would begin to soften and the earthworms would reappear. This moon has also been known as the Full Crow Moon\\n, the Full Crust Moon\\n, the Full Sap Moon\\n, and the Lenten Moon."
        },
        {
          "SUMMARY": "March Equinox",
          "DTSTART;VALUE=DATE": "20220320",
          "DTEND;VALUE=DATE": "20220321",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "marchequinox_2022032020220321@seasky.org",
          "DESCRIPTION": "The March equinox occurs at 15:24 UTC. The Sun will shine directly on the equator and there will be nearly equal amounts of day and night throughout the world. This is also the first day of spring (vernal equinox) in the Northern Hemisphere and the first day of fall (autumnal equinox) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20220401",
          "DTEND;VALUE=DATE": "20220402",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "newmoon_2022040120220402@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 06:27 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20220416",
          "DTEND;VALUE=DATE": "20220417",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "fullmoon_2022041620220417@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 18:57 UTC. This full moon was known by early Native American tribes as the Full Pink Moon because it marked the appearance of the moss pink\\n, or wild ground phlox\\n, which is one of the first spring flowers. This moon has also been known as the Sprouting Grass Moon\\n, the Growing Moon\\n, and the Egg Moon. Many coastal tribes called it the Full Fish Moon because this was the time that the shad swam upstream to spawn."
        },
        {
          "SUMMARY": "Lyrids Meteor Shower",
          "DTSTART;VALUE=DATE": "20220422",
          "DTEND;VALUE=DATE": "20220424",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "lyridsmeteorshower_2022042220220424@seasky.org",
          "DESCRIPTION": "The Lyrids is an average shower\\n, usually producing about 20 meteors per hour at its peak. It is produced by dust particles left behind by comet C/1861 G1 Thatcher\\n, which was discovered in 1861. The shower runs annually from April 16-25. It peaks this year on the night of the night of the 22nd and morning of the 23rd. These meteors can sometimes produce bright dust trails that last for several seconds.  The waning gibbous moon may block some of the fainter meteors this year\\n, but there is still potential for a good show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Lyra\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20220429",
          "DTEND;VALUE=DATE": "20220430",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "mercuryatgreatesteasternelongation_2022042920220430@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 20.6 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20220430",
          "DTEND;VALUE=DATE": "20220501",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "newmoon_2022043020220501@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 20:30 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Partial Solar Eclipse",
          "DTSTART;VALUE=DATE": "20220430",
          "DTEND;VALUE=DATE": "20220501",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "partialsolareclipse_2022043020220501@seasky.org",
          "DESCRIPTION": "A partial solar eclipse occurs when the Moon covers only a part of the Sun\\n, sometimes resembling a bite taken out of a cookie. A partial solar eclipse can only be safely observed with a special solar filter or by looking at the Sun's reflection. This partial eclipse will be visible throughout most of the southeast Pacific Ocean and southern South America. It will be best seen from Argentina with 53% coverage. \\nn        ()"
        },
        {
          "SUMMARY": "Eta Aquarids Meteor Shower",
          "DTSTART;VALUE=DATE": "20220506",
          "DTEND;VALUE=DATE": "20220508",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "etaaquaridsmeteorshower_2022050620220508@seasky.org",
          "DESCRIPTION": "The Eta Aquarids is an above average shower\\n, capable of producing up to 60 meteors per hour at its peak. Most of the activity is seen in the Southern Hemisphere. In the Northern Hemisphere\\n, the rate can reach about 30 meteors per hour. It is produced by dust particles left behind by comet Halley\\n, which has known and observed since ancient times. The shower runs annually from April 19 to May 28. It peaks this year on the night of May 6 and the morning of the May 7. The waxing crescent moon will set early in the evening\\n, leaving dark skies for what should be an excellent show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Aquarius\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20220516",
          "DTEND;VALUE=DATE": "20220517",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "fullmoon_2022051620220517@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at  04:15 UTC. This full moon was known by early Native American tribes as the Full Flower Moon because this was the time of year when spring flowers appeared in abundance. This moon has also been known as the Full Corn Planting Moon and the Milk Moon."
        },
        {
          "SUMMARY": "Total Lunar Eclipse",
          "DTSTART;VALUE=DATE": "20220516",
          "DTEND;VALUE=DATE": "20220517",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "totallunareclipse_2022051620220517@seasky.org",
          "DESCRIPTION": "A total lunar eclipse occurs when the Moon passes completely through the Earth's dark shadow\\n, or umbra. During this type of eclipse\\n, the Moon will gradually get darker and then take on a rusty or blood red color. The eclipse will be visible throughout all of North America\\n, Greenland\\n, the Atlantic Ocean\\n, and parts of western Europe and western Africa. ()"
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20220530",
          "DTEND;VALUE=DATE": "20220531",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "newmoon_2022053020220531@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 11:32 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Full Moon\\n, Supermoon",
          "DTSTART;VALUE=DATE": "20220614",
          "DTEND;VALUE=DATE": "20220615",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "fullmoon\\n,supermoon_2022061420220615@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 11:52 UTC. This full moon was known by early Native American tribes as the Full Strawberry Moon because it signaled the time of year to gather ripening fruit. It also coincides with the peak of the strawberry harvesting season. This moon has also been known as the Full Rose Moon and the Full Honey Moon. This is also the first of three supermoons for 2022. The Moon will be at its closest approach to the Earth and may look slightly larger and brighter than usual."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20220616",
          "DTEND;VALUE=DATE": "20220617",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "mercuryatgreatestwesternelongation_2022061620220617@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 23.2 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "June Solstice",
          "DTSTART;VALUE=DATE": "20220621",
          "DTEND;VALUE=DATE": "20220622",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "junesolstice_2022062120220622@seasky.org",
          "DESCRIPTION": "The June solstice occurs at 09:05 UTC. The North Pole of the earth will be tilted toward the Sun\\n, which will have reached its northernmost position in the sky and will be directly over the Tropic of Cancer at 23.44 degrees north latitude. This is the first day of summer (summer solstice) in the Northern Hemisphere and the first day of winter (winter solstice) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20220629",
          "DTEND;VALUE=DATE": "20220630",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "newmoon_2022062920220630@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 02:53 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Full Moon\\n, Supermoon",
          "DTSTART;VALUE=DATE": "20220713",
          "DTEND;VALUE=DATE": "20220714",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "fullmoon\\n,supermoon_2022071320220714@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 18:38 UTC. This full moon was known by early Native American tribes as the Full Buck Moon because the male buck deer would begin to grow their new antlers at this time of year. This moon has also been known as the Full Thunder Moon and the Full Hay Moon. This is also the second of three supermoons for 2022. The Moon will be at its closest approach to the Earth and may look slightly larger and brighter than usual."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20220728",
          "DTEND;VALUE=DATE": "20220729",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "newmoon_2022072820220729@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 17:55 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Delta Aquarids Meteor Shower",
          "DTSTART;VALUE=DATE": "20220728",
          "DTEND;VALUE=DATE": "20220730",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "deltaaquaridsmeteorshower_2022072820220730@seasky.org",
          "DESCRIPTION": "The Delta Aquarids is an average shower that can produce up to 20 meteors per hour at its peak. It is produced by debris left behind by comets Marsden and Kracht. The shower runs annually from July 12 to August 23. It peaks this year on the night of July 28 and morning of July 29. This is a great year for this shower because the new moon means dark skies for what should be an excellent. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Aquarius\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon\\n, Supermoon",
          "DTSTART;VALUE=DATE": "20220812",
          "DTEND;VALUE=DATE": "20220813",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "fullmoon\\n,supermoon_2022081220220813@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 01:36 UTC. This full moon was known by early Native American tribes as the Full Sturgeon Moon because the large sturgeon fish of the Great Lakes and other major lakes were more easily caught at this time of year. This moon has also been known as the Green Corn Moon and the Grain Moon. This is also the last of three supermoons for 2022. The Moon will be at its closest approach to the Earth and may look slightly larger and brighter than usual."
        },
        {
          "SUMMARY": "Perseids Meteor Shower",
          "DTSTART;VALUE=DATE": "20220812",
          "DTEND;VALUE=DATE": "20220814",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "perseidsmeteorshower_2022081220220814@seasky.org",
          "DESCRIPTION": "The Perseids is one of the best meteor showers to observe\\n, producing up to 60 meteors per hour at its peak. It is produced by comet Swift-Tuttle\\n, which was discovered in 1862. The Perseids are famous for producing a large number of bright meteors. The shower runs annually from July 17 to August 24. It peaks this year on the night of August 12 and the morning of August 13. Unfortunately the nearly full moon this year will block out all but the brightest meteors. But the Perseids are so bright and numerous that it could still be a decent show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Perseus\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Saturn at Opposition",
          "DTSTART;VALUE=DATE": "20220814",
          "DTEND;VALUE=DATE": "20220815",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "saturnatopposition_2022081420220815@seasky.org",
          "DESCRIPTION": "The ringed planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Saturn and its moons. A medium-sized or larger telescope will allow you to see Saturn's rings and a few of its brightest moons."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20220827",
          "DTEND;VALUE=DATE": "20220828",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "newmoon_2022082720220828@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 08:17 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20220827",
          "DTEND;VALUE=DATE": "20220828",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "mercuryatgreatesteasternelongation_2022082720220828@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 27.3 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20220910",
          "DTEND;VALUE=DATE": "20220911",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "fullmoon_2022091020220911@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 09:58 UTC. This full moon was known by early Native American tribes as the Full Corn Moon because the corn is harvested around this time of year. This moon is also known as the Harvest Moon. The Harvest Moon is the full moon that occurs closest to the September equinox each year."
        },
        {
          "SUMMARY": "Neptune at Opposition",
          "DTSTART;VALUE=DATE": "20220916",
          "DTEND;VALUE=DATE": "20220917",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "neptuneatopposition_2022091620220917@seasky.org",
          "DESCRIPTION": "The blue giant planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Neptune. Due to its extreme distance from Earth\\n, it will only appear as a tiny blue dot in all but the most powerful telescopes."
        },
        {
          "SUMMARY": "September Equinox",
          "DTSTART;VALUE=DATE": "20220923",
          "DTEND;VALUE=DATE": "20220924",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "septemberequinox_2022092320220924@seasky.org",
          "DESCRIPTION": "The September equinox occurs at 00:55 UTC. The Sun will shine directly on the equator and there will be nearly equal amounts of day and night throughout the world. This is also the first day of fall (autumnal equinox) in the Northern Hemisphere and the first day of spring (vernal equinox) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20220925",
          "DTEND;VALUE=DATE": "20220926",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "newmoon_2022092520220926@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 21:55 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Jupiter at Opposition",
          "DTSTART;VALUE=DATE": "20220926",
          "DTEND;VALUE=DATE": "20220927",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "jupiteratopposition_2022092620220927@seasky.org",
          "DESCRIPTION": "The giant planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Jupiter and its moons. A medium-sized telescope should be able to show you some of the details in Jupiter's cloud bands. A good pair of binoculars should allow you to see Jupiter's four largest moons\\n, appearing as bright dots on either side of the planet."
        },
        {
          "SUMMARY": "Draconids Meteor Shower",
          "DTSTART;VALUE=DATE": "20221007",
          "DTEND;VALUE=DATE": "20221008",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "draconidsmeteorshower_2022100720221008@seasky.org",
          "DESCRIPTION": "The Draconids is a minor meteor shower producing only about 10 meteors per hour. It is produced by dust grains left behind by comet 21P Giacobini-Zinner\\n, which was first discovered in 1900. The Draconids is an unusual shower in that the best viewing is in the early evening instead of early morning like most other showers. The shower runs annually from October 6-10 and peaks this year on the the night of the 7th. The first quarter moon will block out all but the brightest meteors this year. If you are patient\\n, you may still be able to catch a few good ones. Best viewing will be in the early evening from a dark location far away from city lights. Meteors will radiate from the constellation Draco\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20221008",
          "DTEND;VALUE=DATE": "20221009",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "mercuryatgreatestwesternelongation_2022100820221009@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 18 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20221009",
          "DTEND;VALUE=DATE": "20221010",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "fullmoon_2022100920221010@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 20:55 UTC. This full moon was known by early Native American tribes as the Full Hunters Moon because at this time of year the leaves are falling and the game is fat and ready to hunt. This moon has also been known as the Travel Moon and the Blood Moon."
        },
        {
          "SUMMARY": "Orionids Meteor Shower",
          "DTSTART;VALUE=DATE": "20221021",
          "DTEND;VALUE=DATE": "20221023",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "orionidsmeteorshower_2022102120221023@seasky.org",
          "DESCRIPTION": "The Orionids is an average shower producing up to 20 meteors per hour at its peak. It is produced by dust grains left behind by comet Halley\\n, which has been known and observed since ancient times. The shower runs annually from October 2 to November 7. It peaks this year on the night of October 21 and the morning of October 22. The thin\\n, crescent moon will leave mostly dark skies  for what should be a good show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Orion\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20221025",
          "DTEND;VALUE=DATE": "20221026",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "newmoon_2022102520221026@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 10:49 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Partial Solar Eclipse",
          "DTSTART;VALUE=DATE": "20221025",
          "DTEND;VALUE=DATE": "20221026",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "partialsolareclipse_2022102520221026@seasky.org",
          "DESCRIPTION": "A partial solar eclipse occurs when the Moon covers only a part of the Sun\\n, sometimes resembling a bite taken out of a cookie. A partial solar eclipse can only be safely observed with a special solar filter or by looking at the Sun's reflection. This partial eclipse will be best seen in parts of western Russia and Kazakhstan. It will be best seen from central Russia with over 80% coverage.\\nn        ()"
        },
        {
          "SUMMARY": "Taurids Meteor Shower",
          "DTSTART;VALUE=DATE": "20221104",
          "DTEND;VALUE=DATE": "20221106",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "tauridsmeteorshower_2022110420221106@seasky.org",
          "DESCRIPTION": "The Taurids is a long-running minor meteor shower producing only about 5-10 meteors per hour. It is unusual in that it consists of two separate streams. The first is produced by dust grains left behind by Asteroid 2004 TG10. The second stream is produced by debris left behind by Comet 2P Encke. The shower runs annually from September 7 to December 10. It peaks this year on the the night of November 4. This year the nearly full moon will block out all but the brightest meteors. But if you are patient\\n, you may still be able to catch a few good ones. Best viewing will be just after midnight from a dark location far away from city lights. Meteors will radiate from the constellation Taurus\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20221108",
          "DTEND;VALUE=DATE": "20221109",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "fullmoon_2022110820221109@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 11:03 UTC. This full moon was known by early Native American tribes as the Full Beaver Moon because this was the time of year to set the beaver traps before the swamps and rivers froze. It has also been known as the Frosty Moon and the Hunter's Moon."
        },
        {
          "SUMMARY": "Total Lunar Eclipse",
          "DTSTART;VALUE=DATE": "20221108",
          "DTEND;VALUE=DATE": "20221109",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "totallunareclipse_2022110820221109@seasky.org",
          "DESCRIPTION": "A total lunar eclipse occurs when the Moon passes completely through the Earth's dark shadow\\n, or umbra. During this type of eclipse\\n, the Moon will gradually get darker and then take on a rusty or blood red color. The eclipse will be visible throughout eastern Russia\\n, Japan\\n, Australia\\n, the Pacific Ocean\\n, and parts of western and central North America. ()"
        },
        {
          "SUMMARY": "Uranus at Opposition",
          "DTSTART;VALUE=DATE": "20221109",
          "DTEND;VALUE=DATE": "20221110",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "uranusatopposition_2022110920221110@seasky.org",
          "DESCRIPTION": "The blue-green planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view Uranus. Due to its distance\\n, it will only appear as a tiny blue-green dot in all but the most powerful telescopes."
        },
        {
          "SUMMARY": "Leonids Meteor Shower",
          "DTSTART;VALUE=DATE": "20221117",
          "DTEND;VALUE=DATE": "20221119",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "leonidsmeteorshower_2022111720221119@seasky.org",
          "DESCRIPTION": "The Leonids is an average shower\\n, producing an average of up to 15 meteors per hour at its peak. This shower is unique in that it has a cyclonic peak about every 33 years where hundreds of meteors per hour can be seen. That last of these occurred in 2001. The Leonids is produced by dust grains left behind by comet Tempel-Tuttle\\n, which was discovered in 1865. The shower runs annually from November 6-30. It peaks this year on the night of the 17th and morning of the 18th. The second quarter moon will block many of the fainter meteors this year. But the Leonids can be unpredictable so there is still potential for a good show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Leo\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20221123",
          "DTEND;VALUE=DATE": "20221124",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "newmoon_2022112320221124@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 22:58 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20221208",
          "DTEND;VALUE=DATE": "20221209",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "fullmoon_2022120820221209@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 04:09 UTC. This full moon was known by early Native American tribes as the Full Cold Moon because this is the time of year when the cold winter air settles in and the nights become long and dark. This moon has also been known as the Full Long Nights Moon and the Moon Before Yule."
        },
        {
          "SUMMARY": "Mars at Opposition",
          "DTSTART;VALUE=DATE": "20221208",
          "DTEND;VALUE=DATE": "20221209",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "marsatopposition_2022120820221209@seasky.org",
          "DESCRIPTION": "The red planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Mars. A medium-sized telescope will allow you to see some of the dark details on the planet's orange surface."
        },
        {
          "SUMMARY": "Geminids Meteor Shower",
          "DTSTART;VALUE=DATE": "20221213",
          "DTEND;VALUE=DATE": "20221215",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "geminidsmeteorshower_2022121320221215@seasky.org",
          "DESCRIPTION": "The Geminids is the  king of the meteor showers. It is considered by many to be the best shower in the heavens\\n, producing up to 120 multicolored meteors per hour at its peak. It is produced by debris left behind by an asteroid known as 3200 Phaethon\\n, which was discovered in 1982. The shower runs annually from December 7-17. It peaks this year on the night of the 13th and morning of the 14th. The waning gibbous moon will block many of the fainter meteors this year. But the Geminids are so numerous and bright that this should still be a good show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Gemini\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "December Solstice",
          "DTSTART;VALUE=DATE": "20221221",
          "DTEND;VALUE=DATE": "20221222",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "decembersolstice_2022122120221222@seasky.org",
          "DESCRIPTION": "The December solstice occurs at 21:40 UTC. The South Pole of the earth will be tilted toward the Sun\\n, which will have reached its southernmost position in the sky and will be directly over the Tropic of Capricorn at 23.44 degrees south latitude. This is the first day of winter (winter solstice) in the Northern Hemisphere and the first day of summer (summer solstice) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20221221",
          "DTEND;VALUE=DATE": "20221222",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "mercuryatgreatesteasternelongation_2022122120221222@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 20.1 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "Ursids Meteor Shower",
          "DTSTART;VALUE=DATE": "20221221",
          "DTEND;VALUE=DATE": "20221223",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "ursidsmeteorshower_2022122120221223@seasky.org",
          "DESCRIPTION": "The Ursids is a minor meteor shower producing about 5-10 meteors per hour. It is produced by dust grains left behind by comet Tuttle\\n, which was first discovered in 1790. The shower runs annually from December 17-25. It peaks this year on the the night of the 21st and morning of the 22nd. This year\\n, the nearly new moon will leave dark skies for what should be a really good show. Best viewing will be just after midnight from a dark location far away from city lights. Meteors will radiate from the constellation Ursa Minor\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20221223",
          "DTEND;VALUE=DATE": "20221224",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194726Z",
          "UID": "newmoon_2022122320221224@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 10:17 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Quadrantids Meteor Shower",
          "DTSTART;VALUE=DATE": "20230103",
          "DTEND;VALUE=DATE": "20230105",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "quadrantidsmeteorshower_2023010320230105@seasky.org",
          "DESCRIPTION": "The Quadrantids is an above average shower\\n, with up to 40 meteors per hour at its peak. It is thought to be produced by dust grains left behind by an extinct comet known as 2003 EH1\\n, which was discovered in 2003. The shower runs annually from January 1-5. It peaks this year on the night of the 3rd and  morning of the 4th. This year the nearly full moon will block out most of the fainter meteors. But if you are patient you may still be able to catch a few good ones. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Bootes\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20230106",
          "DTEND;VALUE=DATE": "20230107",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "fullmoon_2023010620230107@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 23:09 UTC. This full moon was known by early Native American tribes as the Full Wolf Moon because this was the time of year when hungry wolf packs howled outside their camps. This moon has also been know as the Old Moon and the Moon After Yule."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20230121",
          "DTEND;VALUE=DATE": "20230122",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "newmoon_2023012120230122@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 20:55 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20230130",
          "DTEND;VALUE=DATE": "20230131",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "mercuryatgreatestwesternelongation_2023013020230131@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 25 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20230205",
          "DTEND;VALUE=DATE": "20230206",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "fullmoon_2023020520230206@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 18:30 UTC. This full moon was known by early Native American tribes as the Full Snow Moon because the heaviest snows usually fell during this time of the year. Since hunting is difficult\\n, this moon has also been known by some tribes as the Full Hunger Moon."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20230220",
          "DTEND;VALUE=DATE": "20230221",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "newmoon_2023022020230221@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 07:08 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20230307",
          "DTEND;VALUE=DATE": "20230308",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "fullmoon_2023030720230308@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 12:42 UTC. This full moon was known by early Native American tribes as the Full Worm Moon because this was the time of year when the ground would begin to soften and the earthworms would reappear. This moon has also been known as the Full Crow Moon\\n, the Full Crust Moon\\n, the Full Sap Moon\\n, and the Lenten Moon."
        },
        {
          "SUMMARY": "March Equinox",
          "DTSTART;VALUE=DATE": "20230320",
          "DTEND;VALUE=DATE": "20230321",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "marchequinox_2023032020230321@seasky.org",
          "DESCRIPTION": "The March equinox occurs at 21:17 UTC. The Sun will shine directly on the equator and there will be nearly equal amounts of day and night throughout the world. This is also the first day of spring (vernal equinox) in the Northern Hemisphere and the first day of fall (autumnal equinox) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20230321",
          "DTEND;VALUE=DATE": "20230322",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "newmoon_2023032120230322@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 17:25 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20230406",
          "DTEND;VALUE=DATE": "20230407",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "fullmoon_2023040620230407@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 04:37 UTC. This full moon was known by early Native American tribes as the Full Pink Moon because it marked the appearance of the moss pink\\n, or wild ground phlox\\n, which is one of the first spring flowers. This moon has also been known as the Sprouting Grass Moon\\n, the Growing Moon\\n, and the Egg Moon. Many coastal tribes called it the Full Fish Moon because this was the time that the shad swam upstream to spawn."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20230411",
          "DTEND;VALUE=DATE": "20230412",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "mercuryatgreatesteasternelongation_2023041120230412@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 19.5 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20230420",
          "DTEND;VALUE=DATE": "20230421",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "newmoon_2023042020230421@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 04:15 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Hybrid Solar Eclipse",
          "DTSTART;VALUE=DATE": "20230420",
          "DTEND;VALUE=DATE": "20230421",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "hybridsolareclipse_2023042020230421@seasky.org",
          "DESCRIPTION": "A hybrid solar eclipse occurs when the Moon is almost too close to the Earth to completely block the Sun. This type of eclipse will appear as a total eclipse to some parts of the world and will appear annular to others. The eclipse path will begin in the southern Indian Ocean and move across parts of western Australia and southern Indonesia. A partial eclipse will be visible throughout most of Indonesia and Australia. () ()"
        },
        {
          "SUMMARY": "Lyrids Meteor Shower",
          "DTSTART;VALUE=DATE": "20230422",
          "DTEND;VALUE=DATE": "20230424",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "lyridsmeteorshower_2023042220230424@seasky.org",
          "DESCRIPTION": "The Lyrids is an average shower\\n, usually producing about 20 meteors per hour at its peak. It is produced by dust particles left behind by comet C/1861 G1 Thatcher\\n, which was discovered in 1861. The shower runs annually from April 16-25. It peaks this year on the night of the night of the 22nd and morning of the 23rd. These meteors can sometimes produce bright dust trails that last for several seconds.  The thin crescent moon will set early in the evening leaving dark skies for what should be an excellent show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Lyra\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20230505",
          "DTEND;VALUE=DATE": "20230506",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "fullmoon_2023050520230506@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 17:36 UTC. This full moon was known by early Native American tribes as the Full Flower Moon because this was the time of year when spring flowers appeared in abundance. This moon has also been known as the Full Corn Planting Moon and the Milk Moon."
        },
        {
          "SUMMARY": "Penumbral Lunar Eclipse",
          "DTSTART;VALUE=DATE": "20230505",
          "DTEND;VALUE=DATE": "20230506",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "penumbrallunareclipse_2023050520230506@seasky.org",
          "DESCRIPTION": "A penumbral lunar eclipse occurs when the Moon passes through the Earth's partial shadow\\n, or penumbra. During this type of eclipse the Moon will darken slightly but not completely. The eclipse will be visible throughout all of Asia and Australia and parts of eastern Europe and eastern Africa. ()"
        },
        {
          "SUMMARY": "Eta Aquarids Meteor Shower",
          "DTSTART;VALUE=DATE": "20230506",
          "DTEND;VALUE=DATE": "20230508",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "etaaquaridsmeteorshower_2023050620230508@seasky.org",
          "DESCRIPTION": "The Eta Aquarids is an above average shower\\n, capable of producing up to 60 meteors per hour at its peak. Most of the activity is seen in the Southern Hemisphere. In the Northern Hemisphere\\n, the rate can reach about 30 meteors per hour. It is produced by dust particles left behind by comet Halley\\n, which has known and observed since ancient times. The shower runs annually from April 19 to May 28. It peaks this year on the night of May 6 and the morning of the May 7. The nearly full moon will be a problem this year\\n, blocking out all but the brightest meteors. If you are patient\\n, you should still should be able to catch a few good ones. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Aquarius\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20230519",
          "DTEND;VALUE=DATE": "20230520",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "newmoon_2023051920230520@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 15:55 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20230529",
          "DTEND;VALUE=DATE": "20230530",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "mercuryatgreatestwesternelongation_2023052920230530@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 24.9 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20230604",
          "DTEND;VALUE=DATE": "20230605",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "fullmoon_2023060420230605@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 03:43 UTC. This full moon was known by early Native American tribes as the Full Strawberry Moon because it signaled the time of year to gather ripening fruit. It also coincides with the peak of the strawberry harvesting season. This moon has also been known as the Full Rose Moon and the Full Honey Moon."
        },
        {
          "SUMMARY": "Venus at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20230604",
          "DTEND;VALUE=DATE": "20230605",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "venusatgreatesteasternelongation_2023060420230605@seasky.org",
          "DESCRIPTION": "The planet Venus reaches greatest eastern elongation of 45.4 degrees from the Sun. This is the best time to view Venus since it will be at its highest point above the horizon in the evening sky. Look for the bright planet in the western sky after sunset."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20230618",
          "DTEND;VALUE=DATE": "20230619",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "newmoon_2023061820230619@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 04:39 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "June Solstice",
          "DTSTART;VALUE=DATE": "20230621",
          "DTEND;VALUE=DATE": "20230622",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "junesolstice_2023062120230622@seasky.org",
          "DESCRIPTION": "The June solstice occurs at 14:51 UTC. The North Pole of the earth will be tilted toward the Sun\\n, which will have reached its northernmost position in the sky and will be directly over the Tropic of Cancer at 23.44 degrees north latitude. This is the first day of summer (summer solstice) in the Northern Hemisphere and the first day of winter (winter solstice) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Full Moon\\n, Supermoon",
          "DTSTART;VALUE=DATE": "20230703",
          "DTEND;VALUE=DATE": "20230704",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "fullmoon\\n,supermoon_2023070320230704@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 11:40 UTC. This full moon was known by early Native American tribes as the Full Buck Moon because the male buck deer would begin to grow their new antlers at this time of year. This moon has also been known as the Full Thunder Moon and the Full Hay Moon. This is also the first of four supermoons for 2023. The Moon will be at its closest approach to the Earth and may look slightly larger and brighter than usual."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20230717",
          "DTEND;VALUE=DATE": "20230718",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "newmoon_2023071720230718@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 18:33 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Delta Aquarids Meteor Shower",
          "DTSTART;VALUE=DATE": "20230728",
          "DTEND;VALUE=DATE": "20230730",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "deltaaquaridsmeteorshower_2023072820230730@seasky.org",
          "DESCRIPTION": "The Delta Aquarids is an average shower that can produce up to 20 meteors per hour at its peak. It is produced by debris left behind by comets Marsden and Kracht. The shower runs annually from July 12 to August 23. It peaks this year on the night of July 28 and morning of July 29. The nearly full moon will block most of the fainter meteors this year. But if you are patient\\n, you may still be able to catch a few good ones. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Aquarius\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon\\n, Supermoon",
          "DTSTART;VALUE=DATE": "20230801",
          "DTEND;VALUE=DATE": "20230802",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "fullmoon\\n,supermoon_2023080120230802@seasky.org",
          "DESCRIPTION": "The Moon will be located opposite the Earth from the Sun and will be fully illuminated as seen from Earth. This phase occurs at 18:33 UTC. This full moon was known by early Native American tribes as the Full Sturgeon Moon because the large sturgeon fish of the Great Lakes and other major lakes were more easily caught at this time of year. This moon has also been known as the Green Corn Moon and the Grain Moon. This is also the second of four supermoons for 2023. The Moon will be at its closest approach to the Earth and may look slightly larger and brighter than usual."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20230810",
          "DTEND;VALUE=DATE": "20230811",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "mercuryatgreatesteasternelongation_2023081020230811@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 27.4 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "Perseids Meteor Shower",
          "DTSTART;VALUE=DATE": "20230812",
          "DTEND;VALUE=DATE": "20230814",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "perseidsmeteorshower_2023081220230814@seasky.org",
          "DESCRIPTION": "The Perseids is one of the best meteor showers to observe\\n, producing up to 60 meteors per hour at its peak. It is produced by comet Swift-Tuttle\\n, which was discovered in 1862. The Perseids are famous for producing a large number of bright meteors. The shower runs annually from July 17 to August 24. It peaks this year on the night of August 12 and the morning of August 13. The crescent moon should not be too much of a problem this year. Skies should still be dark enough for a good show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Perseus\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20230816",
          "DTEND;VALUE=DATE": "20230817",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "newmoon_2023081620230817@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 09:39 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Saturn at Opposition",
          "DTSTART;VALUE=DATE": "20230827",
          "DTEND;VALUE=DATE": "20230828",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "saturnatopposition_2023082720230828@seasky.org",
          "DESCRIPTION": "The ringed planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Saturn and its moons. A medium-sized or larger telescope will allow you to see Saturn's rings and a few of its brightest moons."
        },
        {
          "SUMMARY": "Full Moon\\n, Supermoon\\n, Blue Moon",
          "DTSTART;VALUE=DATE": "20230831",
          "DTEND;VALUE=DATE": "20230901",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "fullmoon\\n,supermoon\\n,bluemoon_2023083120230901@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 01:37 UTC.  This is also the third of four supermoons for 2023. The Moon will be at its closest approach to the Earth and may look slightly larger and brighter than usual. Since this is the second full moon in the same month\\n, it is sometimes referred to as a blue moon."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20230915",
          "DTEND;VALUE=DATE": "20230916",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "newmoon_2023091520230916@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 01:41 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Neptune at Opposition",
          "DTSTART;VALUE=DATE": "20230919",
          "DTEND;VALUE=DATE": "20230920",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "neptuneatopposition_2023091920230920@seasky.org",
          "DESCRIPTION": "The blue giant planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Neptune. Due to its extreme distance from Earth\\n, it will only appear as a tiny blue dot in all but the most powerful telescopes."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20230922",
          "DTEND;VALUE=DATE": "20230923",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "mercuryatgreatestwesternelongation_2023092220230923@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 17.9 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "September Equinox",
          "DTSTART;VALUE=DATE": "20230923",
          "DTEND;VALUE=DATE": "20230924",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "septemberequinox_2023092320230924@seasky.org",
          "DESCRIPTION": "The September equinox occurs at 06:43 UTC. The Sun will shine directly on the equator and there will be nearly equal amounts of day and night throughout the world. This is also the first day of fall (autumnal equinox) in the Northern Hemisphere and the first day of spring (vernal equinox) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Full Moon\\n, Supermoon",
          "DTSTART;VALUE=DATE": "20230929",
          "DTEND;VALUE=DATE": "20230930",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "fullmoon\\n,supermoon_2023092920230930@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 09:59 UTC. This full moon was known by early Native American tribes as the Full Corn Moon because the corn is harvested around this time of year. This moon is also known as the Harvest Moon. The Harvest Moon is the full moon that occurs closest to the September equinox each year. This is also the last of four supermoons for 2023. The Moon will be at its closest approach to the Earth and may look slightly larger and brighter than usual."
        },
        {
          "SUMMARY": "Draconids Meteor Shower",
          "DTSTART;VALUE=DATE": "20231007",
          "DTEND;VALUE=DATE": "20231008",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "draconidsmeteorshower_2023100720231008@seasky.org",
          "DESCRIPTION": "The Draconids is a minor meteor shower producing only about 10 meteors per hour. It is produced by dust grains left behind by comet 21P Giacobini-Zinner\\n, which was first discovered in 1900. The Draconids is an unusual shower in that the best viewing is in the early evening instead of early morning like most other showers. The shower runs annually from October 6-10 and peaks this year on the the night of the 7th. The second quarter moon will dark skies in the early evening for what should be a good show.  Best viewing will be in the early evening from a dark location far away from city lights. Meteors will radiate from the constellation Draco\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20231014",
          "DTEND;VALUE=DATE": "20231015",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "newmoon_2023101420231015@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 17:56 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Annular Solar Eclipse",
          "DTSTART;VALUE=DATE": "20231014",
          "DTEND;VALUE=DATE": "20231015",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "annularsolareclipse_2023101420231015@seasky.org",
          "DESCRIPTION": "An annular solar eclipse occurs when the Moon is too far away from the Earth to completely cover the Sun. This results in a ring of light around the darkened Moon. The Sun's corona is not visible during an annular eclipse.  The eclipse path will begin in the Pacific Ocean off the coast of southern Canada and move across the southwestern United States and Central America\\n, Columbia\\n, and Brazil. A partial eclipse will be visible throughout much of North and South America. () ()"
        },
        {
          "SUMMARY": "Orionids Meteor Shower",
          "DTSTART;VALUE=DATE": "20231021",
          "DTEND;VALUE=DATE": "20231023",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "orionidsmeteorshower_2023102120231023@seasky.org",
          "DESCRIPTION": "The Orionids is an average shower producing up to 20 meteors per hour at its peak. It is produced by dust grains left behind by comet Halley\\n, which has been known and observed since ancient times. The shower runs annually from October 2 to November 7. It peaks this year on the night of October 21 and the morning of October 22. The first quarter moon may block some of the dim meteors in the evening\\n, but it will set shortly after midnight. This will leave dark skies for what could be a good morning show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Orion\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Venus at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20231023",
          "DTEND;VALUE=DATE": "20231024",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "venusatgreatestwesternelongation_2023102320231024@seasky.org",
          "DESCRIPTION": "The planet Venus reaches greatest eastern elongation of 46.4 degrees from the Sun. This is the best time to view Venus since it will be at its highest point above the horizon in the morning sky. Look for the bright planet in the eastern sky before sunrise."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20231028",
          "DTEND;VALUE=DATE": "20231029",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "fullmoon_2023102820231029@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 20:25 UTC. This full moon was known by early Native American tribes as the Full Hunters Moon because at this time of year the leaves are falling and the game is fat and ready to hunt. This moon has also been known as the Travel Moon and the Blood Moon."
        },
        {
          "SUMMARY": "Partial Lunar Eclipse",
          "DTSTART;VALUE=DATE": "20231028",
          "DTEND;VALUE=DATE": "20231029",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "partiallunareclipse_2023102820231029@seasky.org",
          "DESCRIPTION": "A partial lunar eclipse occurs when the Moon passes through the Earth's partial shadow\\n, or penumbra\\n, and only a portion of it passes through the darkest shadow\\n, or umbra. During this type of eclipse a part of the Moon will darken as it moves through the Earth's shadow. The eclipse will be visible throughout all of Europe\\n, Asia\\n, and Africa\\n, and western Australia. ()"
        },
        {
          "SUMMARY": "Jupiter at Opposition",
          "DTSTART;VALUE=DATE": "20231103",
          "DTEND;VALUE=DATE": "20231104",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "jupiteratopposition_2023110320231104@seasky.org",
          "DESCRIPTION": "The giant planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Jupiter and its moons. A medium-sized telescope should be able to show you some of the details in Jupiter's cloud bands. A good pair of binoculars should allow you to see Jupiter's four largest moons\\n, appearing as bright dots on either side of the planet."
        },
        {
          "SUMMARY": "Taurids Meteor Shower",
          "DTSTART;VALUE=DATE": "20231104",
          "DTEND;VALUE=DATE": "20231106",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "tauridsmeteorshower_2023110420231106@seasky.org",
          "DESCRIPTION": "The Taurids is a long-running minor meteor shower producing only about 5-10 meteors per hour. It is unusual in that it consists of two separate streams. The first is produced by dust grains left behind by Asteroid 2004 TG10. The second stream is produced by debris left behind by Comet 2P Encke. The shower runs annually from September 7 to December 10. It peaks this year on the the night of November 4 and the morning of the 5th. The second quarter moon will block most of the dim meteors this year. But if you are patient\\n, you may still be able to catch a few good ones. Best viewing will be just after midnight from a dark location far away from city lights. Meteors will radiate from the constellation Taurus\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20231113",
          "DTEND;VALUE=DATE": "20231114",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "newmoon_2023111320231114@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 09:28 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Uranus at Opposition",
          "DTSTART;VALUE=DATE": "20231113",
          "DTEND;VALUE=DATE": "20231114",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "uranusatopposition_2023111320231114@seasky.org",
          "DESCRIPTION": "The blue-green planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view Uranus. Due to its distance\\n, it will only appear as a tiny blue-green dot in all but the most powerful telescopes."
        },
        {
          "SUMMARY": "Leonids Meteor Shower",
          "DTSTART;VALUE=DATE": "20231117",
          "DTEND;VALUE=DATE": "20231119",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "leonidsmeteorshower_2023111720231119@seasky.org",
          "DESCRIPTION": "The Leonids is an average shower\\n, producing up to 15 meteors per hour at its peak. This shower is unique in that it has a cyclonic peak about every 33 years where hundreds of meteors per hour can be seen. That last of these occurred in 2001. The Leonids is produced by dust grains left behind by comet Tempel-Tuttle\\n, which was discovered in 1865. The shower runs annually from November 6-30. It peaks this year on the night of the 17th and morning of the 18th. The crescent moon will set before midnight leaving dark skies for what should be a great early morning show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Leo\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20231127",
          "DTEND;VALUE=DATE": "20231128",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "fullmoon_2023112720231128@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 09:17 UTC. This full moon was known by early Native American tribes as the Full Beaver Moon because this was the time of year to set the beaver traps before the swamps and rivers froze. It has also been known as the Frosty Moon and the Hunter's Moon."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20231204",
          "DTEND;VALUE=DATE": "20231205",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "mercuryatgreatesteasternelongation_2023120420231205@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 21.3 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20231212",
          "DTEND;VALUE=DATE": "20231213",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "newmoon_2023121220231213@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 23:33 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Geminids Meteor Shower",
          "DTSTART;VALUE=DATE": "20231213",
          "DTEND;VALUE=DATE": "20231215",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "geminidsmeteorshower_2023121320231215@seasky.org",
          "DESCRIPTION": "The Geminids is the  king of the meteor showers. It is considered by many to be the best shower in the heavens\\n, producing up to 120 multicolored meteors per hour at its peak. It is produced by debris left behind by an asteroid known as 3200 Phaethon\\n, which was discovered in 1982. The shower runs annually from December 7-17. It peaks this year on the night of the 13th and morning of the 14th.  This should be an great year for the Geminids. The nearly new moon means dark skies for what should be an excellent show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Gemini\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Ursids Meteor Shower",
          "DTSTART;VALUE=DATE": "20231221",
          "DTEND;VALUE=DATE": "20231223",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "ursidsmeteorshower_2023122120231223@seasky.org",
          "DESCRIPTION": "The Ursids is a minor meteor shower producing about 5-10 meteors per hour. It is produced by dust grains left behind by comet Tuttle\\n, which was first discovered in 1790. The shower runs annually from December 17-25. It peaks this year on the the night of the 21st and morning of the 22nd. The waxing gibbous moon will block out most of the faintest meteors this year. But if you are patient\\n, you should still be able to catch a few good ones. Best viewing will be just after midnight from a dark location far away from city lights. Meteors will radiate from the constellation Ursa Minor\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "December Solstice",
          "DTSTART;VALUE=DATE": "20231222",
          "DTEND;VALUE=DATE": "20231223",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "decembersolstice_2023122220231223@seasky.org",
          "DESCRIPTION": "The December solstice occurs at 03:21 UTC. The South Pole of the earth will be tilted toward the Sun\\n, which will have reached its southernmost position in the sky and will be directly over the Tropic of Capricorn at 23.44 degrees south latitude. This is the first day of winter (winter solstice) in the Northern Hemisphere and the first day of summer (summer solstice) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20231227",
          "DTEND;VALUE=DATE": "20231228",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194727Z",
          "UID": "fullmoon_2023122720231228@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 00:34 UTC. This full moon was known by early Native American tribes as the Full Cold Moon because this is the time of year when the cold winter air settles in and the nights become long and dark. This moon has also been known as the Full Long Nights Moon and the Moon Before Yule."
        },
        {
          "SUMMARY": "Quadrantids Meteor Shower",
          "DTSTART;VALUE=DATE": "20240103",
          "DTEND;VALUE=DATE": "20240105",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "quadrantidsmeteorshower_2024010320240105@seasky.org",
          "DESCRIPTION": "The Quadrantids is an above average shower\\n, with up to 40 meteors per hour at its peak. It is thought to be produced by dust grains left behind by an extinct comet known as 2003 EH1\\n, which was discovered in 2003. The shower runs annually from January 1-5. It peaks this year on the night of the 3rd and  morning of the 4th. The waning gibbous moon will block out some of the fainter meteors\\n, but if you are patient this could still be a good show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Bootes\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20240111",
          "DTEND;VALUE=DATE": "20240112",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "newmoon_2024011120240112@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 11:59 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20240112",
          "DTEND;VALUE=DATE": "20240113",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "mercuryatgreatestwesternelongation_2024011220240113@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 23.5 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20240125",
          "DTEND;VALUE=DATE": "20240126",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "fullmoon_2024012520240126@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 17:55 UTC. This full moon was known by early Native American tribes as the Full Wolf Moon because this was the time of year when hungry wolf packs howled outside their camps. This moon has also been know as the Old Moon and the Moon After Yule."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20240209",
          "DTEND;VALUE=DATE": "20240210",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "newmoon_2024020920240210@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 23:00 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20240224",
          "DTEND;VALUE=DATE": "20240225",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "fullmoon_2024022420240225@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 12:32 UTC. This full moon was known by early Native American tribes as the Full Snow Moon because the heaviest snows usually fell during this time of the year. Since hunting is difficult\\n, this moon has also been known by some tribes as the Full Hunger Moon\\n, since the harsh weather made hunting difficult."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20240310",
          "DTEND;VALUE=DATE": "20240311",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "newmoon_2024031020240311@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 09:02 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "March Equinox",
          "DTSTART;VALUE=DATE": "20240320",
          "DTEND;VALUE=DATE": "20240321",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "marchequinox_2024032020240321@seasky.org",
          "DESCRIPTION": "The March equinox occurs at 03:01 UTC. The Sun will shine directly on the equator and there will be nearly equal amounts of day and night throughout the world. This is also the first day of spring (vernal equinox) in the Northern Hemisphere and the first day of fall (autumnal equinox) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20240324",
          "DTEND;VALUE=DATE": "20240325",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "mercuryatgreatesteasternelongation_2024032420240325@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 18.7 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20240325",
          "DTEND;VALUE=DATE": "20240326",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "fullmoon_2024032520240326@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 07:02 UTC. This full moon was known by early Native American tribes as the Full Worm Moon because this was the time of year when the ground would begin to soften and the earthworms would reappear. This moon has also been known as the Full Crow Moon\\n, the Full Crust Moon\\n, the Full Sap Moon\\n, and the Lenten Moon."
        },
        {
          "SUMMARY": "Penumbral Lunar Eclipse",
          "DTSTART;VALUE=DATE": "20240325",
          "DTEND;VALUE=DATE": "20240326",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "penumbrallunareclipse_2024032520240326@seasky.org",
          "DESCRIPTION": "A penumbral lunar eclipse occurs when the Moon passes through the Earth's partial shadow\\n, or penumbra. During this type of eclipse the Moon will darken slightly but not completely. The eclipse will be visible throughout all North America\\n, Mexico\\n, Central America\\n, and South America.\\nn        ()"
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20240408",
          "DTEND;VALUE=DATE": "20240409",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "newmoon_2024040820240409@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 18:22 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Total Solar Eclipse",
          "DTSTART;VALUE=DATE": "20240408",
          "DTEND;VALUE=DATE": "20240409",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "totalsolareclipse_2024040820240409@seasky.org",
          "DESCRIPTION": "A total solar eclipse occurs when the moon completely blocks the Sun\\n, revealing the Sun's beautiful outer atmosphere known as the corona. This is a  for viewers in the United States. The last total solar eclipse visible in the continental United States occurred in 2017 and the next one will not take place until 2045. The path of totality will begin in the Pacific Ocean and move across parts of Mexico and the eastern United States and Nova Scotia. The total eclipse will be visible in parts of Texas\\n, Arkansas\\n, Missouri\\n, Illinois\\n, Indiana\\n, Kentucky\\n, Ohio\\n, Pennsylvania\\n, New York\\n, Vermont\\n, New Hampshire\\n, and Maine.  () ()"
        },
        {
          "SUMMARY": "Lyrids Meteor Shower",
          "DTSTART;VALUE=DATE": "20240422",
          "DTEND;VALUE=DATE": "20240424",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "lyridsmeteorshower_2024042220240424@seasky.org",
          "DESCRIPTION": "The Lyrids is an average shower\\n, usually producing about 20 meteors per hour at its peak. It is produced by dust particles left behind by comet C/1861 G1 Thatcher\\n, which was discovered in 1861. The shower runs annually from April 16-25. It peaks this year on the night of the night of the 22nd and morning of the 23rd. These meteors can sometimes produce bright dust trails that last for several seconds.  Unfortunately the glare of the full moon will block out all but the brightest meteors this year. But if you are patient\\n, you may still be able to catch a few good ones. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Lyra\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20240423",
          "DTEND;VALUE=DATE": "20240424",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "fullmoon_2024042320240424@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 23:50 UTC. This full moon was known by early Native American tribes as the Full Pink Moon because it marked the appearance of the moss pink\\n, or wild ground phlox\\n, which is one of the first spring flowers. This moon has also been known as the Sprouting Grass Moon\\n, the Growing Moon\\n, and the Egg Moon. Many coastal tribes called it the Full Fish Moon because this was the time that the shad swam upstream to spawn."
        },
        {
          "SUMMARY": "Eta Aquarids Meteor Shower",
          "DTSTART;VALUE=DATE": "20240506",
          "DTEND;VALUE=DATE": "20240508",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "etaaquaridsmeteorshower_2024050620240508@seasky.org",
          "DESCRIPTION": "The Eta Aquarids is an above average shower\\n, capable of producing up to 60 meteors per hour at its peak. Most of the activity is seen in the Southern Hemisphere. In the Northern Hemisphere\\n, the rate can reach about 30 meteors per hour. It is produced by dust particles left behind by comet Halley\\n, which has known and observed since ancient times. The shower runs annually from April 19 to May 28. It peaks this year on the night of May 6 and the morning of the May 7. The nearly new moon means dark skies for what should be an excellent show this year. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Aquarius\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20240508",
          "DTEND;VALUE=DATE": "20240509",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "newmoon_2024050820240509@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 03:23 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20240509",
          "DTEND;VALUE=DATE": "20240510",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "mercuryatgreatestwesternelongation_2024050920240510@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 26.4 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20240523",
          "DTEND;VALUE=DATE": "20240524",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "fullmoon_2024052320240524@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 13:55 UTC. This full moon was known by early Native American tribes as the Full Flower Moon because this was the time of year when spring flowers appeared in abundance. This moon has also been known as the Full Corn Planting Moon and the Milk Moon."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20240606",
          "DTEND;VALUE=DATE": "20240607",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "newmoon_2024060620240607@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 12:39 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "June Solstice",
          "DTSTART;VALUE=DATE": "20240620",
          "DTEND;VALUE=DATE": "20240621",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "junesolstice_2024062020240621@seasky.org",
          "DESCRIPTION": "The June solstice occurs at 20:46 UTC. The North Pole of the earth will be tilted toward the Sun\\n, which will have reached its northernmost position in the sky and will be directly over the Tropic of Cancer at 23.44 degrees north latitude. This is the first day of summer (summer solstice) in the Northern Hemisphere and the first day of winter (winter solstice) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20240622",
          "DTEND;VALUE=DATE": "20240623",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "fullmoon_2024062220240623@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 01:09 UTC. This full moon was known by early Native American tribes as the Full Strawberry Moon because it signaled the time of year to gather ripening fruit. It also coincides with the peak of the strawberry harvesting season. This moon has also been known as the Full Rose Moon and the Full Honey Moon."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20240705",
          "DTEND;VALUE=DATE": "20240706",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "newmoon_2024070520240706@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 22:59 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20240721",
          "DTEND;VALUE=DATE": "20240722",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "fullmoon_2024072120240722@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 10:18 UTC. This full moon was known by early Native American tribes as the Full Buck Moon because the male buck deer would begin to grow their new antlers at this time of year. This moon has also been known as the Full Thunder Moon and the Full Hay Moon."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20240722",
          "DTEND;VALUE=DATE": "20240723",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "mercuryatgreatesteasternelongation_2024072220240723@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 26.9 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "Delta Aquarids Meteor Shower",
          "DTSTART;VALUE=DATE": "20240728",
          "DTEND;VALUE=DATE": "20240730",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "deltaaquaridsmeteorshower_2024072820240730@seasky.org",
          "DESCRIPTION": "The Delta Aquarids is an average shower that can produce up to 20 meteors per hour at its peak. It is produced by debris left behind by comets Marsden and Kracht. The shower runs annually from July 12 to August 23. It peaks this year on the night of July 28 and morning of July 29. The second quarter moon will block many of the fainter meteors this year. But if you are patient\\n, you should still be able to catch a few good ones. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Aquarius\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20240804",
          "DTEND;VALUE=DATE": "20240805",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "newmoon_2024080420240805@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 11:15 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Perseids Meteor Shower",
          "DTSTART;VALUE=DATE": "20240812",
          "DTEND;VALUE=DATE": "20240814",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "perseidsmeteorshower_2024081220240814@seasky.org",
          "DESCRIPTION": "The Perseids is one of the best meteor showers to observe\\n, producing up to 60 meteors per hour at its peak. It is produced by comet Swift-Tuttle\\n, which was discovered in 1862. The Perseids are famous for producing a large number of bright meteors. The shower runs annually from July 17 to August 24. It peaks this year on the night of August 11 and the morning of August 12. The first quarter moon will block out some of the fainter meteors in the early evening. But the Moon will set shortly after midnight leaving dark skies for what could be an excellent early morning show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Perseus\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon\\n, Blue Moon",
          "DTSTART;VALUE=DATE": "20240819",
          "DTEND;VALUE=DATE": "20240820",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "fullmoon\\n,bluemoon_2024081920240820@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 18:27 UTC. This full moon was known by early Native American tribes as the Full Sturgeon Moon because the large sturgeon fish of the Great Lakes and other major lakes were more easily caught at this time of year. This moon has also been known as the Green Corn Moon and the Grain Moon. Since this is the third of four full moons in this season\\n, it is known as a blue moon. This rare calendar event only happens once every few years\\n, giving rise to the term\\n, “once in a blue moon.” There are normally only three full moons in each season of the year. But since full moons occur every 29.53 days\\n, occasionally a season will contain 4 full moons. The extra full moon of the season is known as a blue moon. Blue moons occur on average once every 2.7 years."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20240903",
          "DTEND;VALUE=DATE": "20240904",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "newmoon_2024090320240904@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 01:57 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20240905",
          "DTEND;VALUE=DATE": "20240906",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "mercuryatgreatestwesternelongation_2024090520240906@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 18.1 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "Saturn at Opposition",
          "DTSTART;VALUE=DATE": "20240908",
          "DTEND;VALUE=DATE": "20240909",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "saturnatopposition_2024090820240909@seasky.org",
          "DESCRIPTION": "The ringed planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Saturn and its moons. A medium-sized or larger telescope will allow you to see Saturn's rings and a few of its brightest moons."
        },
        {
          "SUMMARY": "Full Moon\\n, Supermoon",
          "DTSTART;VALUE=DATE": "20240918",
          "DTEND;VALUE=DATE": "20240919",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "fullmoon\\n,supermoon_2024091820240919@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 02:36 UTC. This full moon was known by early Native American tribes as the Full Corn Moon because the corn is harvested around this time of year. This moon is also known as the Harvest Moon. The Harvest Moon is the full moon that occurs closest to the September equinox each year. This is also the first of three supermoons for 2024. The Moon will be at its closest approach to the Earth and may look slightly larger and brighter than usual."
        },
        {
          "SUMMARY": "Partial Lunar Eclipse",
          "DTSTART;VALUE=DATE": "20240918",
          "DTEND;VALUE=DATE": "20240919",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "partiallunareclipse_2024091820240919@seasky.org",
          "DESCRIPTION": "A partial lunar eclipse occurs when the Moon passes through the Earth's partial shadow\\n, or penumbra\\n, and only a portion of it passes through the darkest shadow\\n, or umbra. During this type of eclipse a part of the Moon will darken as it moves through the Earth's shadow. The eclipse will be visible throughout most of North America\\n, Mexico\\n, Central America\\n, South America\\n, the Atlantic Ocean\\n, and most of Europe and Africa. ()"
        },
        {
          "SUMMARY": "Neptune at Opposition",
          "DTSTART;VALUE=DATE": "20240920",
          "DTEND;VALUE=DATE": "20240921",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "neptuneatopposition_2024092020240921@seasky.org",
          "DESCRIPTION": "The blue giant planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Neptune. Due to its extreme distance from Earth\\n, it will only appear as a tiny blue dot in all but the most powerful telescopes."
        },
        {
          "SUMMARY": "September Equinox",
          "DTSTART;VALUE=DATE": "20240922",
          "DTEND;VALUE=DATE": "20240923",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "septemberequinox_2024092220240923@seasky.org",
          "DESCRIPTION": "The September equinox occurs at 12:39 UTC. The Sun will shine directly on the equator and there will be nearly equal amounts of day and night throughout the world. This is also the first day of fall (autumnal equinox) in the Northern Hemisphere and the first day of spring (vernal equinox) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20241002",
          "DTEND;VALUE=DATE": "20241003",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "newmoon_2024100220241003@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 18:51 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Annular Solar Eclipse",
          "DTSTART;VALUE=DATE": "20241002",
          "DTEND;VALUE=DATE": "20241003",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "annularsolareclipse_2024100220241003@seasky.org",
          "DESCRIPTION": "An annular solar eclipse occurs when the Moon is too far away from the Earth to completely cover the Sun. This results in a ring of light around the darkened Moon. The Sun's corona is not visible during an annular eclipse.  The eclipse path will begin in the Pacific Ocean off the coast of South America and move across parts of southern Chile and Argentina. A partial eclipse will be visible throughout most of southern South America. () ()"
        },
        {
          "SUMMARY": "Draconids Meteor Shower",
          "DTSTART;VALUE=DATE": "20241007",
          "DTEND;VALUE=DATE": "20241008",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "draconidsmeteorshower_2024100720241008@seasky.org",
          "DESCRIPTION": "The Draconids is a minor meteor shower producing only about 10 meteors per hour. It is produced by dust grains left behind by comet 21P Giacobini-Zinner\\n, which was first discovered in 1900. The Draconids is an unusual shower in that the best viewing is in the early evening instead of early morning like most other showers. The shower runs annually from October 6-10 and peaks this year on the the night of the 7th. The second quarter moon will ensure dark skies in the early evening for what could be a good show. If you are patient\\n, you may still be able to catch a few good ones. Best viewing will be in the early evening from a dark location far away from city lights. Meteors will radiate from the constellation Draco\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon\\n, Supermoon",
          "DTSTART;VALUE=DATE": "20241017",
          "DTEND;VALUE=DATE": "20241018",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "fullmoon\\n,supermoon_2024101720241018@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 11:28 UTC. This full moon was known by early Native American tribes as the Full Hunters Moon because at this time of year the leaves are falling and the game is fat and ready to hunt. This moon has also been known as the Travel Moon and the Blood Moon. This is also the second of three supermoons for 2024. The Moon will be at its closest approach to the Earth and may look slightly larger and brighter than usual."
        },
        {
          "SUMMARY": "Orionids Meteor Shower",
          "DTSTART;VALUE=DATE": "20241021",
          "DTEND;VALUE=DATE": "20241023",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "orionidsmeteorshower_2024102120241023@seasky.org",
          "DESCRIPTION": "The Orionids is an average shower producing up to 20 meteors per hour at its peak. It is produced by dust grains left behind by comet Halley\\n, which has been known and observed since ancient times. The shower runs annually from October 2 to November 7. The shower peaks this year on the night of October 21 and the morning of October 22. The waning gibbous moon will block out most of the fainter meteors this year. But if you are patient\\n, you should still be able to catch a few good ones. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Orion\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20241101",
          "DTEND;VALUE=DATE": "20241102",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "newmoon_2024110120241102@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 12:49 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Taurids Meteor Shower",
          "DTSTART;VALUE=DATE": "20241104",
          "DTEND;VALUE=DATE": "20241106",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "tauridsmeteorshower_2024110420241106@seasky.org",
          "DESCRIPTION": "The Taurids is a long-running minor meteor shower producing only about 5-10 meteors per hour. It is unusual in that it consists of two separate streams. The first is produced by dust grains left behind by Asteroid 2004 TG10. The second stream is produced by debris left behind by Comet 2P Encke. The shower runs annually from September 7 to December 10. It peaks this year on the the night of November 4. The first quarter moon will block out all but the brightest meteors this year. If you are patient\\n, you may still be able to catch a few good ones. Best viewing will be just after midnight from a dark location far away from city lights. Meteors will radiate from the constellation Taurus\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon\\n, Supermoon",
          "DTSTART;VALUE=DATE": "20241115",
          "DTEND;VALUE=DATE": "20241116",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "fullmoon\\n,supermoon_2024111520241116@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 21:30 UTC. This full moon was known by early Native American tribes as the Full Beaver Moon because this was the time of year to set the beaver traps before the swamps and rivers froze. It has also been known as the Frosty Moon and the Hunter's Moon. This is also the last of three supermoons for 2024. The Moon will be at its closest approach to the Earth and may look slightly larger and brighter than usual."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20241116",
          "DTEND;VALUE=DATE": "20241117",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "mercuryatgreatesteasternelongation_2024111620241117@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 22.5 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "Uranus at Opposition",
          "DTSTART;VALUE=DATE": "20241117",
          "DTEND;VALUE=DATE": "20241118",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "uranusatopposition_2024111720241118@seasky.org",
          "DESCRIPTION": "The blue-green planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view Uranus. Due to its distance\\n, it will only appear as a tiny blue-green dot in all but the most powerful telescopes."
        },
        {
          "SUMMARY": "Leonids Meteor Shower",
          "DTSTART;VALUE=DATE": "20241117",
          "DTEND;VALUE=DATE": "20241119",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "leonidsmeteorshower_2024111720241119@seasky.org",
          "DESCRIPTION": "The Leonids is an average shower\\n, producing up to 15 meteors per hour at its peak. This shower is unique in that it has a cyclonic peak about every 33 years where hundreds of meteors per hour can be seen. That last of these occurred in 2001. The Leonids is produced by dust grains left behind by comet Tempel-Tuttle\\n, which was discovered in 1865. The shower runs annually from November 6-30. It peaks this year on the night of the 17th and morning of the 18th. Unfortunately the nearly full moon will block all but the brightest meteors this year. If you are patient\\n, you may still be able to catch a few good ones. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Leo\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20241201",
          "DTEND;VALUE=DATE": "20241202",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "newmoon_2024120120241202@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 06:22 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Jupiter at Opposition",
          "DTSTART;VALUE=DATE": "20241207",
          "DTEND;VALUE=DATE": "20241208",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "jupiteratopposition_2024120720241208@seasky.org",
          "DESCRIPTION": "The giant planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Jupiter and its moons. A medium-sized telescope should be able to show you some of the details in Jupiter's cloud bands. A good pair of binoculars should allow you to see Jupiter's four largest moons\\n, appearing as bright dots on either side of the planet."
        },
        {
          "SUMMARY": "Geminids Meteor Shower",
          "DTSTART;VALUE=DATE": "20241213",
          "DTEND;VALUE=DATE": "20241215",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "geminidsmeteorshower_2024121320241215@seasky.org",
          "DESCRIPTION": "The Geminids is the  king of the meteor showers. It is considered by many to be the best shower in the heavens\\n, producing up to 120 multicolored meteors per hour at its peak. It is produced by debris left behind by an asteroid known as 3200 Phaethon\\n, which was discovered in 1982. The shower runs annually from December 7-17. It peaks this year on the night of the 13th and morning of the 14th. The nearly full moon will block out all but the brightest meteors this year. But if you are patient\\n, you may still be able to catch a few good ones. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Gemini\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20241215",
          "DTEND;VALUE=DATE": "20241216",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "fullmoon_2024121520241216@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 09:03 UTC. This full moon was known by early Native American tribes as the Full Cold Moon because this is the time of year when the cold winter air settles in and the nights become long and dark. This moon has also been known as the Full Long Nights Moon and the Moon Before Yule."
        },
        {
          "SUMMARY": "December Solstice",
          "DTSTART;VALUE=DATE": "20241221",
          "DTEND;VALUE=DATE": "20241222",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "decembersolstice_2024122120241222@seasky.org",
          "DESCRIPTION": "The December solstice occurs at 09:17 UTC. The South Pole of the earth will be tilted toward the Sun\\n, which will have reached its southernmost position in the sky and will be directly over the Tropic of Capricorn at 23.44 degrees south latitude. This is the first day of winter (winter solstice) in the Northern Hemisphere and the first day of summer (summer solstice) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Ursids Meteor Shower",
          "DTSTART;VALUE=DATE": "20241221",
          "DTEND;VALUE=DATE": "20241223",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "ursidsmeteorshower_2024122120241223@seasky.org",
          "DESCRIPTION": "The Ursids is a minor meteor shower producing about 5-10 meteors per hour. It is produced by dust grains left behind by comet Tuttle\\n, which was first discovered in 1790. The shower runs annually from December 17-25. It peaks this year on the the night of the 21st and morning of the 22nd. The waning gibbous moon will block out many of the fainter meteors this year. If you are patient\\n, you should still be able to catch some of the brighter ones. Best viewing will be just after midnight from a dark location far away from city lights. Meteors will radiate from the constellation Ursa Minor\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20241225",
          "DTEND;VALUE=DATE": "20241226",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "mercuryatgreatestwesternelongation_2024122520241226@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 22 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20241230",
          "DTEND;VALUE=DATE": "20241231",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194729Z",
          "UID": "newmoon_2024123020241231@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 22:28 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Quadrantids Meteor Shower",
          "DTSTART;VALUE=DATE": "20250103",
          "DTEND;VALUE=DATE": "20250105",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "quadrantidsmeteorshower_2025010320250105@seasky.org",
          "DESCRIPTION": "The Quadrantids is an above average shower\\n, with up to 40 meteors per hour at its peak. It is thought to be produced by dust grains left behind by an extinct comet known as 2003 EH1\\n, which was discovered in 2003. The shower runs annually from January 1-5. It peaks this year on the night of the 3rd and  morning of the 4th. The crescent moon will set early in the evening\\n, leaving dark skies for what should be an excellent show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Bootes\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Venus at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20250110",
          "DTEND;VALUE=DATE": "20250111",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "venusatgreatesteasternelongation_2025011020250111@seasky.org",
          "DESCRIPTION": "The planet Venus reaches greatest eastern elongation of 47.2 degrees from the Sun. This is the best time to view Venus since it will be at its highest point above the horizon in the evening sky. Look for the bright planet in the western sky after sunset."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20250113",
          "DTEND;VALUE=DATE": "20250114",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "fullmoon_2025011320250114@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 22:28 UTC. This full moon was known by early Native American tribes as the Full Wolf Moon because this was the time of year when hungry wolf packs howled outside their camps. This moon has also been know as the Old Moon and the Moon After Yule."
        },
        {
          "SUMMARY": "Mars at Opposition",
          "DTSTART;VALUE=DATE": "20250116",
          "DTEND;VALUE=DATE": "20250117",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "marsatopposition_2025011620250117@seasky.org",
          "DESCRIPTION": "The red planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Mars. A medium-sized telescope will allow you to see some of the dark details on the planet's orange surface."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20250129",
          "DTEND;VALUE=DATE": "20250130",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "newmoon_2025012920250130@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 12:37 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20250212",
          "DTEND;VALUE=DATE": "20250213",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "fullmoon_2025021220250213@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 13:55 UTC. This full moon was known by early Native American tribes as the Full Snow Moon because the heaviest snows usually fell during this time of the year. Since hunting is difficult\\n, this moon has also been known by some tribes as the Full Hunger Moon\\n, since the harsh weather made hunting difficult.\\nn"
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20250228",
          "DTEND;VALUE=DATE": "20250301",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "newmoon_2025022820250301@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 00:46 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20250308",
          "DTEND;VALUE=DATE": "20250309",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "mercuryatgreatesteasternelongation_2025030820250309@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 18.2 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20250314",
          "DTEND;VALUE=DATE": "20250315",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "fullmoon_2025031420250315@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 06:56 UTC. This full moon was known by early Native American tribes as the Full Worm Moon because this was the time of year when the ground would begin to soften and the earthworms would reappear. This moon has also been known as the Full Crow Moon\\n, the Full Crust Moon\\n, the Full Sap Moon\\n, and the Lenten Moon.\\nn"
        },
        {
          "SUMMARY": "Total Lunar Eclipse",
          "DTSTART;VALUE=DATE": "20250314",
          "DTEND;VALUE=DATE": "20250315",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "totallunareclipse_2025031420250315@seasky.org",
          "DESCRIPTION": "A total lunar eclipse occurs when the Moon passes completely through the Earth's dark shadow\\n, or umbra. During this type of eclipse\\n, the Moon will gradually get darker and then take on a rusty or blood red color. The eclipse will be visible throughout all of North America\\n, Mexico\\n, Central America\\n, and South America. ()"
        },
        {
          "SUMMARY": "March Equinox",
          "DTSTART;VALUE=DATE": "20250320",
          "DTEND;VALUE=DATE": "20250321",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "marchequinox_2025032020250321@seasky.org",
          "DESCRIPTION": "The March equinox occurs at 08:58 UTC. The Sun will shine directly on the equator and there will be nearly equal amounts of day and night throughout the world. This is also the first day of spring (vernal equinox) in the Northern Hemisphere and the first day of fall (autumnal equinox) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20250329",
          "DTEND;VALUE=DATE": "20250330",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "newmoon_2025032920250330@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 11:00 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Partial Solar Eclipse",
          "DTSTART;VALUE=DATE": "20250329",
          "DTEND;VALUE=DATE": "20250330",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "partialsolareclipse_2025032920250330@seasky.org",
          "DESCRIPTION": "A partial solar eclipse occurs when the Moon covers only a part of the Sun\\n, sometimes resembling a bite taken out of a cookie. A partial solar eclipse can only be safely observed with a special solar filter or by looking at the Sun's reflection. This partial eclipse will be visible throughout Greenland and most of northern Europe and northern Russia. It will be best seen from Canada with 93% coverage.\\nn        ()"
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20250413",
          "DTEND;VALUE=DATE": "20250414",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "fullmoon_2025041320250414@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 00:24 UTC. This full moon was known by early Native American tribes as the Full Pink Moon because it marked the appearance of the moss pink\\n, or wild ground phlox\\n, which is one of the first spring flowers. This moon has also been known as the Sprouting Grass Moon\\n, the Growing Moon\\n, and the Egg Moon. Many coastal tribes called it the Full Fish Moon because this was the time that the shad swam upstream to spawn."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20250421",
          "DTEND;VALUE=DATE": "20250422",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "mercuryatgreatestwesternelongation_2025042120250422@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 27.4 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "Lyrids Meteor Shower",
          "DTSTART;VALUE=DATE": "20250422",
          "DTEND;VALUE=DATE": "20250424",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "lyridsmeteorshower_2025042220250424@seasky.org",
          "DESCRIPTION": "The Lyrids is an average shower\\n, usually producing about 20 meteors per hour at its peak. It is produced by dust particles left behind by comet C/1861 G1 Thatcher\\n, which was discovered in 1861. The shower runs annually from April 16-25. It peaks this year on the night of the night of the 22nd and morning of the 23rd. These meteors can sometimes produce bright dust trails that last for several seconds.  The thin crescent moon will not pose much of a problem so this should be a good show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Lyra\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20250427",
          "DTEND;VALUE=DATE": "20250428",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "newmoon_2025042720250428@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 19:32 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Eta Aquarids Meteor Shower",
          "DTSTART;VALUE=DATE": "20250506",
          "DTEND;VALUE=DATE": "20250508",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "etaaquaridsmeteorshower_2025050620250508@seasky.org",
          "DESCRIPTION": "The Eta Aquarids is an above average shower\\n, capable of producing up to 60 meteors per hour at its peak. Most of the activity is seen in the Southern Hemisphere. In the Northern Hemisphere\\n, the rate can reach about 30 meteors per hour. It is produced by dust particles left behind by comet Halley\\n, which has known and observed since ancient times. The shower runs annually from April 19 to May 28. It peaks this year on the night of May 6 and the morning of the May 7. The waxing gibbous moon will block out some of the fainter meteors this year. But if you are patient\\n, you should still should be able to catch a some of the brighter ones. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Aquarius\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20250512",
          "DTEND;VALUE=DATE": "20250513",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "fullmoon_2025051220250513@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 16:57 UTC. This full moon was known by early Native American tribes as the Full Flower Moon because this was the time of year when spring flowers appeared in abundance. This moon has also been known as the Full Corn Planting Moon and the Milk Moon."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20250527",
          "DTEND;VALUE=DATE": "20250528",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "newmoon_2025052720250528@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 03:04 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Venus at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20250531",
          "DTEND;VALUE=DATE": "20250601",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "venusatgreatestwesternelongation_2025053120250601@seasky.org",
          "DESCRIPTION": "The planet Venus reaches greatest eastern elongation of 45.9 degrees from the Sun. This is the best time to view Venus since it will be at its highest point above the horizon in the morning sky. Look for the bright planet in the eastern sky before sunrise."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20250611",
          "DTEND;VALUE=DATE": "20250612",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "fullmoon_2025061120250612@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 07:45 UTC. This full moon was known by early Native American tribes as the Full Strawberry Moon because it signaled the time of year to gather ripening fruit. It also coincides with the peak of the strawberry harvesting season. This moon has also been known as the Full Rose Moon and the Full Honey Moon."
        },
        {
          "SUMMARY": "June Solstice",
          "DTSTART;VALUE=DATE": "20250621",
          "DTEND;VALUE=DATE": "20250622",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "junesolstice_2025062120250622@seasky.org",
          "DESCRIPTION": "The June solstice occurs at 02:40 UTC. The North Pole of the earth will be tilted toward the Sun\\n, which will have reached its northernmost position in the sky and will be directly over the Tropic of Cancer at 23.44 degrees north latitude. This is the first day of summer (summer solstice) in the Northern Hemisphere and the first day of winter (winter solstice) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20250625",
          "DTEND;VALUE=DATE": "20250626",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "newmoon_2025062520250626@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 10:33 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20250704",
          "DTEND;VALUE=DATE": "20250705",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "mercuryatgreatesteasternelongation_2025070420250705@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 25.9 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20250710",
          "DTEND;VALUE=DATE": "20250711",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "fullmoon_2025071020250711@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 20:38 UTC. This full moon was known by early Native American tribes as the Full Buck Moon because the male buck deer would begin to grow their new antlers at this time of year. This moon has also been known as the Full Thunder Moon and the Full Hay Moon."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20250724",
          "DTEND;VALUE=DATE": "20250725",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "newmoon_2025072420250725@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 19:13 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Delta Aquarids Meteor Shower",
          "DTSTART;VALUE=DATE": "20250728",
          "DTEND;VALUE=DATE": "20250730",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "deltaaquaridsmeteorshower_2025072820250730@seasky.org",
          "DESCRIPTION": "The Delta Aquarids is an average shower that can produce up to 20 meteors per hour at its peak. It is produced by debris left behind by comets Marsden and Kracht. The shower runs annually from July 12 to August 23. It peaks this year on the night of July 28 and morning of July 29. The crescent moon will set early in the evening\\n, leaving dark skies for what should be an excellent show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Aquarius\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20250809",
          "DTEND;VALUE=DATE": "20250810",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "fullmoon_2025080920250810@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 07:56 UTC. This full moon was known by early Native American tribes as the Full Sturgeon Moon because the large sturgeon fish of the Great Lakes and other major lakes were more easily caught at this time of year. This moon has also been known as the Green Corn Moon and the Grain Moon."
        },
        {
          "SUMMARY": "Perseids Meteor Shower",
          "DTSTART;VALUE=DATE": "20250812",
          "DTEND;VALUE=DATE": "20250814",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "perseidsmeteorshower_2025081220250814@seasky.org",
          "DESCRIPTION": "The Perseids is one of the best meteor showers to observe\\n, producing up to 60 meteors per hour at its peak. It is produced by comet Swift-Tuttle\\n, which was discovered in 1862. The Perseids are famous for producing a large number of bright meteors. The shower runs annually from July 17 to August 24. It peaks this year on the night of August 12 and the morning of August 13. The waning gibbous moon will block out all but the brightest meteors this year. But if you are patient\\n, you may still be able to catch quite a few good ones. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Perseus\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20250819",
          "DTEND;VALUE=DATE": "20250820",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "mercuryatgreatestwesternelongation_2025081920250820@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 18.6 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20250823",
          "DTEND;VALUE=DATE": "20250824",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "newmoon_2025082320250824@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 06:08 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20250907",
          "DTEND;VALUE=DATE": "20250908",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "fullmoon_2025090720250908@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 18:10 UTC. This full moon was known by early Native American tribes as the Full Corn Moon because the corn is harvested around this time of year. This moon is also known as the Harvest Moon. The Harvest Moon is the full moon that occurs closest to the September equinox each year."
        },
        {
          "SUMMARY": "Total Lunar Eclipse",
          "DTSTART;VALUE=DATE": "20250907",
          "DTEND;VALUE=DATE": "20250908",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "totallunareclipse_2025090720250908@seasky.org",
          "DESCRIPTION": "A total lunar eclipse occurs when the Moon passes completely through the Earth's dark shadow\\n, or umbra. During this type of eclipse\\n, the Moon will gradually get darker and then take on a rusty or blood red color. The eclipse will be visible throughout all of Asia and Australia and the central and eastern parts of Europe and Africa. ()"
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20250921",
          "DTEND;VALUE=DATE": "20250922",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "newmoon_2025092120250922@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 19:55 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Partial Solar Eclipse",
          "DTSTART;VALUE=DATE": "20250921",
          "DTEND;VALUE=DATE": "20250922",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "partialsolareclipse_2025092120250922@seasky.org",
          "DESCRIPTION": "A partial solar eclipse occurs when the Moon covers only a part of the Sun\\n, sometimes resembling a bite taken out of a cookie. A partial solar eclipse can only be safely observed with a special solar filter or by looking at the Sun's reflection. This partial eclipse will only be visible in New Zealand\\n, Antarctica\\n, and the southern Pacific Ocean. It will be best seen from New Zealand with 76% coverage.\\nn        ()"
        },
        {
          "SUMMARY": "Saturn at Opposition",
          "DTSTART;VALUE=DATE": "20250921",
          "DTEND;VALUE=DATE": "20250922",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "saturnatopposition_2025092120250922@seasky.org",
          "DESCRIPTION": "The ringed planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Saturn and its moons. A medium-sized or larger telescope will allow you to see Saturn's rings and a few of its brightest moons."
        },
        {
          "SUMMARY": "September Equinox",
          "DTSTART;VALUE=DATE": "20250922",
          "DTEND;VALUE=DATE": "20250923",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "septemberequinox_2025092220250923@seasky.org",
          "DESCRIPTION": "The September equinox occurs at 18:17 UTC. The Sun will shine directly on the equator and there will be nearly equal amounts of day and night throughout the world. This is also the first day of fall (autumnal equinox) in the Northern Hemisphere and the first day of spring (vernal equinox) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Neptune at Opposition",
          "DTSTART;VALUE=DATE": "20250923",
          "DTEND;VALUE=DATE": "20250924",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "neptuneatopposition_2025092320250924@seasky.org",
          "DESCRIPTION": "The blue giant planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Neptune. Due to its extreme distance from Earth\\n, it will only appear as a tiny blue dot in all but the most powerful telescopes."
        },
        {
          "SUMMARY": "Full Moon\\n, Supermoon",
          "DTSTART;VALUE=DATE": "20251007",
          "DTEND;VALUE=DATE": "20251008",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "fullmoon\\n,supermoon_2025100720251008@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 03:49 UTC. This full moon was known by early Native American tribes as the Full Hunters Moon because at this time of year the leaves are falling and the game is fat and ready to hunt. This moon has also been known as the Travel Moon and the Blood Moon. This is also the first of three supermoons for 2025. The Moon will be at its closest approach to the Earth and may look slightly larger and brighter than usual."
        },
        {
          "SUMMARY": "Draconids Meteor Shower",
          "DTSTART;VALUE=DATE": "20251007",
          "DTEND;VALUE=DATE": "20251008",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "draconidsmeteorshower_2025100720251008@seasky.org",
          "DESCRIPTION": "The Draconids is a minor meteor shower producing only about 10 meteors per hour. It is produced by dust grains left behind by comet 21P Giacobini-Zinner\\n, which was first discovered in 1900. The Draconids is an unusual shower in that the best viewing is in the early evening instead of early morning like most other showers. The shower runs annually from October 6-10 and peaks this year on the the night of the 7th. Unfortunately the glare from the nearly full moon will block most of the meteors this year. Combined with the low hourly rate it would probably be best to skip this one unless you are really patient. Best viewing will be in the early evening from a dark location far away from city lights. Meteors will radiate from the constellation Draco\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20251021",
          "DTEND;VALUE=DATE": "20251022",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "newmoon_2025102120251022@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 12:26 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Orionids Meteor Shower",
          "DTSTART;VALUE=DATE": "20251021",
          "DTEND;VALUE=DATE": "20251023",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "orionidsmeteorshower_2025102120251023@seasky.org",
          "DESCRIPTION": "The Orionids is an average shower producing up to 20 meteors per hour at its peak. It is produced by dust grains left behind by comet Halley\\n, which has been known and observed since ancient times. The shower runs annually from October 2 to November 7. It peaks this year on the night of October 21 and the morning of October 22. This is an excellent year for the Orionids. The moon will be absent all night long\\n, leaving dark skies for what should be an excellent show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Orion\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20251029",
          "DTEND;VALUE=DATE": "20251030",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "mercuryatgreatesteasternelongation_2025102920251030@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 23.9 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "Taurids Meteor Shower",
          "DTSTART;VALUE=DATE": "20251104",
          "DTEND;VALUE=DATE": "20251106",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "tauridsmeteorshower_2025110420251106@seasky.org",
          "DESCRIPTION": "The Taurids is a long-running minor meteor shower producing only about 5-10 meteors per hour. It is unusual in that it consists of two separate streams. The first is produced by dust grains left behind by Asteroid 2004 TG10. The second stream is produced by debris left behind by Comet 2P Encke. The shower runs annually from September 7 to December 10. It peaks this year on the the night of November 4. Unfortunately the glare form the full moon will hide most of the meteors this year. If you are really patient\\n, you may still be able to catch a few bright ones. Best viewing will be just after midnight from a dark location far away from city lights. Meteors will radiate from the constellation Taurus\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon\\n, Supermoon",
          "DTSTART;VALUE=DATE": "20251105",
          "DTEND;VALUE=DATE": "20251106",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "fullmoon\\n,supermoon_2025110520251106@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 13:21 UTC. This full moon was known by early Native American tribes as the Full Beaver Moon because this was the time of year to set the beaver traps before the swamps and rivers froze. It has also been known as the Frosty Moon and the Hunter's Moon. This is also the second of three supermoons for 2025. The Moon will be at its closest approach to the Earth and may look slightly larger and brighter than usual."
        },
        {
          "SUMMARY": "Leonids Meteor Shower",
          "DTSTART;VALUE=DATE": "20251117",
          "DTEND;VALUE=DATE": "20251119",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "leonidsmeteorshower_2025111720251119@seasky.org",
          "DESCRIPTION": "The Leonids is an average shower\\n, producing up to 15 meteors per hour at its peak. This shower is unique in that it has a cyclonic peak about every 33 years where hundreds of meteors per hour can be seen. That last of these occurred in 2001. The Leonids is produced by dust grains left behind by comet Tempel-Tuttle\\n, which was discovered in 1865. The shower runs annually from November 6-30. It peaks this year on the night of the 17th and morning of the 18th. This should be an excellent year for the Leonids. The thin\\n, crescent moon won't be much of a problem and skies will be dark enough for what should be an great show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Leo\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20251120",
          "DTEND;VALUE=DATE": "20251121",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "newmoon_2025112020251121@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 06:49 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Uranus at Opposition",
          "DTSTART;VALUE=DATE": "20251121",
          "DTEND;VALUE=DATE": "20251122",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "uranusatopposition_2025112120251122@seasky.org",
          "DESCRIPTION": "The blue-green planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view Uranus. Due to its distance\\n, it will only appear as a tiny blue-green dot in all but the most powerful telescopes."
        },
        {
          "SUMMARY": "Full Moon\\n, Supermoon",
          "DTSTART;VALUE=DATE": "20251204",
          "DTEND;VALUE=DATE": "20251205",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "fullmoon\\n,supermoon_2025120420251205@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 23:15 UTC. This full moon was known by early Native American tribes as the Full Cold Moon because this is the time of year when the cold winter air settles in and the nights become long and dark. This moon has also been known as the Full Long Nights Moon and the Moon Before Yule. This is also the last of three supermoons for 2025. The Moon will be at its closest approach to the Earth and may look slightly larger and brighter than usual."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20251207",
          "DTEND;VALUE=DATE": "20251208",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "mercuryatgreatestwesternelongation_2025120720251208@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 20.7 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "Geminids Meteor Shower",
          "DTSTART;VALUE=DATE": "20251213",
          "DTEND;VALUE=DATE": "20251215",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "geminidsmeteorshower_2025121320251215@seasky.org",
          "DESCRIPTION": "The Geminids is the  king of the meteor showers. It is considered by many to be the best shower in the heavens\\n, producing up to 120 multicolored meteors per hour at its peak. It is produced by debris left behind by an asteroid known as 3200 Phaethon\\n, which was discovered in 1982. The shower runs annually from December 7-17. It peaks this year on the night of the 13th and morning of the 14th. The second quarter moon will block some of the fainter meteors this year\\n, but the Geminids are so numerous that it should still be a good show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Gemini\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20251220",
          "DTEND;VALUE=DATE": "20251221",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "newmoon_2025122020251221@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 01:45 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "December Solstice",
          "DTSTART;VALUE=DATE": "20251221",
          "DTEND;VALUE=DATE": "20251222",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "decembersolstice_2025122120251222@seasky.org",
          "DESCRIPTION": "The December solstice occurs at 15:02 UTC. The South Pole of the earth will be tilted toward the Sun\\n, which will have reached its southernmost position in the sky and will be directly over the Tropic of Capricorn at 23.44 degrees south latitude. This is the first day of winter (winter solstice) in the Northern Hemisphere and the first day of summer (summer solstice) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Ursids Meteor Shower",
          "DTSTART;VALUE=DATE": "20251221",
          "DTEND;VALUE=DATE": "20251223",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194730Z",
          "UID": "ursidsmeteorshower_2025122120251223@seasky.org",
          "DESCRIPTION": "The Ursids is a minor meteor shower producing about 5-10 meteors per hour. It is produced by dust grains left behind by comet Tuttle\\n, which was first discovered in 1790. The shower runs annually from December 17-25. It peaks this year on the the night of the 21st and morning of the 22nd. The thin\\n, crescent moon will set early in the evening\\n, leaving dark skies for what should be a good show. Best viewing will be just after midnight from a dark location far away from city lights. Meteors will radiate from the constellation Ursa Minor\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon\\n, Supermoon",
          "DTSTART;VALUE=DATE": "20260103",
          "DTEND;VALUE=DATE": "20260104",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "fullmoon\\n,supermoon_2026010320260104@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 10:04 UTC. This full moon was known by early Native American tribes as the Full Wolf Moon because this was the time of year when hungry wolf packs howled outside their camps. This moon has also been know as the Old Moon and the Moon After Yule. This is also the first of three supermoons for 2026. The Moon will be at its closest approach to the Earth and may look slightly larger and brighter than usual."
        },
        {
          "SUMMARY": "Quadrantids Meteor Shower",
          "DTSTART;VALUE=DATE": "20260103",
          "DTEND;VALUE=DATE": "20260105",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "quadrantidsmeteorshower_2026010320260105@seasky.org",
          "DESCRIPTION": "The Quadrantids is an above average shower\\n, with up to 40 meteors per hour at its peak. It is thought to be produced by dust grains left behind by an extinct comet known as 2003 EH1\\n, which was discovered in 2003. The shower runs annually from January 1-5. It peaks this year on the night of the 3rd and  morning of the 4th. Unfortunately the full moon will obscure all but the brightest meteors this year. But if you are patient\\n, you may still be able to catch a few of the brighter ones. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Bootes\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20261201",
          "DTEND;VALUE=DATE": "20261202",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "newmoon_2026120120261202@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 06:22 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Jupiter at Opposition",
          "DTSTART;VALUE=DATE": "20260110",
          "DTEND;VALUE=DATE": "20260111",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "jupiteratopposition_2026011020260111@seasky.org",
          "DESCRIPTION": "The giant planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Jupiter and its moons. A medium-sized telescope should be able to show you some of the details in Jupiter's cloud bands. A good pair of binoculars should allow you to see Jupiter's four largest moons\\n, appearing as bright dots on either side of the planet."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20260118",
          "DTEND;VALUE=DATE": "20260119",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "newmoon_2026011820260119@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 19:53 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20260201",
          "DTEND;VALUE=DATE": "20260202",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "fullmoon_2026020120260202@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 20:11 UTC. This full moon was known by early Native American tribes as the Full Snow Moon because the heaviest snows usually fell during this time of the year. Since hunting is difficult\\n, this moon has also been known by some tribes as the Full Hunger Moon\\n, since the harsh weather made hunting difficult.\\nn"
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20260217",
          "DTEND;VALUE=DATE": "20260218",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "newmoon_2026021720260218@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 12:05 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Annular Solar Eclipse",
          "DTSTART;VALUE=DATE": "20260217",
          "DTEND;VALUE=DATE": "20260218",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "annularsolareclipse_2026021720260218@seasky.org",
          "DESCRIPTION": "An annular solar eclipse occurs when the Moon is too far away from the Earth to completely cover the Sun. This results in a ring of light around the darkened Moon. The Sun's corona is not visible during an annular eclipse.  This eclipse will only be visible in Antarctica and the southern Indian Ocean. () ()"
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20260219",
          "DTEND;VALUE=DATE": "20260220",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "mercuryatgreatesteasternelongation_2026021920260220@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 18.1 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20260303",
          "DTEND;VALUE=DATE": "20260304",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "fullmoon_2026030320260304@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 11:39 UTC. This full moon was known by early Native American tribes as the Full Worm Moon because this was the time of year when the ground would begin to soften and the earthworms would reappear. This moon has also been known as the Full Crow Moon\\n, the Full Crust Moon\\n, the Full Sap Moon\\n, and the Lenten Moon.\\nn"
        },
        {
          "SUMMARY": "Total Lunar Eclipse",
          "DTSTART;VALUE=DATE": "20260303",
          "DTEND;VALUE=DATE": "20260304",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "totallunareclipse_2026030320260304@seasky.org",
          "DESCRIPTION": "A total lunar eclipse occurs when the Moon passes completely through the Earth's dark shadow\\n, or umbra. During this type of eclipse\\n, the Moon will gradually get darker and then take on a rusty or blood red color. The eclipse will be visible throughout most of eastern Asia\\n, Australia\\n, the Pacific Ocean\\n, and North America. ()"
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20260319",
          "DTEND;VALUE=DATE": "20260320",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "newmoon_2026031920260320@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 01:26 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "March Equinox",
          "DTSTART;VALUE=DATE": "20260320",
          "DTEND;VALUE=DATE": "20260321",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "marchequinox_2026032020260321@seasky.org",
          "DESCRIPTION": "The March equinox occurs at 14:45 UTC. The Sun will shine directly on the equator and there will be nearly equal amounts of day and night throughout the world. This is also the first day of spring (vernal equinox) in the Northern Hemisphere and the first day of fall (autumnal equinox) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20260402",
          "DTEND;VALUE=DATE": "20260403",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "fullmoon_2026040220260403@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 02:13 UTC. This full moon was known by early Native American tribes as the Full Pink Moon because it marked the appearance of the moss pink\\n, or wild ground phlox\\n, which is one of the first spring flowers. This moon has also been known as the Sprouting Grass Moon\\n, the Growing Moon\\n, and the Egg Moon. Many coastal tribes called it the Full Fish Moon because this was the time that the shad swam upstream to spawn."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20260403",
          "DTEND;VALUE=DATE": "20260404",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "mercuryatgreatestwesternelongation_2026040320260404@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 27.8 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20260417",
          "DTEND;VALUE=DATE": "20260418",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "newmoon_2026041720260418@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 11:54 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Lyrids Meteor Shower",
          "DTSTART;VALUE=DATE": "20260422",
          "DTEND;VALUE=DATE": "20260424",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "lyridsmeteorshower_2026042220260424@seasky.org",
          "DESCRIPTION": "The Lyrids is an average shower\\n, usually producing about 20 meteors per hour at its peak. It is produced by dust particles left behind by comet C/1861 G1 Thatcher\\n, which was discovered in 1861. The shower runs annually from April 16-25. It peaks this year on the night of the night of the 22nd and morning of the 23rd. These meteors can sometimes produce bright dust trails that last for several seconds.  The first quarter moon will set shortly after midnight leaving dark skies for what should be a great show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Lyra\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20260501",
          "DTEND;VALUE=DATE": "20260502",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "fullmoon_2026050120260502@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 17:24 UTC. This full moon was known by early Native American tribes as the Full Flower Moon because this was the time of year when spring flowers appeared in abundance. This moon has also been known as the Full Corn Planting Moon and the Milk Moon."
        },
        {
          "SUMMARY": "Eta Aquarids Meteor Shower",
          "DTSTART;VALUE=DATE": "20260506",
          "DTEND;VALUE=DATE": "20260508",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "etaaquaridsmeteorshower_2026050620260508@seasky.org",
          "DESCRIPTION": "The Eta Aquarids is an above average shower\\n, capable of producing up to 60 meteors per hour at its peak. Most of the activity is seen in the Southern Hemisphere. In the Northern Hemisphere\\n, the rate can reach about 30 meteors per hour. It is produced by dust particles left behind by comet Halley\\n, which has known and observed since ancient times. The shower runs annually from April 19 to May 28. It peaks this year on the night of May 6 and the morning of the May 7. The waning gibbous moon will block out many of the fainter meteors this year. But if you are patient\\n, you should still should be able to catch some of the brighter ones. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Aquarius\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20260516",
          "DTEND;VALUE=DATE": "20260517",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "newmoon_2026051620260517@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 20:03 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Full Moon\\n, Blue Moon",
          "DTSTART;VALUE=DATE": "20260531",
          "DTEND;VALUE=DATE": "20260601",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "fullmoon\\n,bluemoon_2026053120260601@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 08:46 UTC.  Since this is the second full moon in the same month\\n, it is sometimes referred to as a blue moon. This rare calendar event only occurs one every few years\\n, giving rise to the term once in a blue moon."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20260615",
          "DTEND;VALUE=DATE": "20260616",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "newmoon_2026061520260616@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at  02:56 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20260615",
          "DTEND;VALUE=DATE": "20260616",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "mercuryatgreatesteasternelongation_2026061520260616@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 24.5 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "June Solstice",
          "DTSTART;VALUE=DATE": "20260621",
          "DTEND;VALUE=DATE": "20260622",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "junesolstice_2026062120260622@seasky.org",
          "DESCRIPTION": "The June solstice occurs at 08:25 UTC. The North Pole of the earth will be tilted toward the Sun\\n, which will have reached its northernmost position in the sky and will be directly over the Tropic of Cancer at 23.44 degrees north latitude. This is the first day of summer (summer solstice) in the Northern Hemisphere and the first day of winter (winter solstice) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20260629",
          "DTEND;VALUE=DATE": "20260630",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "fullmoon_2026062920260630@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 23:58 UTC. This full moon was known by early Native American tribes as the Full Strawberry Moon because it signaled the time of year to gather ripening fruit. It also coincides with the peak of the strawberry harvesting season. This moon has also been known as the Full Rose Moon and the Full Honey Moon."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20260714",
          "DTEND;VALUE=DATE": "20260715",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "newmoon_2026071420260715@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 09:45 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Delta Aquarids Meteor Shower",
          "DTSTART;VALUE=DATE": "20260728",
          "DTEND;VALUE=DATE": "20260730",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "deltaaquaridsmeteorshower_2026072820260730@seasky.org",
          "DESCRIPTION": "The Delta Aquarids is an average shower that can produce up to 20 meteors per hour at its peak. It is produced by debris left behind by comets Marsden and Kracht. The shower runs annually from July 12 to August 23. It peaks this year on the night of July 28 and morning of July 29. Unfortunately the full moon will obscure most of the meteors this year. But if you are patient\\n, you may still be able to catch a few of the brighter ones. Meteors will radiate from the constellation Aquarius\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20260729",
          "DTEND;VALUE=DATE": "20260730",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "fullmoon_2026072920260730@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 14:37 UTC. This full moon was known by early Native American tribes as the Full Buck Moon because the male buck deer would begin to grow their new antlers at this time of year. This moon has also been known as the Full Thunder Moon and the Full Hay Moon."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20260802",
          "DTEND;VALUE=DATE": "20260803",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "mercuryatgreatestwesternelongation_2026080220260803@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 19.5 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20260812",
          "DTEND;VALUE=DATE": "20260813",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "newmoon_2026081220260813@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 17:37 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Total Solar Eclipse",
          "DTSTART;VALUE=DATE": "20260812",
          "DTEND;VALUE=DATE": "20260813",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "totalsolareclipse_2026081220260813@seasky.org",
          "DESCRIPTION": "A total solar eclipse occurs when the moon completely blocks the Sun\\n, revealing the Sun's beautiful outer atmosphere known as the corona. The path of totality will begin in the Arctic Ocean off the Northern coast of Russia. It will move across Greenland\\n, Iceland\\n, and the Atlantic Ocean before ending in Spain. A partial eclipse will be visible Alaska\\n, Canada\\n, western Africa\\n, and the northern United States.\\nn        () ()"
        },
        {
          "SUMMARY": "Perseids Meteor Shower",
          "DTSTART;VALUE=DATE": "20260812",
          "DTEND;VALUE=DATE": "20260814",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "perseidsmeteorshower_2026081220260814@seasky.org",
          "DESCRIPTION": "The Perseids is one of the best meteor showers to observe\\n, producing up to 60 meteors per hour at its peak. It is produced by comet Swift-Tuttle\\n, which was discovered in 1862. The Perseids are famous for producing a large number of bright meteors. The shower runs annually from July 17 to August 24. It peaks this year on the night of August 12 and the morning of August 13. This is an excellent year for the Perseids. There will be no moonlight to interfere with the show so be prepared for what could be an impressive display. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Perseus\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Venus at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20260815",
          "DTEND;VALUE=DATE": "20260816",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "venusatgreatesteasternelongation_2026081520260816@seasky.org",
          "DESCRIPTION": "The planet Venus reaches greatest eastern elongation of 45.9 degrees from the Sun. This is the best time to view Venus since it will be at its highest point above the horizon in the evening sky. Look for the bright planet in the western sky after sunset."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20260828",
          "DTEND;VALUE=DATE": "20260829",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "fullmoon_2026082820260829@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 04:19 UTC. This full moon was known by early Native American tribes as the Full Sturgeon Moon because the large sturgeon fish of the Great Lakes and other major lakes were more easily caught at this time of year. This moon has also been known as the Green Corn Moon and the Grain Moon."
        },
        {
          "SUMMARY": "Partial Lunar Eclipse",
          "DTSTART;VALUE=DATE": "20260828",
          "DTEND;VALUE=DATE": "20260829",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "partiallunareclipse_2026082820260829@seasky.org",
          "DESCRIPTION": "A partial lunar eclipse occurs when the Moon passes through the Earth's partial shadow\\n, or penumbra\\n, and only a portion of it passes through the darkest shadow\\n, or umbra. During this type of eclipse a part of the Moon will darken as it moves through the Earth's shadow. The eclipse will be visible throughout most of North America\\n, Mexico\\n, Central America\\n, South America\\n, the Atlantic Ocean\\n, and most of Europe and Africa. ()"
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20260911",
          "DTEND;VALUE=DATE": "20260912",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "newmoon_2026091120260912@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 03:27 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "September Equinox",
          "DTSTART;VALUE=DATE": "20260923",
          "DTEND;VALUE=DATE": "20260924",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "septemberequinox_2026092320260924@seasky.org",
          "DESCRIPTION": "The September equinox occurs at 00:06 UTC. The Sun will shine directly on the equator and there will be nearly equal amounts of day and night throughout the world. This is also the first day of fall (autumnal equinox) in the Northern Hemisphere and the first day of spring (vernal equinox) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20260926",
          "DTEND;VALUE=DATE": "20260927",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "fullmoon_2026092620260927@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 16:50 UTC. This full moon was known by early Native American tribes as the Full Corn Moon because the corn is harvested around this time of year. This moon is also known as the Harvest Moon. The Harvest Moon is the full moon that occurs closest to the September equinox each year."
        },
        {
          "SUMMARY": "Neptune at Opposition",
          "DTSTART;VALUE=DATE": "20260925",
          "DTEND;VALUE=DATE": "20260926",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "neptuneatopposition_2026092520260926@seasky.org",
          "DESCRIPTION": "The blue giant planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Neptune. Due to its extreme distance from Earth\\n, it will only appear as a tiny blue dot in all but the most powerful telescopes."
        },
        {
          "SUMMARY": "Saturn at Opposition",
          "DTSTART;VALUE=DATE": "20261004",
          "DTEND;VALUE=DATE": "20261005",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "saturnatopposition_2026100420261005@seasky.org",
          "DESCRIPTION": "The ringed planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Saturn and its moons. A medium-sized or larger telescope will allow you to see Saturn's rings and a few of its brightest moons."
        },
        {
          "SUMMARY": "Draconids Meteor Shower",
          "DTSTART;VALUE=DATE": "20261007",
          "DTEND;VALUE=DATE": "20261008",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "draconidsmeteorshower_2026100720261008@seasky.org",
          "DESCRIPTION": "The Draconids is a minor meteor shower producing only about 10 meteors per hour. It is produced by dust grains left behind by comet 21P Giacobini-Zinner\\n, which was first discovered in 1900. The Draconids is an unusual shower in that the best viewing is in the early evening instead of early morning like most other showers. The shower runs annually from October 6-10 and peaks this year on the the night of the 7th. The waning crescent moon will not be much of a problem this year. Skies should be dark enough for a good show. Best viewing will be in the early evening from a dark location far away from city lights. Meteors will radiate from the constellation Draco\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20261010",
          "DTEND;VALUE=DATE": "20261011",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "newmoon_2026101020261011@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 15:50 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20261012",
          "DTEND;VALUE=DATE": "20261013",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "mercuryatgreatesteasternelongation_2026101220261013@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 19.6 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "Orionids Meteor Shower",
          "DTSTART;VALUE=DATE": "20261021",
          "DTEND;VALUE=DATE": "20261023",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "orionidsmeteorshower_2026102120261023@seasky.org",
          "DESCRIPTION": "The Orionids is an average shower producing up to 20 meteors per hour at its peak. It is produced by dust grains left behind by comet Halley\\n, which has been known and observed since ancient times. The shower runs annually from October 2 to November 7. It peaks this year on the night of October 21 and the morning of October 22. The waxing gibbous moon will block some of the fainter meteors in the evening. But it will set after midnight leaving dark skies for what could be an excellent early morning show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Orion\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20261026",
          "DTEND;VALUE=DATE": "20261027",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "fullmoon_2026102620261027@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 04:13 UTC. This full moon was known by early Native American tribes as the Full Hunters Moon because at this time of year the leaves are falling and the game is fat and ready to hunt. This moon has also been known as the Travel Moon and the Blood Moon."
        },
        {
          "SUMMARY": "Taurids Meteor Shower",
          "DTSTART;VALUE=DATE": "20261104",
          "DTEND;VALUE=DATE": "20261106",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "tauridsmeteorshower_2026110420261106@seasky.org",
          "DESCRIPTION": "The Taurids is a long-running minor meteor shower producing only about 5-10 meteors per hour. It is unusual in that it consists of two separate streams. The first is produced by dust grains left behind by Asteroid 2004 TG10. The second stream is produced by debris left behind by Comet 2P Encke. The shower runs annually from September 7 to December 10. It peaks this year on the the night of November 4. The waning crescent moon should not be too much of a problem this year. Skies should still be dark enough for a good show. Best viewing will be just after midnight from a dark location far away from city lights. Meteors will radiate from the constellation Taurus\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20261109",
          "DTEND;VALUE=DATE": "20261110",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "newmoon_2026110920261110@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 07:03 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Leonids Meteor Shower",
          "DTSTART;VALUE=DATE": "20261117",
          "DTEND;VALUE=DATE": "20261119",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "leonidsmeteorshower_2026111720261119@seasky.org",
          "DESCRIPTION": "The Leonids is an average shower\\n, producing up to 15 meteors per hour at its peak. This shower is unique in that it has a cyclonic peak about every 33 years where hundreds of meteors per hour can be seen. That last of these occurred in 2001. The Leonids is produced by dust grains left behind by comet Tempel-Tuttle\\n, which was discovered in 1865. The shower runs annually from November 6-30. It peaks this year on the night of the 17th and morning of the 18th. This should be good year for the Leonids. The waxing gibbous moon will block some of the fainter meteors in the early evening. But it will set shortly after midnight leaving dark skies for what should be an excellent early morning show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Leo\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20261120",
          "DTEND;VALUE=DATE": "20261121",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "mercuryatgreatestwesternelongation_2026112020261121@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 19.6 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "Full Moon\\n, Supermoon",
          "DTSTART;VALUE=DATE": "20261124",
          "DTEND;VALUE=DATE": "20261125",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "fullmoon\\n,supermoon_2026112420261125@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 14:55 UTC. This full moon was known by early Native American tribes as the Full Beaver Moon because this was the time of year to set the beaver traps before the swamps and rivers froze. It has also been known as the Frosty Moon and the Hunter's Moon. This is also the second of three supermoons for 2026. The Moon will be at its closest approach to the Earth and may look slightly larger and brighter than usual."
        },
        {
          "SUMMARY": "Uranus at Opposition",
          "DTSTART;VALUE=DATE": "20261125",
          "DTEND;VALUE=DATE": "20261126",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "uranusatopposition_2026112520261126@seasky.org",
          "DESCRIPTION": "The blue-green planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view Uranus. Due to its distance\\n, it will only appear as a tiny blue-green dot in all but the most powerful telescopes."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20261209",
          "DTEND;VALUE=DATE": "20261210",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "newmoon_2026120920261210@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 00:52 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Geminids Meteor Shower",
          "DTSTART;VALUE=DATE": "20261213",
          "DTEND;VALUE=DATE": "20261215",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "geminidsmeteorshower_2026121320261215@seasky.org",
          "DESCRIPTION": "The Geminids is the  king of the meteor showers. It is considered by many to be the best shower in the heavens\\n, producing up to 120 multicolored meteors per hour at its peak. It is produced by debris left behind by an asteroid known as 3200 Phaethon\\n, which was discovered in 1982. The shower runs annually from December 7-17. It peaks this year on the night of the 13th and morning of the 14th. This is an excellent year for viewing the Geminids. The waxing crescent moon will set early in the evening leaving dark skies for what should be an excellent show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Gemini\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "December Solstice",
          "DTSTART;VALUE=DATE": "20261221",
          "DTEND;VALUE=DATE": "20261222",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "decembersolstice_2026122120261222@seasky.org",
          "DESCRIPTION": "The December solstice occurs at 15:02 UTC. The South Pole of the earth will be tilted toward the Sun\\n, which will have reached its southernmost position in the sky and will be directly over the Tropic of Capricorn at 23.44 degrees south latitude. This is the first day of winter (winter solstice) in the Northern Hemisphere and the first day of summer (summer solstice) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Ursids Meteor Shower",
          "DTSTART;VALUE=DATE": "20261221",
          "DTEND;VALUE=DATE": "20261223",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "ursidsmeteorshower_2026122120261223@seasky.org",
          "DESCRIPTION": "The Ursids is a minor meteor shower producing about 5-10 meteors per hour. It is produced by dust grains left behind by comet Tuttle\\n, which was first discovered in 1790. The shower runs annually from December 17-25. It peaks this year on the the night of the 21st and morning of the 22nd. Unfortunately the near full moon will block all but the brightest meteors this year. If you are extremely patient\\n, you may be able to catch a few of the brighter ones. Best viewing will be just after midnight from a dark location far away from city lights. Meteors will radiate from the constellation Ursa Minor\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon\\n, Supermoon",
          "DTSTART;VALUE=DATE": "20261223",
          "DTEND;VALUE=DATE": "20261224",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194731Z",
          "UID": "fullmoon\\n,supermoon_2026122320261224@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 01:30 UTC. This full moon was known by early Native American tribes as the Full Cold Moon because this is the time of year when the cold winter air settles in and the nights become long and dark. This moon has also been known as the Full Long Nights Moon and the Moon Before Yule. This is also the last of three supermoons for 2026. The Moon will be at its closest approach to the Earth and may look slightly larger and brighter than usual."
        },
        {
          "SUMMARY": "Venus at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20270103",
          "DTEND;VALUE=DATE": "20270104",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "venusatgreatestwesternelongation_2027010320270104@seasky.org",
          "DESCRIPTION": "The planet Venus reaches greatest eastern elongation of 47 degrees from the Sun. This is the best time to view Venus since it will be at its highest point above the horizon in the morning sky. Look for the bright planet in the eastern sky before sunrise."
        },
        {
          "SUMMARY": "Quadrantids Meteor Shower",
          "DTSTART;VALUE=DATE": "20270103",
          "DTEND;VALUE=DATE": "20270105",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "quadrantidsmeteorshower_2027010320270105@seasky.org",
          "DESCRIPTION": "The Quadrantids is an above average shower\\n, with up to 40 meteors per hour at its peak. It is thought to be produced by dust grains left behind by an extinct comet known as 2003 EH1\\n, which was discovered in 2003. The shower runs annually from January 1-5. It peaks this year on the night of the 3rd and  morning of the 4th. The crescent moon should not be too much of a problem this year. Skies should be dark enough for a good show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Bootes\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20270107",
          "DTEND;VALUE=DATE": "20270108",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "newmoon_2027010720270108@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 20:25 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Full Moon\\n, Supermoon",
          "DTSTART;VALUE=DATE": "20270122",
          "DTEND;VALUE=DATE": "20270123",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "fullmoon\\n,supermoon_2027012220270123@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 12:18 UTC. This full moon was known by early Native American tribes as the Full Wolf Moon because this was the time of year when hungry wolf packs howled outside their camps. This moon has also been know as the Old Moon and the Moon After Yule. This is also the first of two supermoons for 2027. The Moon will be at its closest approach to the Earth and may look slightly larger and brighter than usual."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20270203",
          "DTEND;VALUE=DATE": "20270204",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "mercuryatgreatesteasternelongation_2027020320270204@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 18.3 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20270206",
          "DTEND;VALUE=DATE": "20270207",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "newmoon_2027020620270207@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 15:57 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Annular Solar Eclipse",
          "DTSTART;VALUE=DATE": "20270206",
          "DTEND;VALUE=DATE": "20270207",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "annularsolareclipse_2027020620270207@seasky.org",
          "DESCRIPTION": "An annular solar eclipse occurs when the Moon is too far away from the Earth to completely cover the Sun. This results in a ring of light around the darkened Moon. The Sun's corona is not visible during an annular eclipse.  The path of the eclipse will begin in the southern Pacific Ocean and move across Chile and Argentina before moving into the Atlantic Ocean. A partial eclipse will be visible throughout most of South America and parts of western Africa. ()\\nn        ()"
        },
        {
          "SUMMARY": "Jupiter at Opposition",
          "DTSTART;VALUE=DATE": "20270210",
          "DTEND;VALUE=DATE": "20270211",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "jupiteratopposition_2027021020270211@seasky.org",
          "DESCRIPTION": "The giant planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Jupiter and its moons. A medium-sized telescope should be able to show you some of the details in Jupiter's cloud bands. A good pair of binoculars should allow you to see Jupiter's four largest moons\\n, appearing as bright dots on either side of the planet."
        },
        {
          "SUMMARY": "Mars at Opposition",
          "DTSTART;VALUE=DATE": "20270219",
          "DTEND;VALUE=DATE": "20270220",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "marsatopposition_2027021920270220@seasky.org",
          "DESCRIPTION": "The red planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Mars. A medium-sized telescope will allow you to see some of the dark details on the planet's orange surface."
        },
        {
          "SUMMARY": "Full Moon\\n, Supermoon",
          "DTSTART;VALUE=DATE": "20270220",
          "DTEND;VALUE=DATE": "20270221",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "fullmoon\\n,supermoon_2027022020270221@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 23:24 UTC. This full moon was known by early Native American tribes as the Full Snow Moon because the heaviest snows usually fell during this time of the year. Since hunting is difficult\\n, this moon has also been known by some tribes as the Full Hunger Moon\\n, since the harsh weather made hunting difficult. This is also the last of two supermoons for 2027. The Moon will be at its closest approach to the Earth and may look slightly larger and brighter than usual.\\nn"
        },
        {
          "SUMMARY": "Penumbral Lunar Eclipse",
          "DTSTART;VALUE=DATE": "20270220",
          "DTEND;VALUE=DATE": "20270221",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "penumbrallunareclipse_2027022020270221@seasky.org",
          "DESCRIPTION": "A penumbral lunar eclipse occurs when the Moon passes through the Earth's partial shadow\\n, or penumbra. During this type of eclipse the Moon will darken slightly but not completely. The eclipse will be visible throughout eastern North America\\n, Mexico\\n, Central America\\n, South America\\n, Africa\\n, Europe\\n, western Asia\\n, and western Australia. ()"
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20270308",
          "DTEND;VALUE=DATE": "20270309",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "newmoon_2027030820270309@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 09:31 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20270317",
          "DTEND;VALUE=DATE": "20270318",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "mercuryatgreatestwesternelongation_2027031720270318@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 27.6 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "March Equinox",
          "DTSTART;VALUE=DATE": "20270320",
          "DTEND;VALUE=DATE": "20270321",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "marchequinox_2027032020270321@seasky.org",
          "DESCRIPTION": "The March equinox occurs at 20:26 UTC. The Sun will shine directly on the equator and there will be nearly equal amounts of day and night throughout the world. This is also the first day of spring (vernal equinox) in the Northern Hemisphere and the first day of fall (autumnal equinox) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20270322",
          "DTEND;VALUE=DATE": "20270323",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "fullmoon_2027032220270323@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 10:44 UTC. This full moon was known by early Native American tribes as the Full Worm Moon because this was the time of year when the ground would begin to soften and the earthworms would reappear. This moon has also been known as the Full Crow Moon\\n, the Full Crust Moon\\n, the Full Sap Moon\\n, and the Lenten Moon.\\nn"
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20270406",
          "DTEND;VALUE=DATE": "20270407",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "newmoon_2027040620270407@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 23:53 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20270420",
          "DTEND;VALUE=DATE": "20270421",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "fullmoon_2027042020270421@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 22:27 UTC. This full moon was known by early Native American tribes as the Full Pink Moon because it marked the appearance of the moss pink\\n, or wild ground phlox\\n, which is one of the first spring flowers. This moon has also been known as the Sprouting Grass Moon\\n, the Growing Moon\\n, and the Egg Moon. Many coastal tribes called it the Full Fish Moon because this was the time that the shad swam upstream to spawn."
        },
        {
          "SUMMARY": "Lyrids Meteor Shower",
          "DTSTART;VALUE=DATE": "20270422",
          "DTEND;VALUE=DATE": "20270424",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "lyridsmeteorshower_2027042220270424@seasky.org",
          "DESCRIPTION": "The Lyrids is an average shower\\n, usually producing about 20 meteors per hour at its peak. It is produced by dust particles left behind by comet C/1861 G1 Thatcher\\n, which was discovered in 1861. The shower runs annually from April 16-25. It peaks this year on the night of the night of the 22nd and morning of the 23rd. These meteors can sometimes produce bright dust trails that last for several seconds.  The nearly full moon will obscure most of the fainter meteors this year. But if you are patient\\n, you should be able to catch a few of the brighter ones. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Lyra\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20270506",
          "DTEND;VALUE=DATE": "20270507",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "newmoon_2027050620270507@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 11:00 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Eta Aquarids Meteor Shower",
          "DTSTART;VALUE=DATE": "20270506",
          "DTEND;VALUE=DATE": "20270508",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "etaaquaridsmeteorshower_2027050620270508@seasky.org",
          "DESCRIPTION": "The Eta Aquarids is an above average shower\\n, capable of producing up to 60 meteors per hour at its peak. Most of the activity is seen in the Southern Hemisphere. In the Northern Hemisphere\\n, the rate can reach about 30 meteors per hour. It is produced by dust particles left behind by comet Halley\\n, which has known and observed since ancient times. The shower runs annually from April 19 to May 28. It peaks this year on the night of May 6 and the morning of the May 7. This is an excellent year for this meteor shower. The near total absence of the moon means skies will be dark all night for what should be an great show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Aquarius\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon\\n, Blue Moon",
          "DTSTART;VALUE=DATE": "20270520",
          "DTEND;VALUE=DATE": "20270521",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "fullmoon\\n,bluemoon_2027052020270521@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 10:59 UTC. This full moon was known by early Native American tribes as the Full Flower Moon because this was the time of year when spring flowers appeared in abundance. This moon has also been known as the Full Corn Planting Moon and the Milk Moon. Since this is the third of four full moons in this season\\n, it is known as a blue moon. This rare calendar event only happens once every few years\\n, giving rise to the term\\n, “once in a blue moon.” There are normally only three full moons in each season of the year. But since full moons occur every 29.53 days\\n, occasionally a season will contain 4 full moons. The extra full moon of the season is known as a blue moon. Blue moons occur on average once every 2.7 years."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20270528",
          "DTEND;VALUE=DATE": "20270529",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "mercuryatgreatesteasternelongation_2027052820270529@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 22.9 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20270604",
          "DTEND;VALUE=DATE": "20270605",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "newmoon_2027060420270605@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 19:41 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20270619",
          "DTEND;VALUE=DATE": "20270620",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "fullmoon_2027061920270620@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 00:45 UTC. This full moon was known by early Native American tribes as the Full Strawberry Moon because it signaled the time of year to gather ripening fruit. It also coincides with the peak of the strawberry harvesting season. This moon has also been known as the Full Rose Moon and the Full Honey Moon."
        },
        {
          "SUMMARY": "June Solstice",
          "DTSTART;VALUE=DATE": "20270621",
          "DTEND;VALUE=DATE": "20270622",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "junesolstice_2027062120270622@seasky.org",
          "DESCRIPTION": "The June solstice occurs at 14:13 UTC. The North Pole of the earth will be tilted toward the Sun\\n, which will have reached its northernmost position in the sky and will be directly over the Tropic of Cancer at 23.44 degrees north latitude. This is the first day of summer (summer solstice) in the Northern Hemisphere and the first day of winter (winter solstice) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20270704",
          "DTEND;VALUE=DATE": "20270705",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "newmoon_2027070420270705@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 03:03 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20270715",
          "DTEND;VALUE=DATE": "20270716",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "mercuryatgreatestwesternelongation_2027071520270716@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 20.7 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20270718",
          "DTEND;VALUE=DATE": "20270719",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "fullmoon_2027071820270719@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 15:46 UTC. This full moon was known by early Native American tribes as the Full Buck Moon because the male buck deer would begin to grow their new antlers at this time of year. This moon has also been known as the Full Thunder Moon and the Full Hay Moon."
        },
        {
          "SUMMARY": "Penumbral Lunar Eclipse",
          "DTSTART;VALUE=DATE": "20270718",
          "DTEND;VALUE=DATE": "20270719",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "penumbrallunareclipse_2027071820270719@seasky.org",
          "DESCRIPTION": "A penumbral lunar eclipse occurs when the Moon passes through the Earth's partial shadow\\n, or penumbra. During this type of eclipse the Moon will darken slightly but not completely. The eclipse will be visible throughout eastern Africa\\n, southeast Asia\\n,  Australia\\n, and the Pacific Ocean.\\nn        ()"
        },
        {
          "SUMMARY": "Delta Aquarids Meteor Shower",
          "DTSTART;VALUE=DATE": "20270728",
          "DTEND;VALUE=DATE": "20270730",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "deltaaquaridsmeteorshower_2027072820270730@seasky.org",
          "DESCRIPTION": "The Delta Aquarids is an average shower that can produce up to 20 meteors per hour at its peak. It is produced by debris left behind by comets Marsden and Kracht. The shower runs annually from July 12 to August 23. It peaks this year on the night of July 28 and morning of July 29. The waning crescent moon may block some of the faintest meteors this year. But skies should still be dark enough for a good show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Aquarius\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20270802",
          "DTEND;VALUE=DATE": "20270803",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "newmoon_2027080220270803@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 10:06 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Total Solar Eclipse",
          "DTSTART;VALUE=DATE": "20270802",
          "DTEND;VALUE=DATE": "20270803",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "totalsolareclipse_2027080220270803@seasky.org",
          "DESCRIPTION": "A total solar eclipse occurs when the moon completely blocks the Sun\\n, revealing the Sun's beautiful outer atmosphere known as the corona. The path of totality will begin in the Atlantic Ocean off the coast of Africa and move across Morocco\\n, Spain\\n, Algeria\\n, Libya\\n, Egypt\\n, Saudi Arabia\\n, Yemen\\n, and Somalia before moving out into the Indian Ocean. A partial eclipse will be visible throughout most of northern and central Africa\\n, Europe\\n, western Russia\\n, the Middle East\\n, and India. () \\nn        ()"
        },
        {
          "SUMMARY": "Perseids Meteor Shower",
          "DTSTART;VALUE=DATE": "20270812",
          "DTEND;VALUE=DATE": "20270814",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "perseidsmeteorshower_2027081220270814@seasky.org",
          "DESCRIPTION": "The Perseids is one of the best meteor showers to observe\\n, producing up to 60 meteors per hour at its peak. It is produced by comet Swift-Tuttle\\n, which was discovered in 1862. The Perseids are famous for producing a large number of bright meteors. The shower runs annually from July 17 to August 24. It peaks this year on the night of August 12 and the morning of August 13. The waxing gibbous moon will block some of the fainter meteors this year. But the Perseids are so bright and numerous that this should still be a good show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Perseus\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20270817",
          "DTEND;VALUE=DATE": "20270818",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "fullmoon_2027081720270818@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 07:30 UTC. This full moon was known by early Native American tribes as the Full Sturgeon Moon because the large sturgeon fish of the Great Lakes and other major lakes were more easily caught at this time of year. This moon has also been known as the Green Corn Moon and the Grain Moon."
        },
        {
          "SUMMARY": "Penumbral Lunar Eclipse",
          "DTSTART;VALUE=DATE": "20270817",
          "DTEND;VALUE=DATE": "20270818",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "penumbrallunareclipse_2027081720270818@seasky.org",
          "DESCRIPTION": "A penumbral lunar eclipse occurs when the Moon passes through the Earth's partial shadow\\n, or penumbra. During this type of eclipse the Moon will darken slightly but not completely. The eclipse will be visible throughout eastern Australia\\n, the Pacific Ocean\\n, North America\\n, Mexico\\n, Central America\\n, South America\\n, and western Africa. ()"
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20270831",
          "DTEND;VALUE=DATE": "20270901",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "newmoon_2027083120270901@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 10:06 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20270915",
          "DTEND;VALUE=DATE": "20270916",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "fullmoon_2027091520270916@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 23:05 UTC. This full moon was known by early Native American tribes as the Full Corn Moon because the corn is harvested around this time of year. This moon is also known as the Harvest Moon. The Harvest Moon is the full moon that occurs closest to the September equinox each year."
        },
        {
          "SUMMARY": "September Equinox",
          "DTSTART;VALUE=DATE": "20270923",
          "DTEND;VALUE=DATE": "20270924",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "septemberequinox_2027092320270924@seasky.org",
          "DESCRIPTION": "The September equinox occurs at 06:04 UTC. The Sun will shine directly on the equator and there will be nearly equal amounts of day and night throughout the world. This is also the first day of fall (autumnal equinox) in the Northern Hemisphere and the first day of spring (vernal equinox) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20270924",
          "DTEND;VALUE=DATE": "20270925",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "mercuryatgreatesteasternelongation_2027092420270925@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 26.3 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "Neptune at Opposition",
          "DTSTART;VALUE=DATE": "20270928",
          "DTEND;VALUE=DATE": "20270929",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "neptuneatopposition_2027092820270929@seasky.org",
          "DESCRIPTION": "The blue giant planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Neptune. Due to its extreme distance from Earth\\n, it will only appear as a tiny blue dot in all but the most powerful telescopes."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20270930",
          "DTEND;VALUE=DATE": "20271001",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "newmoon_2027093020271001@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 02:36 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Draconids Meteor Shower",
          "DTSTART;VALUE=DATE": "20271007",
          "DTEND;VALUE=DATE": "20271008",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "draconidsmeteorshower_2027100720271008@seasky.org",
          "DESCRIPTION": "The Draconids is a minor meteor shower producing only about 10 meteors per hour. It is produced by dust grains left behind by comet 21P Giacobini-Zinner\\n, which was first discovered in 1900. The Draconids is an unusual shower in that the best viewing is in the early evening instead of early morning like most other showers. The shower runs annually from October 6-10 and peaks this year on the the night of the 7th. The glare from the first quarter moon will block many of the fainter meteors this year. But if you are patient\\n, you may still be able to catch a few of the brighter ones. Best viewing will be in the early evening from a dark location far away from city lights. Meteors will radiate from the constellation Draco\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20271015",
          "DTEND;VALUE=DATE": "20271016",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "fullmoon_2027101520271016@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 13:48 UTC. This full moon was known by early Native American tribes as the Full Hunters Moon because at this time of year the leaves are falling and the game is fat and ready to hunt. This moon has also been known as the Travel Moon and the Blood Moon."
        },
        {
          "SUMMARY": "Saturn at Opposition",
          "DTSTART;VALUE=DATE": "20271018",
          "DTEND;VALUE=DATE": "20271019",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "saturnatopposition_2027101820271019@seasky.org",
          "DESCRIPTION": "The ringed planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Saturn and its moons. A medium-sized or larger telescope will allow you to see Saturn's rings and a few of its brightest moons."
        },
        {
          "SUMMARY": "Orionids Meteor Shower",
          "DTSTART;VALUE=DATE": "20271021",
          "DTEND;VALUE=DATE": "20271023",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "orionidsmeteorshower_2027102120271023@seasky.org",
          "DESCRIPTION": "The Orionids is an average shower producing up to 20 meteors per hour at its peak. It is produced by dust grains left behind by comet Halley\\n, which has been known and observed since ancient times. The shower runs annually from October 2 to November 7. It peaks this year on the night of October 21 and the morning of October 22. The second quarter moon will block some of the fainter meteors this year. But if you are patient\\n, you should still be able to catch quite a few of the brighter ones. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Orion\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20271029",
          "DTEND;VALUE=DATE": "20271030",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "newmoon_2027102920271030@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 13:37 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20271104",
          "DTEND;VALUE=DATE": "20271105",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "mercuryatgreatestwesternelongation_2027110420271105@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 18.8 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "Taurids Meteor Shower",
          "DTSTART;VALUE=DATE": "20271104",
          "DTEND;VALUE=DATE": "20271106",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "tauridsmeteorshower_2027110420271106@seasky.org",
          "DESCRIPTION": "The Taurids is a long-running minor meteor shower producing only about 5-10 meteors per hour. It is unusual in that it consists of two separate streams. The first is produced by dust grains left behind by Asteroid 2004 TG10. The second stream is produced by debris left behind by Comet 2P Encke. The shower runs annually from September 7 to December 10. It peaks this year on the the night of November 4. The first quarter moon will block some of the fainter meteors in the evening. But it will set shortly after midnight\\n, leaving dark skies for what should be a good early morning show. Best viewing will be just after midnight from a dark location far away from city lights. Meteors will radiate from the constellation Taurus\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20271114",
          "DTEND;VALUE=DATE": "20271115",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "fullmoon_2027111420271115@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 03:27 UTC. This full moon was known by early Native American tribes as the Full Beaver Moon because this was the time of year to set the beaver traps before the swamps and rivers froze. It has also been known as the Frosty Moon and the Hunter's Moon."
        },
        {
          "SUMMARY": "Leonids Meteor Shower",
          "DTSTART;VALUE=DATE": "20271117",
          "DTEND;VALUE=DATE": "20271119",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "leonidsmeteorshower_2027111720271119@seasky.org",
          "DESCRIPTION": "The Leonids is an average shower\\n, producing up to 15 meteors per hour at its peak. This shower is unique in that it has a cyclonic peak about every 33 years where hundreds of meteors per hour can be seen. That last of these occurred in 2001. The Leonids is produced by dust grains left behind by comet Tempel-Tuttle\\n, which was discovered in 1865. The shower runs annually from November 6-30. It peaks this year on the night of the 17th and morning of the 18th. Unfortunately the nearly full moon will obscure all but the brightest meteors this year. But if you are patient\\n, you should still be able to catch a few good ones. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Leo\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20271128",
          "DTEND;VALUE=DATE": "20271129",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "newmoon_2027112820271129@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 03:25 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Uranus at Opposition",
          "DTSTART;VALUE=DATE": "20271130",
          "DTEND;VALUE=DATE": "20271201",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "uranusatopposition_2027113020271201@seasky.org",
          "DESCRIPTION": "The blue-green planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view Uranus. Due to its distance\\n, it will only appear as a tiny blue-green dot in all but the most powerful telescopes."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20271213",
          "DTEND;VALUE=DATE": "20271214",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "fullmoon_2027121320271214@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 16:10 UTC. This full moon was known by early Native American tribes as the Full Cold Moon because this is the time of year when the cold winter air settles in and the nights become long and dark. This moon has also been known as the Full Long Nights Moon and the Moon Before Yule."
        },
        {
          "SUMMARY": "Geminids Meteor Shower",
          "DTSTART;VALUE=DATE": "20271213",
          "DTEND;VALUE=DATE": "20271215",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "geminidsmeteorshower_2027121320271215@seasky.org",
          "DESCRIPTION": "The Geminids is the  king of the meteor showers. It is considered by many to be the best shower in the heavens\\n, producing up to 120 multicolored meteors per hour at its peak. It is produced by debris left behind by an asteroid known as 3200 Phaethon\\n, which was discovered in 1982. The shower runs annually from December 7-17. It peaks this year on the night of the 13th and morning of the 14th. Unfortunately the full moon will obscure most of the fainter meteors this year. But the Geminids are so numerous that if you are patient\\n, this could still be a good show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Gemini\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Ursids Meteor Shower",
          "DTSTART;VALUE=DATE": "20271221",
          "DTEND;VALUE=DATE": "20271223",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "ursidsmeteorshower_2027122120271223@seasky.org",
          "DESCRIPTION": "The Ursids is a minor meteor shower producing about 5-10 meteors per hour. It is produced by dust grains left behind by comet Tuttle\\n, which was first discovered in 1790. The shower runs annually from December 17-25. It peaks this year on the the night of the 21st and morning of the 22nd. The waning crescent moon will block some of the fainter meteors this year. But if you are patient\\n, you should still be able to catch a few of the brighter ones. Best viewing will be just after midnight from a dark location far away from city lights. Meteors will radiate from the constellation Ursa Minor\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "December Solstice",
          "DTSTART;VALUE=DATE": "20271222",
          "DTEND;VALUE=DATE": "20271223",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "decembersolstice_2027122220271223@seasky.org",
          "DESCRIPTION": "The December solstice occurs at 02:45 UTC. The South Pole of the earth will be tilted toward the Sun\\n, which will have reached its southernmost position in the sky and will be directly over the Tropic of Capricorn at 23.44 degrees south latitude. This is the first day of winter (winter solstice) in the Northern Hemisphere and the first day of summer (summer solstice) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20271227",
          "DTEND;VALUE=DATE": "20271228",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194732Z",
          "UID": "newmoon_2027122720271228@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 20:13 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Quadrantids Meteor Shower",
          "DTSTART;VALUE=DATE": "20280103",
          "DTEND;VALUE=DATE": "20280105",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "quadrantidsmeteorshower_2028010320280105@seasky.org",
          "DESCRIPTION": "The Quadrantids is an above average shower\\n, with up to 40 meteors per hour at its peak. It is thought to be produced by dust grains left behind by an extinct comet known as 2003 EH1\\n, which was discovered in 2003. The shower runs annually from January 1-5. It peaks this year on the night of the 3rd and  morning of the 4th. The waxing crescent moon will set early in the evening\\n, leaving dark skies for what should be an excellent show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Bootes\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon\\n, Supermoon",
          "DTSTART;VALUE=DATE": "20280112",
          "DTEND;VALUE=DATE": "20280113",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "fullmoon\\n,supermoon_2028011220280113@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 04:04 UTC. This full moon was known by early Native American tribes as the Full Wolf Moon because this was the time of year when hungry wolf packs howled outside their camps. This moon has also been know as the Old Moon and the Moon After Yule. This is also the first of three supermoons for 2028. The Moon will be at its closest approach to the Earth and may look slightly larger and brighter than usual."
        },
        {
          "SUMMARY": "Partial Lunar Eclipse",
          "DTSTART;VALUE=DATE": "20280112",
          "DTEND;VALUE=DATE": "20280113",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "partiallunareclipse_2028011220280113@seasky.org",
          "DESCRIPTION": "A partial lunar eclipse occurs when the Moon passes through the Earth's partial shadow\\n, or penumbra\\n, and only a portion of it passes through the darkest shadow\\n, or umbra. During this type of eclipse a part of the Moon will darken as it moves through the Earth's shadow. The eclipse will be visible throughout North America\\n, Mexico\\n, Central America\\n, South America\\n, Africa\\n, Europe\\n, and much of western Asia. \\nn        ()"
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20280117",
          "DTEND;VALUE=DATE": "20280118",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "mercuryatgreatesteasternelongation_2028011720280118@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 18.8 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20280126",
          "DTEND;VALUE=DATE": "20280127",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "newmoon_2028012620280127@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 15:14 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Annular Solar Eclipse",
          "DTSTART;VALUE=DATE": "20280126",
          "DTEND;VALUE=DATE": "20280127",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "annularsolareclipse_2028012620280127@seasky.org",
          "DESCRIPTION": "An annular solar eclipse occurs when the Moon is too far away from the Earth to completely cover the Sun. This results in a ring of light around the darkened Moon. The Sun's corona is not visible during an annular eclipse.  The path of the eclipse will begin in the Pacific Ocean off the coast of South America and move across Ecuador\\n, Peru\\n, and Brazil. It will then move out into the Atlantic Ocean where it will end in Spain and Portugal. A partial eclipse will be visible throughout most of North America\\n, Central America\\n, South America\\n, western Europe\\n, and northwestern Africa. ()\\nn        ()"
        },
        {
          "SUMMARY": "Full Moon\\n, Supermoon",
          "DTSTART;VALUE=DATE": "20280210",
          "DTEND;VALUE=DATE": "20280211",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "fullmoon\\n,supermoon_2028021020280211@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 15:04 UTC. This full moon was known by early Native American tribes as the Full Snow Moon because the heaviest snows usually fell during this time of the year. Since hunting is difficult\\n, this moon has also been known by some tribes as the Full Hunger Moon\\n, since the harsh weather made hunting difficult.  This is also the second of three supermoons for 2028. The Moon will be at its closest approach to the Earth and may look slightly larger and brighter than usual.\\nn"
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20280225",
          "DTEND;VALUE=DATE": "20280226",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "newmoon_2028022520280226@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 10:38 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20280227",
          "DTEND;VALUE=DATE": "20280228",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "mercuryatgreatestwesternelongation_2028022720280228@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 26.9 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "Full Moon\\n, Supermoon",
          "DTSTART;VALUE=DATE": "20280311",
          "DTEND;VALUE=DATE": "20280312",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "fullmoon\\n,supermoon_2028031120280312@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 01:06 UTC. This full moon was known by early Native American tribes as the Full Worm Moon because this was the time of year when the ground would begin to soften and the earthworms would reappear. This moon has also been known as the Full Crow Moon\\n, the Full Crust Moon\\n, the Full Sap Moon\\n, and the Lenten Moon.  This is also the last of three supermoons for 2028. The Moon will be at its closest approach to the Earth and may look slightly larger and brighter than usual.\\nn"
        },
        {
          "SUMMARY": "Jupiter at Opposition",
          "DTSTART;VALUE=DATE": "20280312",
          "DTEND;VALUE=DATE": "20280313",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "jupiteratopposition_2028031220280313@seasky.org",
          "DESCRIPTION": "The giant planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Jupiter and its moons. A medium-sized telescope should be able to show you some of the details in Jupiter's cloud bands. A good pair of binoculars should allow you to see Jupiter's four largest moons\\n, appearing as bright dots on either side of the planet."
        },
        {
          "SUMMARY": "March Equinox",
          "DTSTART;VALUE=DATE": "20280320",
          "DTEND;VALUE=DATE": "20280321",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "marchequinox_2028032020280321@seasky.org",
          "DESCRIPTION": "The March equinox occurs at 02:20 UTC. The Sun will shine directly on the equator and there will be nearly equal amounts of day and night throughout the world. This is also the first day of spring (vernal equinox) in the Northern Hemisphere and the first day of fall (autumnal equinox) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Venus at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20280322",
          "DTEND;VALUE=DATE": "20280323",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "venusatgreatesteasternelongation_2028032220280323@seasky.org",
          "DESCRIPTION": "The planet Venus reaches greatest eastern elongation of 46.1 degrees from the Sun. This is the best time to view Venus since it will be at its highest point above the horizon in the evening sky. Look for the bright planet in the western sky after sunset."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20280326",
          "DTEND;VALUE=DATE": "20280327",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "newmoon_2028032620280327@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 04:33 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20280409",
          "DTEND;VALUE=DATE": "20280410",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "fullmoon_2028040920280410@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 10:27 UTC. This full moon was known by early Native American tribes as the Full Pink Moon because it marked the appearance of the moss pink\\n, or wild ground phlox\\n, which is one of the first spring flowers. This moon has also been known as the Sprouting Grass Moon\\n, the Growing Moon\\n, and the Egg Moon. Many coastal tribes called it the Full Fish Moon because this was the time that the shad swam upstream to spawn."
        },
        {
          "SUMMARY": "Lyrids Meteor Shower",
          "DTSTART;VALUE=DATE": "20280422",
          "DTEND;VALUE=DATE": "20280424",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "lyridsmeteorshower_2028042220280424@seasky.org",
          "DESCRIPTION": "The Lyrids is an average shower\\n, usually producing about 20 meteors per hour at its peak. It is produced by dust particles left behind by comet C/1861 G1 Thatcher\\n, which was discovered in 1861. The shower runs annually from April 16-25. It peaks this year on the night of the night of the 22nd and morning of the 23rd. These meteors can sometimes produce bright dust trails that last for several seconds.  This is an excellent year for the Lyrids. The new moon means dark skies  all night for what should an excellent show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Lyra\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20280424",
          "DTEND;VALUE=DATE": "20280425",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "newmoon_2028042420280425@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 19:49 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Eta Aquarids Meteor Shower",
          "DTSTART;VALUE=DATE": "20280506",
          "DTEND;VALUE=DATE": "20280508",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "etaaquaridsmeteorshower_2028050620280508@seasky.org",
          "DESCRIPTION": "The Eta Aquarids is an above average shower\\n, capable of producing up to 60 meteors per hour at its peak. Most of the activity is seen in the Southern Hemisphere. In the Northern Hemisphere\\n, the rate can reach about 30 meteors per hour. It is produced by dust particles left behind by comet Halley\\n, which has known and observed since ancient times. The shower runs annually from April 19 to May 28. It peaks this year on the night of May 6 and the morning of the May 7. Unfortunately the nearly full moon will block out most of the fainter meteors this year. But if you are patient\\n, you should still should be able to catch a few of the brighter ones. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Aquarius\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20280508",
          "DTEND;VALUE=DATE": "20280509",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "fullmoon_2028050820280509@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 19:49 UTC. This full moon was known by early Native American tribes as the Full Flower Moon because this was the time of year when spring flowers appeared in abundance. This moon has also been known as the Full Corn Planting Moon and the Milk Moon."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20280509",
          "DTEND;VALUE=DATE": "20280510",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "mercuryatgreatesteasternelongation_2028050920280510@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 21.4 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20280524",
          "DTEND;VALUE=DATE": "20280525",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "newmoon_2028052420280525@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 08:17 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20280607",
          "DTEND;VALUE=DATE": "20280608",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "fullmoon_2028060720280608@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 06:09 UTC. This full moon was known by early Native American tribes as the Full Strawberry Moon because it signaled the time of year to gather ripening fruit. It also coincides with the peak of the strawberry harvesting season. This moon has also been known as the Full Rose Moon and the Full Honey Moon."
        },
        {
          "SUMMARY": "June Solstice",
          "DTSTART;VALUE=DATE": "20280620",
          "DTEND;VALUE=DATE": "20280621",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "junesolstice_2028062020280621@seasky.org",
          "DESCRIPTION": "The June solstice occurs at 20:06 UTC. The North Pole of the earth will be tilted toward the Sun\\n, which will have reached its northernmost position in the sky and will be directly over the Tropic of Cancer at 23.44 degrees north latitude. This is the first day of summer (summer solstice) in the Northern Hemisphere and the first day of winter (winter solstice) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20280622",
          "DTEND;VALUE=DATE": "20280623",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "newmoon_2028062220280623@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 18:28 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20280626",
          "DTEND;VALUE=DATE": "20280627",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "mercuryatgreatestwesternelongation_2028062620280627@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 22.2 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20280706",
          "DTEND;VALUE=DATE": "20280707",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "fullmoon_2028070620280707@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 18:12 UTC. This full moon was known by early Native American tribes as the Full Buck Moon because the male buck deer would begin to grow their new antlers at this time of year. This moon has also been known as the Full Thunder Moon and the Full Hay Moon."
        },
        {
          "SUMMARY": "Partial Lunar Eclipse",
          "DTSTART;VALUE=DATE": "20280706",
          "DTEND;VALUE=DATE": "20280707",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "partiallunareclipse_2028070620280707@seasky.org",
          "DESCRIPTION": "A partial lunar eclipse occurs when the Moon passes through the Earth's partial shadow\\n, or penumbra\\n, and only a portion of it passes through the darkest shadow\\n, or umbra. During this type of eclipse a part of the Moon will darken as it moves through the Earth's shadow. The eclipse will be visible throughout all of Africa and Australia and most of Europe and Asia. ()"
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20280722",
          "DTEND;VALUE=DATE": "20280723",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "newmoon_2028072220280723@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 03:02 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Total Solar Eclipse",
          "DTSTART;VALUE=DATE": "20280722",
          "DTEND;VALUE=DATE": "20280723",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "totalsolareclipse_2028072220280723@seasky.org",
          "DESCRIPTION": "A total solar eclipse occurs when the moon completely blocks the Sun\\n, revealing the Sun's beautiful outer atmosphere known as the corona. The path of totality will begin in the Indian Ocean and move across central Australia and New Zealand. A partial eclipse will be visible throughout southeast Asia\\n, Indonesia\\n, Australia\\n, and New Zealand. ()\\nn        ()"
        },
        {
          "SUMMARY": "Delta Aquarids Meteor Shower",
          "DTSTART;VALUE=DATE": "20280728",
          "DTEND;VALUE=DATE": "20280730",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "deltaaquaridsmeteorshower_2028072820280730@seasky.org",
          "DESCRIPTION": "The Delta Aquarids is an average shower that can produce up to 20 meteors per hour at its peak. It is produced by debris left behind by comets Marsden and Kracht. The shower runs annually from July 12 to August 23. It peaks this year on the night of July 28 and morning of July 29. The first quarter moon will block many of the fainter meteors in the evening. But it will set shortly after midnight leaving dark skies for what should be a good show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Aquarius\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20280805",
          "DTEND;VALUE=DATE": "20280806",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "fullmoon_2028080520280806@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 08:11 UTC. This full moon was known by early Native American tribes as the Full Sturgeon Moon because the large sturgeon fish of the Great Lakes and other major lakes were more easily caught at this time of year. This moon has also been known as the Green Corn Moon and the Grain Moon."
        },
        {
          "SUMMARY": "Venus at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20280811",
          "DTEND;VALUE=DATE": "20280812",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "venusatgreatestwesternelongation_2028081120280812@seasky.org",
          "DESCRIPTION": "The planet Venus reaches greatest eastern elongation of 45.8 degrees from the Sun. This is the best time to view Venus since it will be at its highest point above the horizon in the morning sky. Look for the bright planet in the eastern sky before sunrise."
        },
        {
          "SUMMARY": "Perseids Meteor Shower",
          "DTSTART;VALUE=DATE": "20280812",
          "DTEND;VALUE=DATE": "20280814",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "perseidsmeteorshower_2028081220280814@seasky.org",
          "DESCRIPTION": "The Perseids is one of the best meteor showers to observe\\n, producing up to 60 meteors per hour at its peak. It is produced by comet Swift-Tuttle\\n, which was discovered in 1862. The Perseids are famous for producing a large number of bright meteors. The shower runs annually from July 17 to August 24. It peaks this year on the night of August 12 and the morning of August 13. The second quarter moon will block some of the fainter meteors this year. But the Perseids are so numerous that this could still be a good show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Perseus\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20280820",
          "DTEND;VALUE=DATE": "20280821",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "newmoon_2028082020280821@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 10:44 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20280903",
          "DTEND;VALUE=DATE": "20280904",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "fullmoon_2028090320280904@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 23:49 UTC. This full moon was known by early Native American tribes as the Full Corn Moon because the corn is harvested around this time of year."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20280906",
          "DTEND;VALUE=DATE": "20280907",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "mercuryatgreatesteasternelongation_2028090620280907@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 27.1 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20280918",
          "DTEND;VALUE=DATE": "20280919",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "newmoon_2028091820280919@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 18:24 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "September Equinox",
          "DTSTART;VALUE=DATE": "20280922",
          "DTEND;VALUE=DATE": "20280923",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "septemberequinox_2028092220280923@seasky.org",
          "DESCRIPTION": "The September equinox occurs at 11:49 UTC. The Sun will shine directly on the equator and there will be nearly equal amounts of day and night throughout the world. This is also the first day of fall (autumnal equinox) in the Northern Hemisphere and the first day of spring (vernal equinox) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Neptune at Opposition",
          "DTSTART;VALUE=DATE": "20280930",
          "DTEND;VALUE=DATE": "20281001",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "neptuneatopposition_2028093020281001@seasky.org",
          "DESCRIPTION": "The blue giant planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Neptune. Due to its extreme distance from Earth\\n, it will only appear as a tiny blue dot in all but the most powerful telescopes."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20281003",
          "DTEND;VALUE=DATE": "20281004",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "fullmoon_2028100320281004@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 16:26 UTC. This full moon was known by early Native American tribes as the Full Hunters Moon because at this time of year the leaves are falling and the game is fat and ready to hunt. This moon has also been known as the Travel Moon and the Blood Moon. This moon is also known as the Harvest Moon. The Harvest Moon is the full moon that occurs closest to the September equinox each year."
        },
        {
          "SUMMARY": "Draconids Meteor Shower",
          "DTSTART;VALUE=DATE": "20281007",
          "DTEND;VALUE=DATE": "20281008",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "draconidsmeteorshower_2028100720281008@seasky.org",
          "DESCRIPTION": "The Draconids is a minor meteor shower producing only about 10 meteors per hour. It is produced by dust grains left behind by comet 21P Giacobini-Zinner\\n, which was first discovered in 1900. The Draconids is an unusual shower in that the best viewing is in the early evening instead of early morning like most other showers. The shower runs annually from October 6-10 and peaks this year on the the night of the 7th. The waning gibbous moon will block out most of the fainter meteors this year. But if you are extremely patient\\n, you may still be able to catch a few good ones. Best viewing will be in the early evening from a dark location far away from city lights. Meteors will radiate from the constellation Draco\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20281017",
          "DTEND;VALUE=DATE": "20281018",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "mercuryatgreatestwesternelongation_2028101720281018@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 18.2 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20281018",
          "DTEND;VALUE=DATE": "20281019",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "newmoon_2028101820281019@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 02:57 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Orionids Meteor Shower",
          "DTSTART;VALUE=DATE": "20281021",
          "DTEND;VALUE=DATE": "20281023",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "orionidsmeteorshower_2028102120281023@seasky.org",
          "DESCRIPTION": "The Orionids is an average shower producing up to 20 meteors per hour at its peak. It is produced by dust grains left behind by comet Halley\\n, which has been known and observed since ancient times. The shower runs annually from October 2 to November 7. It peaks this year on the night of October 21 and the morning of October 22. This is an excellent year for the Orionids. The waxing crescent moon moon will set early in the evening leaving dark skies for what should be an excellent show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Orion\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Saturn at Opposition",
          "DTSTART;VALUE=DATE": "20281030",
          "DTEND;VALUE=DATE": "20281031",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "saturnatopposition_2028103020281031@seasky.org",
          "DESCRIPTION": "The ringed planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Saturn and its moons. A medium-sized or larger telescope will allow you to see Saturn's rings and a few of its brightest moons."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20281102",
          "DTEND;VALUE=DATE": "20281103",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "fullmoon_2028110220281103@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 09:19 UTC. This full moon was known by early Native American tribes as the Full Beaver Moon because this was the time of year to set the beaver traps before the swamps and rivers froze. It has also been known as the Frosty Moon and the Hunter's Moon."
        },
        {
          "SUMMARY": "Taurids Meteor Shower",
          "DTSTART;VALUE=DATE": "20281104",
          "DTEND;VALUE=DATE": "20281106",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "tauridsmeteorshower_2028110420281106@seasky.org",
          "DESCRIPTION": "The Taurids is a long-running minor meteor shower producing only about 5-10 meteors per hour. It is unusual in that it consists of two separate streams. The first is produced by dust grains left behind by Asteroid 2004 TG10. The second stream is produced by debris left behind by Comet 2P Encke. The shower runs annually from September 7 to December 10. It peaks this year on the the night of November 4. The waning gibbous moon will block most of the fainter meteors this year. But if you are really patient\\n, you might still be able to catch a few of the brighter ones. Best viewing will be just after midnight from a dark location far away from city lights. Meteors will radiate from the constellation Taurus\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20281116",
          "DTEND;VALUE=DATE": "20281117",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "newmoon_2028111620281117@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 13:18 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Leonids Meteor Shower",
          "DTSTART;VALUE=DATE": "20281117",
          "DTEND;VALUE=DATE": "20281119",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "leonidsmeteorshower_2028111720281119@seasky.org",
          "DESCRIPTION": "The Leonids is an average shower\\n, producing up to 15 meteors per hour at its peak. This shower is unique in that it has a cyclonic peak about every 33 years where hundreds of meteors per hour can be seen. That last of these occurred in 2001. The Leonids is produced by dust grains left behind by comet Tempel-Tuttle\\n, which was discovered in 1865. The shower runs annually from November 6-30. It peaks this year on the night of the 17th and morning of the 18th. This should be an excellent year for the Leonids. The thin\\n, crescent moon will set early in the evening leaving dark enough for what should be an excellent show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Leo\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20281202",
          "DTEND;VALUE=DATE": "20281203",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "fullmoon_2028120220281203@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 01:41 UTC. This full moon was known by early Native American tribes as the Full Cold Moon because this is the time of year when the cold winter air settles in and the nights become long and dark. This moon has also been known as the Full Long Nights Moon and the Moon Before Yule."
        },
        {
          "SUMMARY": "Uranus at Opposition",
          "DTSTART;VALUE=DATE": "20281203",
          "DTEND;VALUE=DATE": "20281204",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "uranusatopposition_2028120320281204@seasky.org",
          "DESCRIPTION": "The blue-green planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view Uranus. Due to its distance\\n, it will only appear as a tiny blue-green dot in all but the most powerful telescopes."
        },
        {
          "SUMMARY": "Geminids Meteor Shower",
          "DTSTART;VALUE=DATE": "20281213",
          "DTEND;VALUE=DATE": "20281215",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "geminidsmeteorshower_2028121320281215@seasky.org",
          "DESCRIPTION": "The Geminids is the  king of the meteor showers. It is considered by many to be the best shower in the heavens\\n, producing up to 120 multicolored meteors per hour at its peak. It is produced by debris left behind by an asteroid known as 3200 Phaethon\\n, which was discovered in 1982. The shower runs annually from December 7-17. It peaks this year on the night of the 13th and morning of the 14th. The thin\\n, crescent moon will be no match for the mighty Geminids this year. Skies will be dark\\n, leaving optimal viewing conditions for what should be an excellent show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Gemini\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20281216",
          "DTEND;VALUE=DATE": "20281217",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "newmoon_2028121620281217@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 02:07 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "December Solstice",
          "DTSTART;VALUE=DATE": "20281221",
          "DTEND;VALUE=DATE": "20281222",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "decembersolstice_2028122120281222@seasky.org",
          "DESCRIPTION": "The December solstice occurs at 08:23 UTC. The South Pole of the earth will be tilted toward the Sun\\n, which will have reached its southernmost position in the sky and will be directly over the Tropic of Capricorn at 23.44 degrees south latitude. This is the first day of winter (winter solstice) in the Northern Hemisphere and the first day of summer (summer solstice) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Ursids Meteor Shower",
          "DTSTART;VALUE=DATE": "20281221",
          "DTEND;VALUE=DATE": "20281223",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "ursidsmeteorshower_2028122120281223@seasky.org",
          "DESCRIPTION": "The Ursids is a minor meteor shower producing about 5-10 meteors per hour. It is produced by dust grains left behind by comet Tuttle\\n, which was first discovered in 1790. The shower runs annually from December 17-25. It peaks this year on the the night of the 21st and morning of the 22nd. The second quarter moon will block out many of the fainter meteors this year. But if you are patient\\n, you may still be able to catch a few of the brighter ones. Best viewing will be just after midnight from a dark location far away from city lights. Meteors will radiate from the constellation Ursa Minor\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon\\n, Blue Moon",
          "DTSTART;VALUE=DATE": "20281231",
          "DTEND;VALUE=DATE": "20290101",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "fullmoon\\n,bluemoon_2028123120290101@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 16:49 UTC. Since this is the second full moon in the same month\\n, it is sometimes referred to as a blue moon. This rare calendar event only occurs one every few years\\n, giving rise to the term once in a blue moon."
        },
        {
          "SUMMARY": "Total Lunar Eclipse",
          "DTSTART;VALUE=DATE": "20281231",
          "DTEND;VALUE=DATE": "20290101",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "totallunareclipse_2028123120290101@seasky.org",
          "DESCRIPTION": "A total lunar eclipse occurs when the Moon passes completely through the Earth's dark shadow\\n, or umbra. During this type of eclipse\\n, the Moon will gradually get darker and then take on a rusty or blood red color. The eclipse will be visible throughout all of Africa\\n, Europe\\n, Asia\\n, Australia\\n, the Pacific Ocean and much of western North America. ()"
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20281231",
          "DTEND;VALUE=DATE": "20290101",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194733Z",
          "UID": "mercuryatgreatesteasternelongation_2028123120290101@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 19.6 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "Quadrantids Meteor Shower",
          "DTSTART;VALUE=DATE": "20290103",
          "DTEND;VALUE=DATE": "20290105",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "quadrantidsmeteorshower_2029010320290105@seasky.org",
          "DESCRIPTION": "The Quadrantids is an above average shower\\n, with up to 40 meteors per hour at its peak. It is thought to be produced by dust grains left behind by an extinct comet known as 2003 EH1\\n, which was discovered in 2003. The shower runs annually from January 1-5. It peaks this year on the night of the 3rd and  morning of the 4th. Unfortunately the waning gibbous moon will block out many of the fainter meteors this year. But if you are patient\\n, you may still be able to catch a few of the brighter ones. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Bootes\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20290114",
          "DTEND;VALUE=DATE": "20290115",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "newmoon_2029011420290115@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 17:26 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Partial Solar Eclipse",
          "DTSTART;VALUE=DATE": "20290114",
          "DTEND;VALUE=DATE": "20290115",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "partialsolareclipse_2029011420290115@seasky.org",
          "DESCRIPTION": "A partial solar eclipse occurs when the Moon covers only a part of the Sun\\n, sometimes resembling a bite taken out of a cookie. A partial solar eclipse can only be safely observed with a special solar filter or by looking at the Sun's reflection. This partial eclipse will be visible throughout North America and South America. It will be best seen from Canada with 87% coverage.\\nn        ()"
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20290130",
          "DTEND;VALUE=DATE": "20290131",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "fullmoon_2029013020290131@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 06:04 UTC. This full moon was known by early Native American tribes as the Full Wolf Moon because this was the time of year when hungry wolf packs howled outside their camps. This moon has also been know as the Old Moon and the Moon After Yule."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20290209",
          "DTEND;VALUE=DATE": "20290210",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "mercuryatgreatestwesternelongation_2029020920290210@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 25.7 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20290213",
          "DTEND;VALUE=DATE": "20290214",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "newmoon_2029021320290214@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 10:33 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Full Moon\\n, Supermoon",
          "DTSTART;VALUE=DATE": "20290228",
          "DTEND;VALUE=DATE": "20290301",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "fullmoon\\n,supermoon_2029022820290301@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 17:11 UTC. This full moon was known by early Native American tribes as the Full Snow Moon because the heaviest snows usually fell during this time of the year. Since hunting is difficult\\n, this moon has also been known by some tribes as the Full Hunger Moon\\n, since the harsh weather made hunting difficult. This is also the first of three supermoons for 2029. The Moon will be at its closest approach to the Earth and may look slightly larger and brighter than usual.\\nn"
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20290315",
          "DTEND;VALUE=DATE": "20290316",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "newmoon_2029031520290316@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 04:21 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "March Equinox",
          "DTSTART;VALUE=DATE": "20290320",
          "DTEND;VALUE=DATE": "20290321",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "marchequinox_2029032020290321@seasky.org",
          "DESCRIPTION": "The March equinox occurs at 08:06 UTC. The Sun will shine directly on the equator and there will be nearly equal amounts of day and night throughout the world. This is also the first day of spring (vernal equinox) in the Northern Hemisphere and the first day of fall (autumnal equinox) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Mars at Opposition",
          "DTSTART;VALUE=DATE": "20290325",
          "DTEND;VALUE=DATE": "20290326",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "marsatopposition_2029032520290326@seasky.org",
          "DESCRIPTION": "The red planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Mars. A medium-sized telescope will allow you to see some of the dark details on the planet's orange surface."
        },
        {
          "SUMMARY": "Full Moon\\n, Supermoon",
          "DTSTART;VALUE=DATE": "20290220",
          "DTEND;VALUE=DATE": "20290221",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "fullmoon\\n,supermoon_2029022020290221@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 23:24 UTC. This full moon was known by early Native American tribes as the Full Snow Moon because the heaviest snows usually fell during this time of the year. Since hunting is difficult\\n, this moon has also been known by some tribes as the Full Hunger Moon\\n, since the harsh weather made hunting difficult. This is also the last of two supermoons for 2027. The Moon will be at its closest approach to the Earth and may look slightly larger and brighter than usual.    \\nn"
        },
        {
          "SUMMARY": "Full Moon\\n, Supermoon",
          "DTSTART;VALUE=DATE": "20290330",
          "DTEND;VALUE=DATE": "20290331",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "fullmoon\\n,supermoon_2029033020290331@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 02:27 UTC. This full moon was known by early Native American tribes as the Full Worm Moon because this was the time of year when the ground would begin to soften and the earthworms would reappear. This moon has also been known as the Full Crow Moon\\n, the Full Crust Moon\\n, the Full Sap Moon\\n, and the Lenten Moon. This is also the second of three supermoons for 2029. The Moon will be at its closest approach to the Earth and may look slightly larger and brighter than usual.\\nn"
        },
        {
          "SUMMARY": "Jupiter at Opposition",
          "DTSTART;VALUE=DATE": "20290411",
          "DTEND;VALUE=DATE": "20290412",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "jupiteratopposition_2029041120290412@seasky.org",
          "DESCRIPTION": "The giant planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Jupiter and its moons. A medium-sized telescope should be able to show you some of the details in Jupiter's cloud bands. A good pair of binoculars should allow you to see Jupiter's four largest moons\\n, appearing as bright dots on either side of the planet."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20290413",
          "DTEND;VALUE=DATE": "20290414",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "newmoon_2029041320290414@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 21:42 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Apophis Closest Approach",
          "DTSTART;VALUE=DATE": "20290413",
          "DTEND;VALUE=DATE": "20290414",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "apophisclosestapproach_2029041320290414@seasky.org",
          "DESCRIPTION": "The asteroid Apophis will make its closest approach to Earth. Discovered in 2004\\n, Apophis is approximately 1\\n,066 feet (325 meters) in diameter. The giant space rock will pass as close as 19\\n,400 miles (31\\n,300 kilometers) to the Earth's surface. This will bring it within the orbits of geosynchronous communication satellites. It may reach a magnitude of 3.4\\n, making it visible to the naked eye from a dark night sky location. Since there will be no moon\\n, this could be a spectacular event. Though it will be an extremely close encounter\\n, there is only a on in a million chance of the asteroid actually hitting the Earth."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20290421",
          "DTEND;VALUE=DATE": "20290422",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "mercuryatgreatesteasternelongation_2029042120290422@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 20.1 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "Lyrids Meteor Shower",
          "DTSTART;VALUE=DATE": "20290422",
          "DTEND;VALUE=DATE": "20290424",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "lyridsmeteorshower_2029042220290424@seasky.org",
          "DESCRIPTION": "The Lyrids is an average shower\\n, usually producing about 20 meteors per hour at its peak. It is produced by dust particles left behind by comet C/1861 G1 Thatcher\\n, which was discovered in 1861. The shower runs annually from April 16-25. It peaks this year on the night of the night of the 22nd and morning of the 23rd. These meteors can sometimes produce bright dust trails that last for several seconds.  The glare from the waxing gibbous moon will block many of the fainter meteors in the evening. But it will set a few hours after midnight leaving dark skies for what should be a good early morning show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Lyra\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon\\n, Supermoon",
          "DTSTART;VALUE=DATE": "20290428",
          "DTEND;VALUE=DATE": "20290429",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "fullmoon\\n,supermoon_2029042820290429@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 10:37 UTC. This full moon was known by early Native American tribes as the Full Pink Moon because it marked the appearance of the moss pink\\n, or wild ground phlox\\n, which is one of the first spring flowers. This moon has also been known as the Sprouting Grass Moon\\n, the Growing Moon\\n, and the Egg Moon. Many coastal tribes called it the Full Fish Moon because this was the time that the shad swam upstream to spawn. This is also the last of three supermoons for 2029. The Moon will be at its closest approach to the Earth and may look slightly larger and brighter than usual."
        },
        {
          "SUMMARY": "Eta Aquarids Meteor Shower",
          "DTSTART;VALUE=DATE": "20290506",
          "DTEND;VALUE=DATE": "20290508",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "etaaquaridsmeteorshower_2029050620290508@seasky.org",
          "DESCRIPTION": "The Eta Aquarids is an above average shower\\n, capable of producing up to 60 meteors per hour at its peak. Most of the activity is seen in the Southern Hemisphere. In the Northern Hemisphere\\n, the rate can reach about 30 meteors per hour. It is produced by dust particles left behind by comet Halley\\n, which has known and observed since ancient times. The shower runs annually from April 19 to May 28. It peaks this year on the night of May 6 and the morning of the May 7. The waning crescent moon will block some of the fainter meteors this year. But if you are patient\\n, you should still should be able to catch a quite a few of the brighter ones. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Aquarius\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20290513",
          "DTEND;VALUE=DATE": "20290514",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "newmoon_2029051320290514@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 13:43 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20290527",
          "DTEND;VALUE=DATE": "20290528",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "fullmoon_2029052720290528@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 18:38 UTC. This full moon was known by early Native American tribes as the Full Flower Moon because this was the time of year when spring flowers appeared in abundance. This moon has also been known as the Full Corn Planting Moon and the Milk Moon."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20290608",
          "DTEND;VALUE=DATE": "20290609",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "mercuryatgreatestwesternelongation_2029060820290609@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 23.9 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20290612",
          "DTEND;VALUE=DATE": "20290613",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "newmoon_2029061220290613@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 03:51 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Partial Solar Eclipse",
          "DTSTART;VALUE=DATE": "20290612",
          "DTEND;VALUE=DATE": "20290613",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "partialsolareclipse_2029061220290613@seasky.org",
          "DESCRIPTION": "A partial solar eclipse occurs when the Moon covers only a part of the Sun\\n, sometimes resembling a bite taken out of a cookie. A partial solar eclipse can only be safely observed with a special solar filter or by looking at the Sun's reflection. This partial eclipse will be visible throughout the Arctic Ocean\\n, Scandinavia\\n, Alaska\\n, northern Asia\\n, and northern Canada. The eclipse will be best seen from Canada and Greenland with 34% coverage. ()"
        },
        {
          "SUMMARY": "June Solstice",
          "DTSTART;VALUE=DATE": "20290621",
          "DTEND;VALUE=DATE": "20290622",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "junesolstice_2029062120290622@seasky.org",
          "DESCRIPTION": "The June solstice occurs at 01:53 UTC. The North Pole of the earth will be tilted toward the Sun\\n, which will have reached its northernmost position in the sky and will be directly over the Tropic of Cancer at 23.44 degrees north latitude. This is the first day of summer (summer solstice) in the Northern Hemisphere and the first day of winter (winter solstice) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20290626",
          "DTEND;VALUE=DATE": "20290627",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "fullmoon_2029062620290627@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 03:23 UTC. This full moon was known by early Native American tribes as the Full Strawberry Moon because it signaled the time of year to gather ripening fruit. It also coincides with the peak of the strawberry harvesting season. This moon has also been known as the Full Rose Moon and the Full Honey Moon."
        },
        {
          "SUMMARY": "Total Lunar Eclipse",
          "DTSTART;VALUE=DATE": "20290626",
          "DTEND;VALUE=DATE": "20290627",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "totallunareclipse_2029062620290627@seasky.org",
          "DESCRIPTION": "A total lunar eclipse occurs when the Moon passes completely through the Earth's dark shadow\\n, or umbra. During this type of eclipse\\n, the Moon will gradually get darker and then take on a rusty or blood red color. The eclipse will be visible throughout most of North America and Europe and all of Mexico\\n, Central America\\n, South America\\n, and Africa. ()"
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20290711",
          "DTEND;VALUE=DATE": "20290712",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "newmoon_2029071120290712@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 15:52 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Partial Solar Eclipse",
          "DTSTART;VALUE=DATE": "20290711",
          "DTEND;VALUE=DATE": "20290712",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "partialsolareclipse_2029071120290712@seasky.org",
          "DESCRIPTION": "A partial solar eclipse occurs when the Moon covers only a part of the Sun\\n, sometimes resembling a bite taken out of a cookie. A partial solar eclipse can only be safely observed with a special solar filter or by looking at the Sun's reflection. This partial eclipse will only be visible in southern Chile and southern Argentina. ()"
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20290725",
          "DTEND;VALUE=DATE": "20290726",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "fullmoon_2029072520290726@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 13:36 UTC. This full moon was known by early Native American tribes as the Full Buck Moon because the male buck deer would begin to grow their new antlers at this time of year. This moon has also been known as the Full Thunder Moon and the Full Hay Moon."
        },
        {
          "SUMMARY": "Delta Aquarids Meteor Shower",
          "DTSTART;VALUE=DATE": "20290728",
          "DTEND;VALUE=DATE": "20290730",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "deltaaquaridsmeteorshower_2029072820290730@seasky.org",
          "DESCRIPTION": "The Delta Aquarids is an average shower that can produce up to 20 meteors per hour at its peak. It is produced by debris left behind by comets Marsden and Kracht. The shower runs annually from July 12 to August 23. It peaks this year on the night of July 28 and morning of July 29. The waning gibbous moon will block out many of the fainter meteors this year. But if you are patient\\n, you may still be able to catch a few of the brighter ones. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Aquarius\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20290810",
          "DTEND;VALUE=DATE": "20290811",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "newmoon_2029081020290811@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 01:56 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Perseids Meteor Shower",
          "DTSTART;VALUE=DATE": "20290812",
          "DTEND;VALUE=DATE": "20290814",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "perseidsmeteorshower_2029081220290814@seasky.org",
          "DESCRIPTION": "The Perseids is one of the best meteor showers to observe\\n, producing up to 60 meteors per hour at its peak. It is produced by comet Swift-Tuttle\\n, which was discovered in 1862. The Perseids are famous for producing a large number of bright meteors. The shower runs annually from July 17 to August 24. It peaks this year on the night of August 12 and the morning of August 13. This is an excellent year for the Perseids. The thin\\n, crescent moon will set early in the evening leaving dark skies and optimal viewing conditions for what should be an excellent show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Perseus\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20290819",
          "DTEND;VALUE=DATE": "20290820",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "mercuryatgreatesteasternelongation_2029081920290820@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 27.4 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "Full Moon\\n, Blue Moon",
          "DTSTART;VALUE=DATE": "20290824",
          "DTEND;VALUE=DATE": "20290825",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "fullmoon\\n,bluemoon_2029082420290825@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 01:52 UTC. This full moon was known by early Native American tribes as the Full Sturgeon Moon because the large sturgeon fish of the Great Lakes and other major lakes were more easily caught at this time of year. This moon has also been known as the Green Corn Moon and the Grain Moon. Since this is the third of four full moons in this season\\n, it is known as a blue moon. This rare calendar event only happens once every few years\\n, giving rise to the term\\n, “once in a blue moon.” There are normally only three full moons in each season of the year. But since full moons occur every 29.53 days\\n, occasionally a season will contain 4 full moons. The extra full moon of the season is known as a blue moon. Blue moons occur on average once every 2.7 years."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20290908",
          "DTEND;VALUE=DATE": "20290909",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "newmoon_2029090820290909@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 10:45 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20290922",
          "DTEND;VALUE=DATE": "20290923",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "fullmoon_2029092220290923@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 16:30 UTC. This full moon was known by early Native American tribes as the Full Corn Moon because the corn is harvested around this time of year. This moon is also known as the Harvest Moon. The Harvest Moon is the full moon that occurs closest to the September equinox each year."
        },
        {
          "SUMMARY": "September Equinox",
          "DTSTART;VALUE=DATE": "20290922",
          "DTEND;VALUE=DATE": "20290923",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "septemberequinox_2029092220290923@seasky.org",
          "DESCRIPTION": "The September equinox occurs at 17:43 UTC. The Sun will shine directly on the equator and there will be nearly equal amounts of day and night throughout the world. This is also the first day of fall (autumnal equinox) in the Northern Hemisphere and the first day of spring (vernal equinox) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20291001",
          "DTEND;VALUE=DATE": "20291002",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "mercuryatgreatestwesternelongation_2029100120291002@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 17.9 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "Neptune at Opposition",
          "DTSTART;VALUE=DATE": "20291002",
          "DTEND;VALUE=DATE": "20291003",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "neptuneatopposition_2029100220291003@seasky.org",
          "DESCRIPTION": "The blue giant planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Neptune. Due to its extreme distance from Earth\\n, it will only appear as a tiny blue dot in all but the most powerful telescopes."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20291007",
          "DTEND;VALUE=DATE": "20291008",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "newmoon_2029100720291008@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 19:15 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Draconids Meteor Shower",
          "DTSTART;VALUE=DATE": "20291007",
          "DTEND;VALUE=DATE": "20291008",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "draconidsmeteorshower_2029100720291008@seasky.org",
          "DESCRIPTION": "The Draconids is a minor meteor shower producing only about 10 meteors per hour. It is produced by dust grains left behind by comet 21P Giacobini-Zinner\\n, which was first discovered in 1900. The Draconids is an unusual shower in that the best viewing is in the early evening instead of early morning like most other showers. The shower runs annually from October 6-10 and peaks this year on the the night of the 7th. This is a great year for viewing the Draconids. The new moon means dark skies and optimal viewing conditions for what could be a really good show. Best viewing will be in the early evening from a dark location far away from city lights. Meteors will radiate from the constellation Draco\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Orionids Meteor Shower",
          "DTSTART;VALUE=DATE": "20291021",
          "DTEND;VALUE=DATE": "20291023",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "orionidsmeteorshower_2029102120291023@seasky.org",
          "DESCRIPTION": "The Orionids is an average shower producing up to 20 meteors per hour at its peak. It is produced by dust grains left behind by comet Halley\\n, which has been known and observed since ancient times. The shower runs annually from October 2 to November 7. It peaks this year on the night of October 21 and the morning of October 22. Unfortunately the glare from the full moon will block most of the meteors this year. But if you are really patient\\n, you may still be able to catch some of the brighter ones. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Orion\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20291022",
          "DTEND;VALUE=DATE": "20291023",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "fullmoon_2029102220291023@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 09:29 UTC. This full moon was known by early Native American tribes as the Full Hunters Moon because at this time of year the leaves are falling and the game is fat and ready to hunt. This moon has also been known as the Travel Moon and the Blood Moon."
        },
        {
          "SUMMARY": "Venus at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20291027",
          "DTEND;VALUE=DATE": "20291028",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "venusatgreatesteasternelongation_2029102720291028@seasky.org",
          "DESCRIPTION": "The planet Venus reaches greatest eastern elongation of 47 degrees from the Sun. This is the best time to view Venus since it will be at its highest point above the horizon in the evening sky. Look for the bright planet in the western sky after sunset."
        },
        {
          "SUMMARY": "Taurids Meteor Shower",
          "DTSTART;VALUE=DATE": "20291104",
          "DTEND;VALUE=DATE": "20291106",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "tauridsmeteorshower_2029110420291106@seasky.org",
          "DESCRIPTION": "The Taurids is a long-running minor meteor shower producing only about 5-10 meteors per hour. It is unusual in that it consists of two separate streams. The first is produced by dust grains left behind by Asteroid 2004 TG10. The second stream is produced by debris left behind by Comet 2P Encke. The shower runs annually from September 7 to December 10. It peaks this year on the the night of November 4. The nearly new moon means dark skies for what could be a really good show this year. Best viewing will be just after midnight from a dark location far away from city lights. Meteors will radiate from the constellation Taurus\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20291106",
          "DTEND;VALUE=DATE": "20291107",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "newmoon_2029110620291107@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 04:24 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Saturn at Opposition",
          "DTSTART;VALUE=DATE": "20291113",
          "DTEND;VALUE=DATE": "20291114",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "saturnatopposition_2029111320291114@seasky.org",
          "DESCRIPTION": "The ringed planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Saturn and its moons. A medium-sized or larger telescope will allow you to see Saturn's rings and a few of its brightest moons."
        },
        {
          "SUMMARY": "Leonids Meteor Shower",
          "DTSTART;VALUE=DATE": "20291117",
          "DTEND;VALUE=DATE": "20291119",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "leonidsmeteorshower_2029111720291119@seasky.org",
          "DESCRIPTION": "The Leonids is an average shower\\n, producing up to 15 meteors per hour at its peak. This shower is unique in that it has a cyclonic peak about every 33 years where hundreds of meteors per hour can be seen. That last of these occurred in 2001. The Leonids is produced by dust grains left behind by comet Tempel-Tuttle\\n, which was discovered in 1865. The shower runs annually from November 6-30. It peaks this year on the night of the 17th and morning of the 18th. The nearly full moon will block most of the fainter meteors this year. But if you are patient\\n, you may still be able to catch a few of the brighter ones. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Leo\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20291121",
          "DTEND;VALUE=DATE": "20291122",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "fullmoon_2029112120291122@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 04:04 UTC. This full moon was known by early Native American tribes as the Full Beaver Moon because this was the time of year to set the beaver traps before the swamps and rivers froze. It has also been known as the Frosty Moon and the Hunter's Moon."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20291205",
          "DTEND;VALUE=DATE": "20291206",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "newmoon_2029120520291206@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 14:53 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Partial Solar Eclipse",
          "DTSTART;VALUE=DATE": "20291205",
          "DTEND;VALUE=DATE": "20291206",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "partialsolareclipse_2029120520291206@seasky.org",
          "DESCRIPTION": "A partial solar eclipse occurs when the Moon covers only a part of the Sun\\n, sometimes resembling a bite taken out of a cookie. A partial solar eclipse can only be safely observed with a special solar filter or by looking at the Sun's reflection. This partial eclipse will only be visible in extreme southern Chile\\n, southern Argentina\\n, and Antarctica. ()"
        },
        {
          "SUMMARY": "Uranus at Opposition",
          "DTSTART;VALUE=DATE": "20291208",
          "DTEND;VALUE=DATE": "20291209",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "uranusatopposition_2029120820291209@seasky.org",
          "DESCRIPTION": "The blue-green planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view Uranus. Due to its distance\\n, it will only appear as a tiny blue-green dot in all but the most powerful telescopes."
        },
        {
          "SUMMARY": "Geminids Meteor Shower",
          "DTSTART;VALUE=DATE": "20291213",
          "DTEND;VALUE=DATE": "20291215",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "geminidsmeteorshower_2029121320291215@seasky.org",
          "DESCRIPTION": "The Geminids is the  king of the meteor showers. It is considered by many to be the best shower in the heavens\\n, producing up to 120 multicolored meteors per hour at its peak. It is produced by debris left behind by an asteroid known as 3200 Phaethon\\n, which was discovered in 1982. The shower runs annually from December 7-17. It peaks this year on the night of the 13th and morning of the 14th. The waxing gibbous moon will block out most of the fainter meteors in the evening. But if will set a few hours after midnight leaving dark skies and optimal conditions for what should be an excellent early morning show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Gemini\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20291214",
          "DTEND;VALUE=DATE": "20291215",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "mercuryatgreatesteasternelongation_2029121420291215@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 20.6 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20291220",
          "DTEND;VALUE=DATE": "20291221",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "fullmoon_2029122020291221@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 22:47 UTC. This full moon was known by early Native American tribes as the Full Cold Moon because this is the time of year when the cold winter air settles in and the nights become long and dark. This moon has also been known as the Full Long Nights Moon and the Moon Before Yule."
        },
        {
          "SUMMARY": "Total Lunar Eclipse",
          "DTSTART;VALUE=DATE": "20291220",
          "DTEND;VALUE=DATE": "20291221",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "totallunareclipse_2029122020291221@seasky.org",
          "DESCRIPTION": "A total lunar eclipse occurs when the Moon passes completely through the Earth's dark shadow\\n, or umbra. During this type of eclipse\\n, the Moon will gradually get darker and then take on a rusty or blood red color. The eclipse will be visible throughout all of North America\\n, Mexico\\n, Central America\\n, South America\\n, Africa\\n, Europe\\n, Asia\\n, and Australia. ()"
        },
        {
          "SUMMARY": "December Solstice",
          "DTSTART;VALUE=DATE": "20291221",
          "DTEND;VALUE=DATE": "20291222",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "decembersolstice_2029122120291222@seasky.org",
          "DESCRIPTION": "The December solstice occurs at 14:18 UTC. The South Pole of the earth will be tilted toward the Sun\\n, which will have reached its southernmost position in the sky and will be directly over the Tropic of Capricorn at 23.44 degrees south latitude. This is the first day of winter (winter solstice) in the Northern Hemisphere and the first day of summer (summer solstice) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Ursids Meteor Shower",
          "DTSTART;VALUE=DATE": "20291221",
          "DTEND;VALUE=DATE": "20291223",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194735Z",
          "UID": "ursidsmeteorshower_2029122120291223@seasky.org",
          "DESCRIPTION": "The Ursids is a minor meteor shower producing about 5-10 meteors per hour. It is produced by dust grains left behind by comet Tuttle\\n, which was first discovered in 1790. The shower runs annually from December 17-25. It peaks this year on the the night of the 21st and morning of the 22nd. Unfortunately the nearly full moon will block most of the fainter meteors this year. But if you are really patient\\n, you may still be able to catch a few good ones. Best viewing will be just after midnight from a dark location far away from city lights. Meteors will radiate from the constellation Ursa Minor\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Quadrantids Meteor Shower",
          "DTSTART;VALUE=DATE": "20300103",
          "DTEND;VALUE=DATE": "20300105",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "quadrantidsmeteorshower_2030010320300105@seasky.org",
          "DESCRIPTION": "The Quadrantids is an above average shower\\n, with up to 40 meteors per hour at its peak. It is thought to be produced by dust grains left behind by an extinct comet known as 2003 EH1\\n, which was discovered in 2003. The shower runs annually from January 1-5. It peaks this year on the night of the 3rd and  morning of the 4th. The new moon means dark skies and optimal viewing conditions for what should be an excellent show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Bootes\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20300104",
          "DTEND;VALUE=DATE": "20300105",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "newmoon_2030010420300105@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 02:50 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20300119",
          "DTEND;VALUE=DATE": "20300120",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "fullmoon_2030011920300120@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 15:55 UTC. This full moon was known by early Native American tribes as the Full Wolf Moon because this was the time of year when hungry wolf packs howled outside their camps. This moon has also been know as the Old Moon and the Moon After Yule."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20300122",
          "DTEND;VALUE=DATE": "20300123",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "mercuryatgreatestwesternelongation_2030012220300123@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 24.4 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20300202",
          "DTEND;VALUE=DATE": "20300203",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "newmoon_2030020220300203@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 16:08 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20300218",
          "DTEND;VALUE=DATE": "20300219",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "fullmoon_2030021820300219@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 06:21 UTC. This full moon was known by early Native American tribes as the Full Snow Moon because the heaviest snows usually fell during this time of the year. Since hunting is difficult\\n, this moon has also been known by some tribes as the Full Hunger Moon\\n, since the harsh weather made hunting difficult.\\nn"
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20300304",
          "DTEND;VALUE=DATE": "20300305",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "newmoon_2030030420300305@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 06:36 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Venus at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20300317",
          "DTEND;VALUE=DATE": "20300318",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "venusatgreatestwesternelongation_2030031720300318@seasky.org",
          "DESCRIPTION": "The planet Venus reaches greatest eastern elongation of 46.6 degrees from the Sun. This is the best time to view Venus since it will be at its highest point above the horizon in the morning sky. Look for the bright planet in the eastern sky before sunrise."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20300319",
          "DTEND;VALUE=DATE": "20300320",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "fullmoon_2030031920300320@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 17:57 UTC. This full moon was known by early Native American tribes as the Full Worm Moon because this was the time of year when the ground would begin to soften and the earthworms would reappear. This moon has also been known as the Full Crow Moon\\n, the Full Crust Moon\\n, the Full Sap Moon\\n, and the Lenten Moon.\\nn"
        },
        {
          "SUMMARY": "March Equinox",
          "DTSTART;VALUE=DATE": "20300320",
          "DTEND;VALUE=DATE": "20300321",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "marchequinox_2030032020300321@seasky.org",
          "DESCRIPTION": "The March equinox occurs at 13:55 UTC. The Sun will shine directly on the equator and there will be nearly equal amounts of day and night throughout the world. This is also the first day of spring (vernal equinox) in the Northern Hemisphere and the first day of fall (autumnal equinox) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20300402",
          "DTEND;VALUE=DATE": "20300403",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "newmoon_2030040220300403@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 22:03 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20300404",
          "DTEND;VALUE=DATE": "20300405",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "mercuryatgreatesteasternelongation_2030040420300405@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 19.1 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20300418",
          "DTEND;VALUE=DATE": "20300419",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "fullmoon_2030041820300419@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 03:21 UTC. This full moon was known by early Native American tribes as the Full Pink Moon because it marked the appearance of the moss pink\\n, or wild ground phlox\\n, which is one of the first spring flowers. This moon has also been known as the Sprouting Grass Moon\\n, the Growing Moon\\n, and the Egg Moon. Many coastal tribes called it the Full Fish Moon because this was the time that the shad swam upstream to spawn."
        },
        {
          "SUMMARY": "Lyrids Meteor Shower",
          "DTSTART;VALUE=DATE": "20300422",
          "DTEND;VALUE=DATE": "20300424",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "lyridsmeteorshower_2030042220300424@seasky.org",
          "DESCRIPTION": "The Lyrids is an average shower\\n, usually producing about 20 meteors per hour at its peak. It is produced by dust particles left behind by comet C/1861 G1 Thatcher\\n, which was discovered in 1861. The shower runs annually from April 16-25. It peaks this year on the night of the night of the 22nd and morning of the 23rd. These meteors can sometimes produce bright dust trails that last for several seconds.  The waning gibbous moon will block many of the fainter meteors this year. But if you are patient\\n, you may still be able to catch a few of the brighter ones. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Lyra\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20300502",
          "DTEND;VALUE=DATE": "20300503",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "newmoon_2030050220300503@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 14:13 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Eta Aquarids Meteor Shower",
          "DTSTART;VALUE=DATE": "20300506",
          "DTEND;VALUE=DATE": "20300508",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "etaaquaridsmeteorshower_2030050620300508@seasky.org",
          "DESCRIPTION": "The Eta Aquarids is an above average shower\\n, capable of producing up to 60 meteors per hour at its peak. Most of the activity is seen in the Southern Hemisphere. In the Northern Hemisphere\\n, the rate can reach about 30 meteors per hour. It is produced by dust particles left behind by comet Halley\\n, which has known and observed since ancient times. The shower runs annually from April 19 to May 28. It peaks this year on the night of May 6 and the morning of the May 7. This is a great year for observing the Eta Aquarids. The crescent moon will set before midnight leaving dark skies for what should be an excellent early morning show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Aquarius\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Jupiter at Opposition",
          "DTSTART;VALUE=DATE": "20300513",
          "DTEND;VALUE=DATE": "20300514",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "jupiteratopposition_2030051320300514@seasky.org",
          "DESCRIPTION": "The giant planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Jupiter and its moons. A medium-sized telescope should be able to show you some of the details in Jupiter's cloud bands. A good pair of binoculars should allow you to see Jupiter's four largest moons\\n, appearing as bright dots on either side of the planet."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20300517",
          "DTEND;VALUE=DATE": "20300518",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "fullmoon_2030051720300518@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 11:20 UTC. This full moon was known by early Native American tribes as the Full Flower Moon because this was the time of year when spring flowers appeared in abundance. This moon has also been known as the Full Corn Planting Moon and the Milk Moon."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20300521",
          "DTEND;VALUE=DATE": "20300522",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "mercuryatgreatestwesternelongation_2030052120300522@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 25.6 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20300601",
          "DTEND;VALUE=DATE": "20300602",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "newmoon_2030060120300602@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 06:22 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Annular Solar Eclipse",
          "DTSTART;VALUE=DATE": "20300601",
          "DTEND;VALUE=DATE": "20300602",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "annularsolareclipse_2030060120300602@seasky.org",
          "DESCRIPTION": "An annular solar eclipse occurs when the Moon is too far away from the Earth to completely cover the Sun. This results in a ring of light around the darkened Moon. The Sun's corona is not visible during an annular eclipse.  The path of the eclipse will begin in Algeria in northern Africa and move across Tunisia\\n, Greece\\n, Turkey\\n, Russia\\n, northern China\\n, and Japan before ending in the Pacific Ocean. A partial eclipse will be visible throughout Europe\\n, northern Africa\\n, the Middle East\\n, Asia\\n, and Alaska. \\nn        () ()"
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20300615",
          "DTEND;VALUE=DATE": "20300616",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "fullmoon_2030061520300616@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 18:41 UTC. This full moon was known by early Native American tribes as the Full Strawberry Moon because it signaled the time of year to gather ripening fruit. It also coincides with the peak of the strawberry harvesting season. This moon has also been known as the Full Rose Moon and the Full Honey Moon."
        },
        {
          "SUMMARY": "Partial Lunar Eclipse",
          "DTSTART;VALUE=DATE": "20300615",
          "DTEND;VALUE=DATE": "20300616",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "partiallunareclipse_2030061520300616@seasky.org",
          "DESCRIPTION": "A partial lunar eclipse occurs when the Moon passes through the Earth's partial shadow\\n, or penumbra\\n, and only a portion of it passes through the darkest shadow\\n, or umbra. During this type of eclipse a part of the Moon will darken as it moves through the Earth's shadow. The eclipse will be visible throughout Africa\\n, Europe\\n, Asia\\n, and Australia. ()"
        },
        {
          "SUMMARY": "June Solstice",
          "DTSTART;VALUE=DATE": "20300621",
          "DTEND;VALUE=DATE": "20300622",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "junesolstice_2030062120300622@seasky.org",
          "DESCRIPTION": "The June solstice occurs at 07:35 UTC. The North Pole of the earth will be tilted toward the Sun\\n, which will have reached its northernmost position in the sky and will be directly over the Tropic of Cancer at 23.44 degrees north latitude. This is the first day of summer (summer solstice) in the Northern Hemisphere and the first day of winter (winter solstice) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20300630",
          "DTEND;VALUE=DATE": "20300701",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "newmoon_2030063020300701@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 21:35 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20300715",
          "DTEND;VALUE=DATE": "20300716",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "fullmoon_2030071520300716@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 02:11 UTC. This full moon was known by early Native American tribes as the Full Buck Moon because the male buck deer would begin to grow their new antlers at this time of year. This moon has also been known as the Full Thunder Moon and the Full Hay Moon."
        },
        {
          "SUMMARY": "Delta Aquarids Meteor Shower",
          "DTSTART;VALUE=DATE": "20300728",
          "DTEND;VALUE=DATE": "20300730",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "deltaaquaridsmeteorshower_2030072820300730@seasky.org",
          "DESCRIPTION": "The Delta Aquarids is an average shower that can produce up to 20 meteors per hour at its peak. It is produced by debris left behind by comets Marsden and Kracht. The shower runs annually from July 12 to August 23. It peaks this year on the night of July 28 and morning of July 29. This is an great year for observing the Delta Aquarids. The new moon means dark skies and optimal conditions for what should be an excellent show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Aquarius\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20300730",
          "DTEND;VALUE=DATE": "20300731",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "newmoon_2030073020300731@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 11:11 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20300802",
          "DTEND;VALUE=DATE": "20300803",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "mercuryatgreatesteasternelongation_2030080220300803@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 27.3 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "Perseids Meteor Shower",
          "DTSTART;VALUE=DATE": "20300812",
          "DTEND;VALUE=DATE": "20300814",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "perseidsmeteorshower_2030081220300814@seasky.org",
          "DESCRIPTION": "The Perseids is one of the best meteor showers to observe\\n, producing up to 60 meteors per hour at its peak. It is produced by comet Swift-Tuttle\\n, which was discovered in 1862. The Perseids are famous for producing a large number of bright meteors. The shower runs annually from July 17 to August 24. It peaks this year on the night of August 12 and the morning of August 13. Unfortunately the glare from the full moon will obscure all but the brightest meteors this year. But the Perseids are so numerous that you should still be able to catch quite a few of the brighter ones if you are patient. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Perseus\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20300813",
          "DTEND;VALUE=DATE": "20300814",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "fullmoon_2030081320300814@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 10:44 UTC. This full moon was known by early Native American tribes as the Full Sturgeon Moon because the large sturgeon fish of the Great Lakes and other major lakes were more easily caught at this time of year. This moon has also been known as the Green Corn Moon and the Grain Moon."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20300828",
          "DTEND;VALUE=DATE": "20300829",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "newmoon_2030082820300829@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 23:07 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20300911",
          "DTEND;VALUE=DATE": "20300912",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "fullmoon_2030091120300912@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 21:17 UTC. This full moon was known by early Native American tribes as the Full Corn Moon because the corn is harvested around this time of year. This moon is also known as the Harvest Moon. The Harvest Moon is the full moon that occurs closest to the September equinox each year."
        },
        {
          "SUMMARY": "Mercury at Greatest Western Elongation",
          "DTSTART;VALUE=DATE": "20300915",
          "DTEND;VALUE=DATE": "20300916",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "mercuryatgreatestwesternelongation_2030091520300916@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest western elongation of 17.9 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the morning sky. Look for the planet low in the eastern sky just before sunrise."
        },
        {
          "SUMMARY": "September Equinox",
          "DTSTART;VALUE=DATE": "20300922",
          "DTEND;VALUE=DATE": "20300923",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "septemberequinox_2030092220300923@seasky.org",
          "DESCRIPTION": "The September equinox occurs at 23:27 UTC. The Sun will shine directly on the equator and there will be nearly equal amounts of day and night throughout the world. This is also the first day of fall (autumnal equinox) in the Northern Hemisphere and the first day of spring (vernal equinox) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20300927",
          "DTEND;VALUE=DATE": "20300928",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "newmoon_2030092720300928@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 09:54 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Neptune at Opposition",
          "DTSTART;VALUE=DATE": "20301005",
          "DTEND;VALUE=DATE": "20301006",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "neptuneatopposition_2030100520301006@seasky.org",
          "DESCRIPTION": "The blue giant planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Neptune. Due to its extreme distance from Earth\\n, it will only appear as a tiny blue dot in all but the most powerful telescopes."
        },
        {
          "SUMMARY": "Draconids Meteor Shower",
          "DTSTART;VALUE=DATE": "20301007",
          "DTEND;VALUE=DATE": "20301008",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "draconidsmeteorshower_2030100720301008@seasky.org",
          "DESCRIPTION": "The Draconids is a minor meteor shower producing only about 10 meteors per hour. It is produced by dust grains left behind by comet 21P Giacobini-Zinner\\n, which was first discovered in 1900. The Draconids is an unusual shower in that the best viewing is in the early evening instead of early morning like most other showers. The shower runs annually from October 6-10 and peaks this year on the the night of the 7th. Unfortunately the glare from the nearly full moon will block most of the meteors this year. Combined with the low hourly rate it would probably be best to skip this one unless you are really patient. Best viewing will be in the early evening from a dark location far away from city lights. Meteors will radiate from the constellation Draco\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20301011",
          "DTEND;VALUE=DATE": "20301012",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "fullmoon_2030101120301012@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 10:46 UTC. This full moon was known by early Native American tribes as the Full Hunters Moon because at this time of year the leaves are falling and the game is fat and ready to hunt. This moon has also been known as the Travel Moon and the Blood Moon."
        },
        {
          "SUMMARY": "Orionids Meteor Shower",
          "DTSTART;VALUE=DATE": "20301021",
          "DTEND;VALUE=DATE": "20301023",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "orionidsmeteorshower_2030102120301023@seasky.org",
          "DESCRIPTION": "The Orionids is an average shower producing up to 20 meteors per hour at its peak. It is produced by dust grains left behind by comet Halley\\n, which has been known and observed since ancient times. The shower runs annually from October 2 to November 7. It peaks this year on the night of October 21 and the morning of October 22. The waning crescent moon may block some of the fainest meteors this year. But you should still be able to catch quite a few of the brighter ones if you are patient. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Orion\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20301026",
          "DTEND;VALUE=DATE": "20301027",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "newmoon_2030102620301027@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 20:17 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Taurids Meteor Shower",
          "DTSTART;VALUE=DATE": "20301104",
          "DTEND;VALUE=DATE": "20301106",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "tauridsmeteorshower_2030110420301106@seasky.org",
          "DESCRIPTION": "The Taurids is a long-running minor meteor shower producing only about 5-10 meteors per hour. It is unusual in that it consists of two separate streams. The first is produced by dust grains left behind by Asteroid 2004 TG10. The second stream is produced by debris left behind by Comet 2P Encke. The shower runs annually from September 7 to December 10. It peaks this year on the the night of November 4. The waxing gibbous moon will block most of the fainter meteors in the evening. But it will set a few hours after midnight leaving dark skies for what could be a good early morning show. Best viewing will be just after midnight from a dark location far away from city lights. Meteors will radiate from the constellation Taurus\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20301110",
          "DTEND;VALUE=DATE": "20301111",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "fullmoon_2030111020301111@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 03:31 UTC. This full moon was known by early Native American tribes as the Full Beaver Moon because this was the time of year to set the beaver traps before the swamps and rivers froze. It has also been known as the Frosty Moon and the Hunter's Moon."
        },
        {
          "SUMMARY": "Leonids Meteor Shower",
          "DTSTART;VALUE=DATE": "20301117",
          "DTEND;VALUE=DATE": "20301119",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "leonidsmeteorshower_2030111720301119@seasky.org",
          "DESCRIPTION": "The Leonids is an average shower\\n, producing up to 15 meteors per hour at its peak. This shower is unique in that it has a cyclonic peak about every 33 years where hundreds of meteors per hour can be seen. That last of these occurred in 2001. The Leonids is produced by dust grains left behind by comet Tempel-Tuttle\\n, which was discovered in 1865. The shower runs annually from November 6-30. It peaks this year on the night of the 17th and morning of the 18th. The second quarter moon will block some of the fainter meteors this year. But if you are patient\\n, you should still be able to catch quite a few of the brighter ones. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Leo\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20301125",
          "DTEND;VALUE=DATE": "20301126",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "newmoon_2030112520301126@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 06:47 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        },
        {
          "SUMMARY": "Total Solar Eclipse",
          "DTSTART;VALUE=DATE": "20301125",
          "DTEND;VALUE=DATE": "20301126",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "totalsolareclipse_2030112520301126@seasky.org",
          "DESCRIPTION": "A total solar eclipse occurs when the moon completely blocks the Sun\\n, revealing the Sun's beautiful outer atmosphere known as the corona. The path of totality will begin in the Atlantic Ocean off the coast of southern Africa and move across Namibia\\n, Botswana\\n, and South Africa. It will them move out into the Indian Ocean and across southeast Australia. A partial eclipse will be visible throughout southern Africa\\n, the southern Indian Ocean\\n, parts of Indonesia\\n, and most of Australia and Antarctica.\\nn        () ()"
        },
        {
          "SUMMARY": "Mercury at Greatest Eastern Elongation",
          "DTSTART;VALUE=DATE": "20301126",
          "DTEND;VALUE=DATE": "20301127",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "mercuryatgreatesteasternelongation_2030112620301127@seasky.org",
          "DESCRIPTION": "The planet Mercury reaches greatest eastern elongation of 21.8 degrees from the Sun. This is the best time to view Mercury since it will be at its highest point above the horizon in the evening sky. Look for the planet low in the western sky just after sunset."
        },
        {
          "SUMMARY": "Saturn at Opposition",
          "DTSTART;VALUE=DATE": "20301127",
          "DTEND;VALUE=DATE": "20301128",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "saturnatopposition_2030112720301128@seasky.org",
          "DESCRIPTION": "The ringed planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view and photograph Saturn and its moons. A medium-sized or larger telescope will allow you to see Saturn's rings and a few of its brightest moons."
        },
        {
          "SUMMARY": "Full Moon",
          "DTSTART;VALUE=DATE": "20301209",
          "DTEND;VALUE=DATE": "20301210",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "fullmoon_2030120920301210@seasky.org",
          "DESCRIPTION": "The Moon will be located on the opposite side of the Earth as the Sun and its face will be will be fully illuminated. This phase occurs at 22:41 UTC. This full moon was known by early Native American tribes as the Full Cold Moon because this is the time of year when the cold winter air settles in and the nights become long and dark. This moon has also been known as the Full Long Nights Moon and the Moon Before Yule."
        },
        {
          "SUMMARY": "Penumbral Lunar Eclipse",
          "DTSTART;VALUE=DATE": "20301209",
          "DTEND;VALUE=DATE": "20301210",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "penumbrallunareclipse_2030120920301210@seasky.org",
          "DESCRIPTION": "A penumbral lunar eclipse occurs when the Moon passes through the Earth's partial shadow\\n, or penumbra. During this type of eclipse the Moon will darken slightly but not completely. The eclipse will be visible throughout western Australia\\n, most of North America\\n, Mexico\\n, Central America\\n, and South America\\n, and all of Africa\\n, Europe\\n, and Asia. ()"
        },
        {
          "SUMMARY": "Uranus at Opposition",
          "DTSTART;VALUE=DATE": "20301212",
          "DTEND;VALUE=DATE": "20301213",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "uranusatopposition_2030121220301213@seasky.org",
          "DESCRIPTION": "The blue-green planet will be at its closest approach to Earth and its face will be fully illuminated by the Sun. It will be brighter than any other time of the year and will be visible all night long. This is the best time to view Uranus. Due to its distance\\n, it will only appear as a tiny blue-green dot in all but the most powerful telescopes."
        },
        {
          "SUMMARY": "Geminids Meteor Shower",
          "DTSTART;VALUE=DATE": "20301213",
          "DTEND;VALUE=DATE": "20301215",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "geminidsmeteorshower_2030121320301215@seasky.org",
          "DESCRIPTION": "The Geminids is the  king of the meteor showers. It is considered by many to be the best shower in the heavens\\n, producing up to 120 multicolored meteors per hour at its peak. It is produced by debris left behind by an asteroid known as 3200 Phaethon\\n, which was discovered in 1982. The shower runs annually from December 7-17. It peaks this year on the night of the 13th and morning of the 14th. The glare from the waning gibbous moon will obscure many of the fainter meteors this year. But the Geminids are so bright and numerous that this could still be a good show. Best viewing will be from a dark location after midnight. Meteors will radiate from the constellation Gemini\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "December Solstice",
          "DTSTART;VALUE=DATE": "20301221",
          "DTEND;VALUE=DATE": "20301222",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "decembersolstice_2030122120301222@seasky.org",
          "DESCRIPTION": "The December solstice occurs at 20:12 UTC. The South Pole of the earth will be tilted toward the Sun\\n, which will have reached its southernmost position in the sky and will be directly over the Tropic of Capricorn at 23.44 degrees south latitude. This is the first day of winter (winter solstice) in the Northern Hemisphere and the first day of summer (summer solstice) in the Southern Hemisphere."
        },
        {
          "SUMMARY": "Ursids Meteor Shower",
          "DTSTART;VALUE=DATE": "20301221",
          "DTEND;VALUE=DATE": "20301223",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "ursidsmeteorshower_2030122120301223@seasky.org",
          "DESCRIPTION": "The Ursids is a minor meteor shower producing about 5-10 meteors per hour. It is produced by dust grains left behind by comet Tuttle\\n, which was first discovered in 1790. The shower runs annually from December 17-25. It peaks this year on the the night of the 21st and morning of the 22nd. The thin\\n, crescent moon should not be too much of a problem this year. The skies will be dark enough for what could be a really good show. Best viewing will be just after midnight from a dark location far away from city lights. Meteors will radiate from the constellation Ursa Minor\\n, but can appear anywhere in the sky."
        },
        {
          "SUMMARY": "New Moon",
          "DTSTART;VALUE=DATE": "20301224",
          "DTEND;VALUE=DATE": "20301225",
          "DTSTAMP;VALUE=DATE-TIME": "20150701T194736Z",
          "UID": "newmoon_2030122420301225@seasky.org",
          "DESCRIPTION": "The Moon will located on the same side of the Earth as the Sun and will not be visible in the night sky. This phase occurs at 17:33 UTC. This is the best time of the month to observe faint objects such as galaxies and star clusters because there is no moonlight to interfere."
        }
      ]
    }
  ]
}
    ''';

    final Map<String, dynamic> data = json.decode(jsonData);
    final List<dynamic> vCalendar = data['VCALENDAR'] ?? [];

    for (var vEvent in vCalendar) {
      final List<dynamic> eventsData = vEvent['VEVENT'] ?? [];

      for (var eventData in eventsData) {
        final Event event = Event(
          summary: eventData['SUMMARY'] ?? '',
          description: eventData['DESCRIPTION'] ?? '',
          startDate: DateTime.parse(eventData['DTSTART;VALUE=DATE']),
          endDate: DateTime.parse(eventData['DTEND;VALUE=DATE']),
          color: Colors.blue,
        );

        _events.add(event);
      }
    }
  }

  void _showEventDetailsDialog(Event event) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Event Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Summary: ${event.summary}'),
              Text('Description: ${event.description}'),
              Text(
                  'Date: ${event.startDate.toLocal()} - ${event.endDate.toLocal()}'),
              Divider(),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Colors.white,
        ),
        title: Text(
          'Scheduler',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo.shade900,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 600, // Set the desired height
            width: 500,
            child: SfCalendar(
              view: CalendarView.month,
              monthViewSettings: MonthViewSettings(
                showAgenda: true,
              ),
              controller: _calendarController,
              dataSource: _getCalendarDataSource(),
              onTap: (calendarTapDetails) {
                final DateTime selectedDate = calendarTapDetails.date!;
                final List<Event> eventsOnSelectedDate =
                    _getEventsOnDate(selectedDate);

                // Display events on selected date
                _showEventsDialog(eventsOnSelectedDate);
              },
            ),
          ),
          //SizedBox(height: 10), // Add some spacing between calendar and events
          /*Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: _events.length,
                itemBuilder: (context, index) {
                  final Event event = _events[index];
                  return ListTile(
                    title: Text(event.summary),
                    subtitle: Text(
                        '${event.startDate.toLocal()} - ${event.endDate.toLocal()}'),
                    onTap: () {
                      _showEventDetailsDialog(event);
                    },
                  );
                },
              ),
            ),
          ),*/
        ],
      ),
    );
  }

  EventDataSource _getCalendarDataSource() {
    List<Event> events = _events;
    return EventDataSource(events);
  }

  List<Event> _getEventsOnDate(DateTime date) {
    return _events
        .where((event) =>
            event.startDate.year == date.year &&
            event.startDate.month == date.month &&
            event.startDate.day == date.day)
        .toList();
  }

  Future<void> _showEventsDialog(List<Event> events) async {
    if (events.isEmpty) {
      return;
    }

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Events on ${events[0].startDate.toLocal()}'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: events
                  .map(
                    (event) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Summary: ${event.summary}'),
                        Text('Description: ${event.description}'),
                        Divider(),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}

class EventDataSource extends CalendarDataSource {
  EventDataSource(List<Event> appointments) {
    this.appointments = appointments;
  }
}
