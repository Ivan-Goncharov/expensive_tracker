import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CryptoLogoIage extends StatelessWidget {
  final String url;
  const CryptoLogoIage(this.url, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: CachedNetworkImage(
        imageUrl: url,
        height: 26,
        width: 26,
        fadeOutDuration: const Duration(milliseconds: 50),
        fadeInDuration: const Duration(milliseconds: 50),
        placeholder: (_, __) {
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
