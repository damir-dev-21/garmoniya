import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:garmoniya_pharm/presentation/news_page/pages/news_detail_page.dart';

import '../../../utils/main_service.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({
    super.key,
    required this.item,
  });

  final Map<String, dynamic> item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (ctx) {
          return NewsDetailPage(newDetail: item);
        }));
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            item['url_main_photo'] != ""
                ? Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: CachedNetworkImage(
                      imageUrl: item['url_main_photo'],
                      httpHeaders: MainService.getDefaultAuth(),
                    ),
                  )
                : SizedBox(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['title'],
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(item['dateOverdue'])
              ],
            ),
            // SizedBox(
            //   height: 15,
            // ),
            // Align(
            //   alignment: Alignment.bottomRight,
            //   child: Container(
            //     width: 100,
            //     height: 25,
            //     child: ElevatedButton(
            //         style: ButtonStyle(
            //             backgroundColor:
            //                 MaterialStateColor
            //                     .resolveWith(
            //                         (states) =>
            //                             mainColor)),
            //         onPressed: () {},
            //         child: Text(
            //           "Открыть",
            //           style:
            //               TextStyle(fontSize: 13),
            //         )),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
