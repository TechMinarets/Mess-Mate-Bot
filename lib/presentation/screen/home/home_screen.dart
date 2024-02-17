import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:messmatebot/domain/model/category/category.dart';
import 'package:messmatebot/presentation/route_manager/route_manager.dart';
import 'package:messmatebot/presentation/screen/notifier/category_notifier.dart';
import 'package:messmatebot/presentation/screen/notifier/chatbot_notifier.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  TextEditingController categoryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void openModal({
      required onTap,
      required String title,
      required String hintText,
      required String buttonText,
      Category? category,
    }) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom + 10,
            ),
            child: SizedBox(
              height: 300,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_ios),
                          color: Colors.black,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          title,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 05,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: TextField(
                        controller: categoryController,
                        decoration: InputDecoration(
                          hintText: hintText,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ), // Adjust the radius as needed
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16.0, // Adjust the padding as needed
                            vertical: 12.0,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.greenAccent,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ), // Adjust the radius as needed
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 12.0,
                            ), // Adjust the padding as needed
                            child: InkWell(
                              onTap: onTap,
                              child: Text(
                                buttonText,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/rezvi.jpg'),
          ),
        ),
        title: const Text('Welcome Back Rezvi ',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        centerTitle: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Your Categories are:',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                //const SizedBox(height: 10),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 0,
                        right: 0,
                        top: 10,
                        bottom: 10,
                      ),
                      child: ref.watch(categoryNotifierProvider).maybeWhen(
                            success: (data) {
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      ref
                                          .read(
                                              chatBotNotifierProvider.notifier)
                                          .clearChatBotMessages();
                                      ref
                                          .read(
                                              chatBotNotifierProvider.notifier)
                                          .fetchChatBotMessages(
                                            categoryId: data[index].id,
                                          );
                                      RouteManager.of(context).goToChatBotPage(
                                          categoryId: data[index].id);
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 5.0,
                                        bottom: 5.0,
                                      ),
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                            top: 05,
                                            bottom: 05,
                                            left: 10,
                                            right: 10),
                                        width: double.infinity,
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            side: const BorderSide(
                                              color: Colors.black,
                                              width: 1,
                                            ),
                                          ),
                                          color: index % 2 == 0
                                              ? Color(0xFFE7F0FF)
                                              : Color(0xFFE0FFDD),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Icon(Icons.book, size: 40),
                                            const SizedBox(width: 05),
                                            SizedBox(
                                              width: 180,
                                              child: Text(
                                                data[index].name,
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                            Expanded(child: Container()),
                                            IconButton(
                                              onPressed: () {
                                                showDialog(
                                                  context: context,
                                                  builder: (context) => Dialog(
                                                    child: Container(
                                                      height: 120,
                                                      child: Center(
                                                        child: ListView(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                            vertical: 16,
                                                            horizontal: 16,
                                                          ),
                                                          shrinkWrap: true,
                                                          children: [
                                                            InkWell(
                                                              onTap: () {
                                                                ref
                                                                    .read(categoryNotifierProvider
                                                                        .notifier)
                                                                    .deleteCategory(
                                                                      category:
                                                                          data[
                                                                              index],
                                                                    );
                                                                Navigator.pop(
                                                                  context,
                                                                );
                                                              },
                                                              child:
                                                                  const Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        top:
                                                                            10.0,
                                                                        left:
                                                                            10.0),
                                                                child: Text(
                                                                  'Delete Category',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        22,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                openModal(
                                                                  onTap: () {
                                                                    data[index]
                                                                            .name =
                                                                        categoryController
                                                                            .text;
                                                                    ref
                                                                        .read(categoryNotifierProvider
                                                                            .notifier)
                                                                        .editCategory(
                                                                            category:
                                                                                data[index]);
                                                                  },
                                                                  title:
                                                                      'Edit Category Name',
                                                                  hintText:
                                                                      'Category Text',
                                                                  buttonText:
                                                                      'Save',
                                                                  category: data[
                                                                      index],
                                                                );
                                                              },
                                                              child:
                                                                  const Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        top:
                                                                            10.0,
                                                                        left:
                                                                            10.0),
                                                                child: Text(
                                                                  'Edit Name',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    fontSize:
                                                                        22,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                              icon: const Icon(Icons.more_vert),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            loading: () => const CircularProgressIndicator(),
                            orElse: () => const Text('No Data'),
                          ),
                    ),
                  ],
                )
              ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          openModal(
            onTap: () {
              ref
                  .read(categoryNotifierProvider.notifier)
                  .createCategory(name: categoryController.text);
            },
            title: 'Add New Category',
            hintText: 'Category Name',
            buttonText: 'Create',
          );
        },
        child: const Icon(Icons.add),
        shape: const CircleBorder(),
      ),
    );
  }
}
