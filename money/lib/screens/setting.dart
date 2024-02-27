import 'package:flutter/material.dart';
import 'package:money/provider/theme_provider.dart';
import 'package:money/widgets/settings_list_tile.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Text('Setting and More',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
          const SizedBox(height: 20),
          Expanded(
              child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              SettingsListTile(
                title: 'Dark Mode',
                icon: Icons.dark_mode_outlined,
                trailing: Consumer<ThemeNotifier>(
                  builder: (context, theme, _) => Switch(
                    value: theme.isDark,
                    onChanged: (value) {
                      theme.toggleTheme();
                    },
                  ),
                ),
              ),
              SettingsListTile(
                title: 'Crypto News',
                icon: Icons.article_outlined,
              ),
              SettingsListTile(
                title: 'Past Results',
                icon: Icons.history,
              ),
              SettingsListTile(
                title: 'Subscribe On Youtube',
                icon: Icons.play_arrow,
                onTap: () => launchUrl(
                  Uri.parse(
                    'https://youtu.be/p7igZnSVKlY?si=nCqEGdIBmfMDlLC5',
                  ),
                ),
              ),
              SettingsListTile(
                title: 'Join On Telegram',
                icon: Icons.send,
                onTap: () => launchUrl(
                  Uri.parse(
                    'https://t.me/goldenmilion',
                  ),
                ),
              ),
              SettingsListTile(
                title: 'Follow On Instagram',
                icon: Icons.favorite,
                onTap: () => launchUrl(
                  Uri.parse(
                    'https://www.instagram.com/goldenmilioon?igsh=bG4ybnNycXNnZW82',
                  ),
                ),
              ),
              SettingsListTile(
                title: 'Join Premium',
                icon: Icons.emoji_events,
                onTap: () => launchUrl(
                  Uri.parse(
                    'http://t.me/Goldenmilion_vip',
                  ),
                ),
              ),
              SettingsListTile(
                title: 'Contact Us',
                icon: Icons.contact_support,
                onTap: () => launchUrl(
                  Uri.parse(
                    'http://t.me/Goldenmilion_vip',
                  ),
                ),
              ),
              SettingsListTile(
                title: 'Rate and Review',
                icon: Icons.star,
              ),
            ],
          )),
        ],
      ),
    );
  }
}
