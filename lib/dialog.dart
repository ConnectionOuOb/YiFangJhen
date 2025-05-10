import 'package:flutter/cupertino.dart';

import 'tts.dart';
import 'object.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget popUpImage(BuildContext context, PopImage popImage) {
  return StatefulBuilder(
    builder: (BuildContext context, StateSetter setAtomState) {
      return AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(popImage.imageName),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.close),
            ),
          ],
        ),
        content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setAtomState) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.asset(
                    popImage.path2Image,
                    width: 30.w,
                    height: 60.h,
                    fit: BoxFit.contain,
                  ),
                ),
                if (popImage.isShow)
                  SingleChildScrollView(
                    child: Container(
                      width: 20.w,
                      margin: const EdgeInsets.only(left: 35),
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(popImage.imageText, style: const TextStyle(fontSize: 22)),
                          const SizedBox(height: 10),
                          const Divider(),
                          const SizedBox(height: 10),
                          const Text(
                            "關鍵提示詞:",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          ...popImage.prompts.asMap().entries.map(
                                (e) => Text(
                                  "${e.key + 1}. ${e.value}",
                                  style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                                ),
                              ),
                        ],
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          Text2Speech(
            popImage: popImage,
            onOpen: () {
              setAtomState(() {
                popImage.isShow = !popImage.isShow;
              });
            },
          ),
        ],
      );
    },
  );
}
