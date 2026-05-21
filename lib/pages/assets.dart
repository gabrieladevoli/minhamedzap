import 'package:flutter/cupertino.dart';

class Logo_App extends StatelessWidget {
  const Logo_App({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Opacity(
        opacity: 0.45,
        child: Image.network(
        'https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExZjdzaTl5amRoOHNuNTIweXdsZzU5aGU1aGk4M3lzaDNpcHE2aDJvbCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/LPFNd1AJBoYcVUExmE/giphy.gif',
        height:400.0,
        width: 400.0,
        fit: BoxFit.contain,
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            if (wasSynchronouslyLoaded) return child;
            return AnimatedOpacity(
              child: child,
              opacity: frame == null ? 0 : 1,
              duration: const Duration(seconds: 1),
              curve: Curves.easeOut,
            );
          },
        ),
      ),
    );
  }
}