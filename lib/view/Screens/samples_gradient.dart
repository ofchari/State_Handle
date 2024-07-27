import 'package:flutter/material.dart';
import 'package:metaballs/metaballs.dart';

class SamplesGradient extends StatefulWidget {
  const SamplesGradient({super.key});

  @override
  State<SamplesGradient> createState() => _SamplesGradientState();
}

class _SamplesGradientState extends State<SamplesGradient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 100),
          Center(
            child: Container(
              height: 150,
              width: 330,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Metaballs(
                color: Colors.white,
                minBallRadius: 30,
                maxBallRadius: 40,
                glowRadius: 0.7,
                metaballs: 40,
                speedMultiplier: 2,
                animationDuration: Duration(seconds: 2),
                effect: MetaballsEffect.follow(
                  growthFactor: 1,
                  smoothing: 1,
                  radius: 0.5,
                ),
                child: Center(
                  child: Text(
                    "Sample Lava",
                    style: TextStyle(fontSize: 24, color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
