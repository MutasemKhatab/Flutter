import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kutuby/models/book.dart';
import 'package:kutuby/providers/book_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class BookWidget extends ConsumerWidget {
  const BookWidget(
      {required this.book,
      this.canRemove = false,
      required this.refresh,
      Key? key})
      : super(key: key);
  final bool canRemove;
  final Book book;
  final void Function() refresh;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    dynamic time = DateTime.now().difference(book.uploadDate).inDays ~/ 30;
    if (time == 0) time = '';
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: MediaQuery.of(context).size.width,
      height: 270,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (canRemove)
                SizedBox(
                  width: 30,
                  height: 30,
                  child: IconButton.filled(
                    style: FilledButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        backgroundColor: Colors.red,
                        shape: const CircleBorder()),
                    onPressed: () {
                      showDialog(
                          barrierDismissible: true,
                          context: context,
                          builder: (context) => AlertDialog(
                                alignment: Alignment.center,
                                actionsAlignment: MainAxisAlignment.center,
                                actions: [
                                  TextButton(
                                      onPressed: () async {
                                        Navigator.pop(context);
                                        await FirebaseStorage.instance
                                            .refFromURL(book.image)
                                            .delete();
                                        await FirebaseFirestore.instance
                                            .collection('books')
                                            .doc(book.id!)
                                            .delete();
                                        await ref
                                            .watch(bookProvider.notifier)
                                            .fetchData();
                                        refresh();
                                      },
                                      child: Text('تأكيد',
                                          style: GoogleFonts.cairo())),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('إلغاء',
                                          style: GoogleFonts.cairo()))
                                ],
                                title: Text(
                                  'حذف',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.cairo(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ));
                    },
                    icon: const Icon(
                      Icons.delete_outline,
                    ),
                  ),
                ),
              const Spacer(),
              book.showName
                  ? Text(
                      book.username,
                      style: GoogleFonts.cairo(fontSize: 14),
                    )
                  : const SizedBox(),
              const SizedBox(width: 10),
              SizedBox(
                width: 30,
                height: 30,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    book.userImage,
                    width: 30,
                    height: 30,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 250,
                    child: Text(
                      book.name,
                      overflow: TextOverflow.ellipsis,
                      textDirection: TextDirection.rtl,
                      style: GoogleFonts.cairo(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    'تأليف: ${book.author} - طُبع في: ${book.printYear} ',
                    textAlign: TextAlign.right,
                    style: GoogleFonts.cairo(fontSize: 12),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              SizedBox(
                width: 75,
                height: 100,
                child: Image.network(
                  book.image,
                  width: 75,
                  height: 100,
                  fit: BoxFit.contain,
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: const Color(0xffF5F6F8),
                      borderRadius: BorderRadius.circular(100)),
                  child: Text(
                    'تخصص ${book.specialization}',
                    overflow: TextOverflow.ellipsis,
                    textDirection: TextDirection.rtl,
                    style: GoogleFonts.cairo(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: const Color(0xff7C3AED),
                      borderRadius: BorderRadius.circular(100)),
                  child: Text(
                    'كلية ${book.collage}',
                    overflow: TextOverflow.ellipsis,
                    textDirection: TextDirection.rtl,
                    style: GoogleFonts.cairo(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            ':لطلب الكتاب تواصل معي من خلال',
            style: GoogleFonts.cairo(fontSize: 12),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Container(
                  padding: const EdgeInsets.all(3),
                  child: Text(
                    'منذ $time شهر تقريباً',
                    style: GoogleFonts.cairo(fontSize: 12),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  if (book.contactType == ContactType.number) {
                    await launchUrl(Uri.parse('https://wa.me/${book.contact}'));
                  } else {
                    await launchUrl(Uri(scheme: 'mailto', path: book.contact));
                  }
                },
                child: Container(
                  padding: const EdgeInsets.only(left: 10),
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                          side:
                              const BorderSide(width: 1, color: Colors.grey))),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        book.contact,
                        style: GoogleFonts.cairo(),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Color(0xff7C3AED)),
                        child: Icon(
                          book.contactType == ContactType.email
                              ? Icons.email_outlined
                              : Icons.phone_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
