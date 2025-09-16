class UserInfo {
  late String username;
  late String worldname;
  late String worldtype;
  late String outfittype;
  UserInfo({required this.username, required this.worldname, required this.worldtype, required this.outfittype});
}

// This here is still a work in progress... Soon it might be time to start reading and writing from a database.
// var currentUserProfile = UserInfo(
//           username: "TheBestUser",
//           worldname: "FabulousWorldtopolis",
//           worldtype: "Crater Planet",
//           outfittype: "Galaxy"
//         );