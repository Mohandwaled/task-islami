import 'package:flutter/material.dart';
import 'package:islami_tassk/utils/app_assets.dart';
import '../utils/app_colors.dart';

class SebhaScreen extends StatefulWidget {
  static const String routeName = "/sebhaScreen";

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen>
    with SingleTickerProviderStateMixin {
  int counter = 0;
  int zekrIndex = 0;
  double angle = 0 ;
  List<String> azkar = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
    "لا إله إلا الله",
    "لا حول ولا قوة إلا بالله",
  ];

  late AnimationController rotationController;

  @override
  void initState() {
    super.initState();
    rotationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
  }
  @override
  void dispose() {
    rotationController.dispose();
    super.dispose();
  }

  void onSebhaTap() {
    rotationController.forward(from: 0);

    setState(() {
      counter++;
      angle +=10 ;
      if (counter % 33 == 0) {
        zekrIndex++;
        if (zekrIndex >= azkar.length) {
          zekrIndex = 0;
        }
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppAssets.backGroud,
              fit: BoxFit.cover,
            ),
          ),

          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.5),
                    Colors.black.withValues(alpha: 0.8),
                  ],
                ),
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                SizedBox(height: 20),
                Image.asset(AppAssets.logo),
                SizedBox(height: 10),
                Text(
                  "سَبِّحِ اسْمَ رَبِّكَ الْأَعْلَى",
                  style: TextStyle(
                    fontSize: 45,
                    color: AppColors.white,
                  ),
                ),
                SizedBox(height: 100),
                Image.asset(
                  AppAssets.mask,
                  height: height * 0.075,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: onSebhaTap,
                    child: Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          AnimatedBuilder(
                            animation: rotationController,
                            builder: (_, child) {
                              return Transform.rotate(
                                angle:angle,
                                child: child,
                              );
                            },
                            child: Image.asset(
                              AppAssets.sebha,
                              width: width * 0.85,
                            ),
                          ),

                          // النصوص (ثابتة)
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 50),
                              Text(
                                azkar[zekrIndex],
                                style: TextStyle(
                                  fontSize: 32,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "$counter",
                                style: TextStyle(
                                  fontSize: 35,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
