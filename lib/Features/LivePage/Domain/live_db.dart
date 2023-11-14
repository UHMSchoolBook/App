// class LiveData {
//   LiveData({
//     required this.name,
//     required this.songImageUrl,
//     required this.major,
//     required this.gender,
//     required this.distance,
//     required this.imageUrl,
//   });
//
//   String name;
//   String songImageUrl;
//   String major;
//   String gender;
//   String distance;
//   String imageUrl;
// }
//
// class LiveDB {
//   final List<String> tabs = ['Songs', 'Movies', 'Games', 'Books', 'Events'];
//   final List<LiveData> lives = [
//     LiveData(
//       name: 'Philip',
//       songImageUrl: 'https://i.ytimg.com/vi/xXD5tltX9Pg/maxresdefault.jpg',
//       major: 'CS',
//       gender: 'Male',
//       distance: '2 km',
//       imageUrl: 'https://raw.githubusercontent.com/philipmjohnson/philipmjohnson.github.io/main/img/pmj-headshot.png',
//     ),
//     LiveData(
//       name: 'Sara',
//       songImageUrl: 'https://www.moroccoworldnews.com/wp-content/uploads/2022/12/this-time-for-africa-shakira-celebrates-moroccos-win-800x450.jpeg',
//       major: 'Physics',
//       gender: 'Female',
//       distance: '5 km',
//       imageUrl: 'https://cdn.britannica.com/47/188647-050-396A58A5/Sarah-Silverman-2011.jpg',
//     ),
//     LiveData(
//       name: 'Armin',
//       songImageUrl: 'https://m.media-amazon.com/images/M/MV5BMTM2NzE1YTEtNTNjZC00MTg5LTkwOTEtNDEwMDI1ODA1YjhkXkEyXkFqcGdeQXVyNjU0ODAyOTY@._V1_.jpg',
//       major: 'CS',
//       gender: 'Male',
//       distance: '1 km',
//       imageUrl: "https://hawaiidigitalhealthlab.com/content/images/2023/06/armin.jpeg",
//     ),
//     LiveData(
//       name: "Rahat",
//       songImageUrl: "https://upload.wikimedia.org/wikipedia/en/d/d6/Lose_Yourself.jpg",
//       major: "Math",
//       gender: 'Male',
//       distance: '5 km',
//       imageUrl: "https://scholar.googleusercontent.com/citations?view_op=view_photo&user=DRMNtvMAAAAJ&citpid=2",
//     ),
//   ];
//
//   List<LiveData> getLivesByMajor(String targetMajor) {
//     List<LiveData> livesInMajor = [];
//     for (var liveData in lives) {
//       if (liveData.major == targetMajor) {
//         livesInMajor.add(liveData);
//       }
//     }
//     return livesInMajor;
//   }
// }
//
// LiveDB liveDB = LiveDB();
