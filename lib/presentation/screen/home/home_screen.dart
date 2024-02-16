import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:messmatebot/domain/model/chat_bot/request_body.dart';
import 'package:messmatebot/presentation/screen/notifier/providers.dart';
import 'package:messmatebot/presentation/widgets/assistant_image.dart';
import 'package:messmatebot/presentation/widgets/feature_list.dart';
import 'package:messmatebot/presentation/widgets/feature_text.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  String lastWords = '';

  String? generatedContent;
  String? generatedImageUrl;
  int start = 200;
  int delay = 200;

  @override
  Widget build(BuildContext context) {
    final chatBotResponseList = ref.watch(chatResponseNotifierProvider);
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

            for (int i = 0; i < chatBotResponseList.length; i++)
              Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chatBotResponseList[i].response,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Rezvi GPT',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
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
              borderRadius: const BorderRadius.only(
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
            const CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage(
                'assets/images/rezvi.jpg',
                // 'https://images.unsplash.com/photo-1557862921-37829c790f19?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8bWFufGVufDB8fDB8fHww',
              ),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 8),
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
                ref
                    .read(chatResponseNotifierProvider.notifier)
                    .fetchChatBotResponse(
                        requestBody: RequestBody(prompt: 'hi how are you'));
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
                  child: const Icon(Icons.send)),
            )
          ],
        ),
      )),
    );
  }
}
