import 'package:flutter/material.dart';

class SettingsListTile extends StatefulWidget {
  const SettingsListTile(
      {Key? key, required this.title, required this.icon, this.trailing, this.onTap})
      : super(key: key);
  final String title;
  final IconData icon;
  final Widget? trailing;
  final void Function()? onTap;

  @override
  _SettingsListTileState createState() => _SettingsListTileState();
}

class _SettingsListTileState extends State<SettingsListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListTile(
        onTap: widget.onTap,
        leading: Icon(widget.icon),
        title: Text(widget.title),
        trailing: widget.trailing ?? const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
