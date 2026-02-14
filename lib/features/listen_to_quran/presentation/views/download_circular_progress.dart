import 'package:flutter/material.dart';

class DownloadCircularProgress extends StatelessWidget {
  const DownloadCircularProgress({super.key, required this.progress});
  final double progress;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(value: progress),
            const SizedBox(height: 12),
            Text(
              "${(progress * 100).toStringAsFixed(0)}%",
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
