import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_services/main.dart';
import 'package:my_services/models/Governorate.dart';
import 'package:my_services/sheets/cities.dart';

class GoverSheet extends StatefulWidget {
  const GoverSheet({super.key});

  @override
  State<GoverSheet> createState() => _GoverSheetState();
}

class _GoverSheetState extends State<GoverSheet> {
  late List<GetGovernorateData> list ;


  @override
  void initState() {
    super.initState();
    getData();
  }
  bool isLoading = true;


  Future<void>  getData() async{
    try{
      final response = await Dio().get('https://darwish1337-001-site1.gtempurl.com/Address/GetAllGovers');
      list = List<GetGovernorateData>.from((response.data as List).map((e) => GetGovernorateData.fromJson(e))).toList();
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
        itemBuilder: (context, index) => ItemGovernorate(model: list[index]),itemCount: list.length,),
    );
  }
}

class ItemGovernorate extends StatelessWidget {
  final GetGovernorateData model;
  const ItemGovernorate({super.key, required this.model});

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
