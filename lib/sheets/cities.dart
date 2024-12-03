import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_services/main.dart';
import 'package:my_services/models/cities.dart';

class CitiesSheet extends StatefulWidget {
  const CitiesSheet({super.key,});

  @override
  State<CitiesSheet> createState() => _CitiesSheetState();
}

class _CitiesSheetState extends State<CitiesSheet> {
  late List<GetCitiesData> model ;



  @override
  void initState() {
    super.initState();
    getData();
  }
  bool isLoading = true;


  Future<void>  getData() async{
    try{
      final response = await Dio().get('https://darwish1337-001-site1.gtempurl.com/Address/GetGoverCities/1');
      model = List<GetCitiesData>.from((response.data as List).map((e) => GetCitiesData.fromJson(e))).toList();
      isLoading = false;
      setState(() {});
    } catch (e){
      print('Error fetching data : $e');
    }
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: isLoading ? Center(child: CircularProgressIndicator(color: getMyMaterialColor(),),) : ListView.builder(
        padding: EdgeInsets.all(16),
        itemBuilder: (context, index) => _ItemCities(model: model[index]),itemCount: model.length,),
    );
  }
}

class _ItemCities extends StatelessWidget {
  final GetCitiesData model;
  const _ItemCities({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pop(context,model.name);
      },
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.only(bottom: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          color: Theme.of(context).primaryColor.withOpacity(1),
        ),
        child: Center(child: Text(model.name.toString(),style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold),),),
      ),
    );
  }
}
