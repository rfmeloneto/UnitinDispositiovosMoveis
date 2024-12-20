import 'package:flutter/material.dart';

class MediaQueryVsLayoutBuilder extends StatelessWidget {
  const MediaQueryVsLayoutBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MediaQuery vs LayoutBuilder"),
      ),
      body: Center(
        child: Container(
          color: Colors.blue,
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.4,
          child: Center(
            child: LayoutBuilder(
              builder: (context, constraints) {
              return Container(
              width: constraints.maxWidth * 0.8,
              height: constraints.maxHeight * 0.4,
              color: Colors.red,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                      Text(
                        "LayoutBuilder: ${constraints.maxWidth.toStringAsFixed(2)}",
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    
                  Text(
                    "MediaQuery: ${MediaQuery.of(context).size.width.toStringAsFixed(2)}",
                    style: const TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),],
          ),
            );
                    },
          
            ),
          ),
        ),
      ),
    );
  }
}