import 'package:flutter/material.dart';

class CustomWidget extends StatefulWidget {
  CustomWidget({super.key, required this.type, this.age=18, this.weight=55});
  String type;
  int weight =55;
  int age =18;

  @override
  State<CustomWidget> createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<CustomWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.type == 'age' ? 'Age' : 'Weight',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 6),
            Text(
              widget.type == 'age' ? '${widget.age}' : '${widget.weight}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  heroTag: widget.type == 'age' ? 'age--' : 'weight--',
                  onPressed: () =>
                      setState(() => widget.type == 'age' ? widget.age-- : widget.weight--),
                  child: const Icon(
                    Icons.remove,
                    color: Colors.blueGrey,
                  ),
                  mini: true,
                ),
                const SizedBox(width: 8),
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  heroTag: widget.type == 'age' ? 'age++' : 'weight++',
                  onPressed: () =>
                      setState(() => widget.type == 'age' ?widget. age++ : widget.weight++),
                  child: const Icon(
                    Icons.add,
                    color: Colors.blueGrey,
                  ),
                  mini: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
