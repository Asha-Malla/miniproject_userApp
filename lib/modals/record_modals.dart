//import 'package:firebase_auth/firebase_auth.dart';

class RecordModel {
  String docid, imgurl, des;
  RecordModel({this.docid, this.imgurl, this.des});
  toMap() {
    Map<String, dynamic> map = Map();
    map['docid'] = docid;
    map['imgurl'] = imgurl;
    map['des'] = des;
    return map;
  }
}
