  import 'package:flutter/material.dart';

  class NewsTile extends StatelessWidget {
    const NewsTile({super.key});

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
                child: Image.network(
                  'https://i.ytimg.com/vi/3OE2FQp4q2M/maxresdefault.jpg',
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'أخبار الصباح | رد مباشر من سوريا بعد الضربات الإسرائيلية',
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
                child: Text(
                  "سوريا تعلن ردها المباشر عقب الضربات الجوية الإسرائيلية فجر اليوم\n"
                      "التوتر يتصاعد في المنطقة مع تبادل الرسائل العسكرية بين الجانبين",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      );

    }
  }
