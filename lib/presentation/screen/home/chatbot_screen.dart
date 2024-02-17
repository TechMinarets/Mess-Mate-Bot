import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:messmatebot/domain/model/chat_bot/request_body.dart';
import 'package:messmatebot/presentation/screen/home/content_table.dart';
import 'package:messmatebot/presentation/screen/notifier/providers.dart';

class ChatBotPage extends ConsumerStatefulWidget {
  const ChatBotPage({super.key});

  @override
  ConsumerState<ChatBotPage> createState() => _ChatBotPageState();
}

class _ChatBotPageState extends ConsumerState<ChatBotPage> {
  String lastWords = '';

  String? generatedContent;
  String? generatedImageUrl;
  int start = 200;
  int delay = 200;

  final List<Map<String, String>> messages = [
    {
      'prompt': ' Add 130 Tk to buy Egg',
      'response': 'You said "Add 130 Tk to buy Egg". Do you confirm? ',
    },
    {
      'prompt': 'Yes',
      'response': 'Alright! Added to the Table.',
    },
    {
      'prompt': 'Last time\'s rice price?',
      'response': 'Last time you bought Rice for 75Tk Per kg',
    },
    {
      'prompt': 'Thank You',
      'response': 'You are welcome!',
    },
    {
      'prompt': 'Thank You',
      'response': 'You are welcome!',
    },
    {
      'prompt': 'Thank You',
      'response': 'You are welcome!',
    }
  ];

  @override
  Widget build(BuildContext context) {
    final TextEditingController _promptController = TextEditingController();
    final chatBotResponseList = ref.watch(chatResponseNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: BounceInDown(
          child: const Text('Assistant Bot'),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => DataListView()),
                );
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.green.shade400,
                ),
                child: Center(
                  child: const Text(
                    'Click To See Grocery Expanse Table',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            //chat text response
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  var prompt = messages[index]['prompt'];
                  var response = messages[index]['response'];
                  return ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                    title: Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(30, 05, 0, 5),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            prompt!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    subtitle: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          response!,
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            //
            // for (int i = 0; i < chatBotResponseList.length; i++)
            //   Container(
            //     padding: const EdgeInsets.all(8),
            //     margin: const EdgeInsets.all(8),
            //     decoration: BoxDecoration(
            //       color: Colors.grey.shade200,
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(
            //           chatBotResponseList[i].response,
            //           style: const TextStyle(
            //             fontSize: 16,
            //           ),
            //         ),
            //         const SizedBox(
            //           height: 10,
            //         ),
            //         const Text(
            //           'Rezvi GPT',
            //           style: TextStyle(
            //             fontSize: 12,
            //             color: Colors.grey,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),

            // //chat text reaponse
            // TextResponse(
            //   generatedImageUrl: generatedImageUrl,
            //   generatedContent: generatedContent,
            // ),

            //image response
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
            ),
          ),
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
            Expanded(
              child: Container(
                width: double.infinity - 45,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.grey.shade200,
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 16, right: 8),
                  child: TextField(
                    controller: _promptController,
                    decoration: InputDecoration(
                      hintText: 'Enter Prompt..',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                InkWell(
                  onTap: () async {
                    ref
                        .read(chatResponseNotifierProvider.notifier)
                        .fetchChatBotResponse(
                            requestBody: RequestBody(
                                prompt: _promptController.text.toString()));

                    setState(() {
                      _promptController.text = "";
                    });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                    child: const Icon(Icons.send),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    // ref
                    //     .read(chatResponseNotifierProvider.notifier)
                    //     .fetchChatBotResponse(
                    //     requestBody: RequestBody(
                    //         prompt: _promptController.text.toString()));
                    //
                    // setState(() {
                    //   _promptController.text = "";
                    //});
                  },
                  child: Container(
                    child: const Icon(Icons.mic),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
