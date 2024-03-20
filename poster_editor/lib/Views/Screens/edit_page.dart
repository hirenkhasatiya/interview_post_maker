import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:poster_editor/Controller/page_controller.dart';
import 'package:provider/provider.dart';
import 'package:share_extend/share_extend.dart';

class EditPage extends StatelessWidget {
  const EditPage({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey key = GlobalKey();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Page"),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<EditController>(context, listen: false).changeedit();
            },
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            RepaintBoundary(
              key: key,
              child: Container(
                height: 500,
                width: 400,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/fr1.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment(0, 0),
                      child:
                          Consumer<EditController>(builder: (context, pro, _) {
                        return Container(
                          height: 280,
                          width: 200,
                          color: Colors.grey,
                          child: pro.isedit
                              ? Container(
                                  color: Colors.grey,
                                  child: pro.ImagePath.isEmpty
                                      ? IconButton(
                                          onPressed: () {
                                            pro.ImagepickFromGallary();
                                          },
                                          icon: Icon(Icons.add))
                                      : Image.file(
                                          File(pro.ImagePath),
                                          fit: BoxFit.cover,
                                        ),
                                )
                              : Image.asset(
                                  'assets/p2.jpg',
                                  fit: BoxFit.cover,
                                ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () async {
                    final boundary = key.currentContext?.findRenderObject()
                        as RenderRepaintBoundary?;
                    final image = await boundary?.toImage();
                    final byteData =
                        await image?.toByteData(format: ImageByteFormat.png);
                    final imageBytes = byteData?.buffer.asUint8List();

                    if (imageBytes != null) {
                      final directory =
                          await getApplicationDocumentsDirectory();
                      final imagePath =
                          await File('${directory.path}/container_image.png')
                              .create();
                      await imagePath.writeAsBytes(imageBytes);

                      ImageGallerySaver.saveFile(imagePath.path);
                    }
                  },
                  icon: Icon(Icons.save_alt),
                ),
                IconButton(
                  onPressed: () async {
                    final boundary = key.currentContext?.findRenderObject()
                        as RenderRepaintBoundary?;
                    final image = await boundary?.toImage();
                    final byteData =
                        await image?.toByteData(format: ImageByteFormat.png);
                    final imageBytes = byteData?.buffer.asUint8List();

                    if (imageBytes != null) {
                      final directory =
                          await getApplicationDocumentsDirectory();
                      final imagePath =
                          await File('${directory.path}/container_image.png')
                              .create();
                      await imagePath.writeAsBytes(imageBytes);

                      ShareExtend.share(imagePath.path, "file");
                    }
                  },
                  icon: Icon(Icons.share),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
