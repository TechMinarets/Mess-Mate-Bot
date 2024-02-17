import 'package:flutter/material.dart';
import 'package:messmatebot/domain/model/chat_bot/request_body.dart';
import 'package:messmatebot/presentation/screen/notifier/chat_response_notifier.dart';
import 'package:messmatebot/presentation/widgets/assistant_image.dart';
import 'package:messmatebot/presentation/widgets/feature_list.dart';
import 'package:messmatebot/presentation/widgets/feature_text.dart';
import 'package:provider/provider.dart'; // Import Provider package

class ChatBotPage extends StatefulWidget {
  ChatBotPage({Key? key}) : super(key: key);

  @override
  State<ChatBotPage> createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rezvi GPT'),
        centerTitle: true,
        leading: const Icon(Icons.menu),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Consumer<ChatResponseNotifier>(
          builder: (context, chatResponseNotifier, _) {
            final chatBotResponseList = chatResponseNotifier.responseList;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AssistantImage(),
                const SizedBox(height: 20),
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
                        const SizedBox(height: 10),
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
                FeatureText(
                  generatedContent: chatResponseNotifier.generatedContent,
                  generatedImageUrl: chatResponseNotifier.generatedImageUrl,
                ),
                FeatureLists(
                  generatedImageUrl: chatResponseNotifier.generatedImageUrl,
                  generatedContent: chatResponseNotifier.generatedContent,
                  delay: chatResponseNotifier.delay,
                  start: chatResponseNotifier.start,
                ),
              ],
            );
          },
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: kToolbarHeight,
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
          ),
          padding: const EdgeInsets.only(left: 16, right: 8),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage('assets/images/rezvi.jpg'),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 8),
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: 'Message RezviGPT..',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Provider.of<ChatResponseNotifier>(context, listen: false)
                      .fetchChatBotResponse(
                    requestBody: RequestBody(
                      prompt: controller.text.toString(),
                    ),
                  );
                  setState(() {
                    controller.clear();
                  });
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: const Icon(Icons.send),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
