class MyBookingModel {
  String image;
  String name;
  String price;
  String buttontext;
  String date;
  String user;
  String startingtime;

  var time;


  MyBookingModel(
      {required this.image,
      required this.name,
      required this.price,
      required this.buttontext,required this.date,
      required this.user,
      required this.startingtime,
      });
      Map<String,dynamic> toMap(){
        return{
          'image':image,'name':name,'price':price,'buttontext':buttontext,'date':date,'user':user,
          'startingtime':startingtime
        };
      }
      factory MyBookingModel.fromMap(Map<String, dynamic> map){
        return MyBookingModel(image: map['image']??'',
         name: map['name']??'',
          price: map['price']??'',
           buttontext: map['buttontext']??'',
            date: map['date']??'',
             user: map['user']??'',
              startingtime: map['startingtime']??''
              );
      }
}
