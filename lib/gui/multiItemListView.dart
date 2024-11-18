import 'dart:math';

import 'package:flutter/material.dart';

class MultiItemListView<T> extends StatelessWidget {
  final List<T> data;
  final Widget Function(T) createWidget;
  const MultiItemListView({super.key, required this.data, required this.createWidget});

  @override
  Widget build(BuildContext context) {
    int gridCount = max((MediaQuery.of(context).size.width / 400).floor(),1);
    int itemCount = (data.length / gridCount).ceil();
    return ListView.builder(
        key: PageStorageKey<String>('spells_$key'),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          List<Widget> children = [];
          for(int i = 0; i < gridCount; i++){
            int indexGrid = index*gridCount+i;
            if(indexGrid < data.length){
              T item = data[indexGrid];
              children.add(
                Expanded(
                  child: createWidget(item),
                ),
              );
            }
            else{
              children.add(Expanded(child: Container()));
            }
          }
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: children,
          );
        }
    );
  }
}
