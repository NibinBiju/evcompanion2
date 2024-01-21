class MyBookingModel {
  String image;
  String name;
  String price;
  String buttontext;
  String date;
  String user;

  var time;


  MyBookingModel(
      {required this.image,
      required this.name,
      required this.price,
      required this.buttontext,required this.date,
      required this.user});
      Map<String,dynamic> toMap(){
        return{
          'image':image,'name':name,'price':price,'buttontext':buttontext,'date':date,'user':user
        };
      }
      factory MyBookingModel.fromMap(Map<String, dynamic> map){
        return MyBookingModel(image: map['image']??'',
         name: map['name']??'',
          price: map['price']??'',
           buttontext: map['buttontext']??'',
            date: map['date']??'',
             user: map['user']??'');
      }
}
