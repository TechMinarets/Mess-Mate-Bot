import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:messmatebot/presentation/widgets/assistant_image.dart';
import 'package:messmatebot/presentation/widgets/feature_list.dart';
import 'package:messmatebot/presentation/widgets/feature_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String lastWords = '';

  String? generatedContent;
  String? generatedImageUrl;
  int start = 200;
  int delay = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BounceInDown(
          child: const Text('Rezvi GPT'),
        ),
        centerTitle: true,
        leading: const Icon(Icons.menu),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AssistantImage(),
            const SizedBox(
              height: 20,
            ),

            // //chat text reaponse
            // TextResponse(
            //   generatedImageUrl: generatedImageUrl,
            //   generatedContent: generatedContent,
            // ),

            //image response

            FeatureText(
              generatedContent: generatedContent,
              generatedImageUrl: generatedImageUrl,
            ),

            FeatureLists(
              generatedContent: generatedContent,
              generatedImageUrl: generatedImageUrl,
              start: start,
              delay: delay,
            )
          ],
        ),
      ),

      //voice command button

      bottomNavigationBar: SafeArea(
          child: Container(
        height: kToolbarHeight,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              side: BorderSide(
                color: Colors.grey.shade400,
                width: 1,
              )),
        ),
        padding: const EdgeInsets.only(left: 16, right: 8),
        child: Row(
          children: [
            CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage(
                'assets/images/rezvi.jpg',
                // 'https://images.unsplash.com/photo-1557862921-37829c790f19?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8bWFufGVufDB8fDB8fHww',
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 8),
                child: TextField(
                  //controller: _commentController,
                  decoration: InputDecoration(
                    hintText: 'Message RezviGPT..',
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                // await FirestoreMethods().postComment(
                //   widget.snap['postId'],
                //   _commentController.text,
                //   user.uid,
                //   user.username,
                //   user.photoUrl,
                //   );
                setState(() {
                  //  _commentController.text = "";
                });
              },
              child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Icon(Icons.send)),
            )
          ],
        ),
      )),
    );
  }
}
