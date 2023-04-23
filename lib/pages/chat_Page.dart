import 'package:chat_app/constants.dart';
import 'package:chat_app/models/messageModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../widgets/chat_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatelessWidget {
  static String id = 'ChatPage';
  //irebaseFirestore firestore = FirebaseFirestore.instance; (mesh me7tagha)
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollection);
  TextEditingController controller = TextEditingController();
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
        stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<MessageModel> messagesList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messagesList.add(MessageModel.fromJson(snapshot.data!.docs[i]));
            }
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: kPrimaryColor,
                centerTitle: true,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      kLogo,
                      height: 55,
                    ),
                    Text('Chat'),
                  ],
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        reverse: true,
                        controller: _controller,
                        itemCount: messagesList.length,
                        itemBuilder: (context, index) {
                          return messagesList[index].id == email
                              ? ChatBubble(
                                  message: messagesList[index],
                                )
                              : ChatBubbleAnotherUser(
                                  message: messagesList[index]);
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(22),
                    child: TextField(
                      controller: controller,
                      onSubmitted: (value) {
                        messages.add({
                          kMessage: value,
                          kCreatedAt: DateTime.now(),
                          kId: email,
                        });
                        controller.clear();

                        _controller.animateTo(
                          0,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeIn,
                        );
                      },
                      decoration: InputDecoration(
                          hintText: 'Send message',
                          suffixIcon: Icon(
                            Icons.send,
                            color: kPrimaryColor,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: kPrimaryColor)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: kPrimaryColor))),
                    ),
                  )
                ],
              ),
            );
          } else
            return Text('Loading...');
        });
  }
}
