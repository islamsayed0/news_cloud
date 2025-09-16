  import 'package:flutter/material.dart';
  import '../models/ArticlesModle.dart';

  class NewsTile extends StatelessWidget {
    const NewsTile({super.key, required this.articlesmodle,});
final Articlesmodle articlesmodle;
    @override
    Widget build(BuildContext context) {
      return   Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
                child: articlesmodle.imags.isNotEmpty
                    ? Image.network(
                        articlesmodle.imags,
                        height: 300,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 300,
                            color: Colors.grey.shade300,
                            alignment: Alignment.center,
                            child: const Icon(Icons.broken_image, size: 48),
                          );
                        },
                      )
                    : Container(
                        height: 300,
                        color: Colors.grey.shade300,
                        alignment: Alignment.center,
                        child: const Icon(Icons.image_not_supported, size: 48),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Directionality(
                      textDirection: TextDirection.rtl, // Right-to-Left
                      child: Text(
                        articlesmodle.auther,
                        style: TextStyle(
                          color: Colors.orangeAccent,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Text(
                      articlesmodle.title,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                child: Text(
                  articlesmodle.Subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                ),

              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(articlesmodle.date,textDirection: TextDirection.rtl,style: TextStyle(fontSize: 18),),
              ),
            ],
          ),
        ),
      );

    }
  }
