import 'package:flutter/material.dart';

class CommentsListWidget extends StatelessWidget {
  final String name;
  final String comment;
  final String date;
  const CommentsListWidget({super.key, required this.name, required this.comment, required this.date});

  @override
  Widget build(BuildContext context) {
    return  Container(
                                  margin: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.white10,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: ListTile(
                                    title: Text(
                                     name,
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
                                    subtitle: Text(comment,
                                        style: const TextStyle(
                                            color: Colors.white)),
                                    trailing:  Text(date),
                                  ),
                                );
  }
}