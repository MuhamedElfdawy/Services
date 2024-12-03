/*
import 'package:flutter/material.dart';
import 'get_factor_data.dart';  // Import your models here

class PhoneBookContainer extends StatelessWidget {
  final GetFactorData model;

  PhoneBookContainer({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10.0),
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: model.profilePicture != null
                            ? Image.network(
                          model.profilePicture!,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        )
                            : Image.asset(
                          'assets/images/default.png',
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            model.displayName.toString(),
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff343434),
                            ),
                          ),
                          if (model.job != null) ...model.job!.map((job) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Image.asset(
                                      job.imagePath ?? 'assets/images/default.png',
                                      width: 20,
                                      height: 20,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      job.name ?? 'No Job Name',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Color(0xff343434),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          }).toList(),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => SimpleDialog(
                      contentPadding: EdgeInsets.all(16),
                      titlePadding: EdgeInsets.all(16),
                      title: Text(
                        model.displayName ?? 'No Name',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      children: [
                        Text(model.email ?? 'No Email'),
                        Text(model.phoneNumber ?? 'No Phone Number'),
                      ],
                    ),
                  );
                },
                child: Text('Details'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

 */