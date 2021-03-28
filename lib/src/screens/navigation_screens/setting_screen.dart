import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          elevation: 0,
          backgroundColor: Color(0xfffafafa),
          title: Text(
            "Settings",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff0d0d0d)),
          ),
          centerTitle: true,
        ),
        SizedBox(
          height: 20,
        ),

        //payment Methods
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Payment Methods",
                style: TextStyle(color: Color(0xff262626), fontSize: 16),
              ),
              SizedBox(
                height: 14,
              ),
              MaterialButton(
                color: Color(0xfff1f1f1),
                elevation: 0,
                height: 50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Manage Profile",
                      style: TextStyle(fontSize: 16, color: Color(0xff707070)),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: Color(0xffa1a1a1),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 14,
              ),
              MaterialButton(
                color: Color(0xfff1f1f1),
                elevation: 0,
                height: 50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Payment Methods",
                      style: TextStyle(fontSize: 16, color: Color(0xff707070)),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: Color(0xffa1a1a1),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 28,
        ),

        // General
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "General",
                style: TextStyle(color: Color(0xff262626), fontSize: 16),
              ),
              SizedBox(
                height: 14,
              ),
              MaterialButton(
                color: Color(0xfff1f1f1),
                elevation: 0,
                height: 50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Notifications",
                      style: TextStyle(fontSize: 16, color: Color(0xff707070)),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: Color(0xffa1a1a1),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 14,
              ),
              MaterialButton(
                color: Color(0xfff1f1f1),
                elevation: 0,
                height: 50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Dark Mode",
                      style: TextStyle(fontSize: 16, color: Color(0xff707070)),
                    ),
                    CupertinoSwitch(
                        activeColor: Colors.orange,
                        value: true,
                        onChanged: (value) {}),
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 28,
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: MaterialButton(
            minWidth: double.infinity,
            color: Colors.red,
            elevation: 0,
            height: 50,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            onPressed: () {},
            child: Text(
              "LogOut",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
