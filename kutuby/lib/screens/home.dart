import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kutuby/main.dart';
import 'package:kutuby/models/book.dart';
import 'package:kutuby/providers/book_provider.dart';
import 'package:kutuby/screens/add_book.dart';
import 'package:kutuby/screens/book_list.dart';
import 'package:kutuby/widgets/book_widget.dart';
import 'package:kutuby/widgets/no_search.dart';

class Home extends ConsumerStatefulWidget {
  const Home(this.isUser, {Key? key}) : super(key: key);
  final bool isUser;
  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ref.watch(bookProvider.notifier).fetchData(),
        builder: (context, snapshot) {
          List<Book>? get2books;
          List<Book>? getAllBooks;
          if (snapshot.connectionState == ConnectionState.done) {
            get2books = ref.watch(bookProvider.notifier).get2Books();
            getAllBooks = ref.watch(bookProvider.notifier).getAllBooks();
          }
          return Scaffold(
              backgroundColor: const Color(0xffF3F4F6),
              appBar: AppBar(
                  leading: GestureDetector(
                    onTap: user == null
                        ? () {}
                        : () async {
                            await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => BookList(
                                    mine: true,
                                    books: getAllBooks ??
                                        <Book>[]
                                            .where((element) =>
                                                element.userID == user!.uid)
                                            .toList(),
                                  ),
                                ));
                            setState(() {});
                          },
                    child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromARGB(86, 255, 255, 255)),
                      clipBehavior: Clip.antiAlias,
                      child: user != null
                          ? Image.network(user!.photoURL!)
                          : const Icon(Icons.person_outline),
                    ),
                  ),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () async {
                        if (user == null) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              title: Text(
                                'يجب عليك تسجيل الدخول أولاً لإضافة كتاب',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.cairo(),
                              ),
                            ),
                          );
                          return;
                        }
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddBook(),
                            ));
                        setState(() {});
                      },
                    ),
                  ],
                  backgroundColor: const Color.fromARGB(49, 124, 58, 237),
                  centerTitle: true,
                  title: Text(
                    'مشاركة الكتب',
                    style: GoogleFonts.cairo(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  )),
              body: snapshot.connectionState == ConnectionState.waiting
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : snapshot.hasError
                      ? Center(
                          child: Text(
                            'حدث خطأ ما',
                            style: GoogleFonts.cairo(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        )
                      : Container(
                          alignment: Alignment.topCenter,
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                NoSearch(
                                  bookNo: getAllBooks!.length,
                                ),
                                ...get2books!
                                    .map((e) => BookWidget(
                                          refresh: () {},
                                          book: e,
                                        ))
                                    .toList(),
                                if (getAllBooks.isNotEmpty)
                                  FilledButton(
                                      style: FilledButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5))),
                                      onPressed: () async {
                                        await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  BookList(books: getAllBooks!),
                                            ));
                                        setState(() {});
                                      },
                                      child: Text(
                                        'عرض جميع الكتب',
                                        style: GoogleFonts.cairo(fontSize: 14),
                                      )),
                              ],
                            ),
                          ),
                        ));
        });
  }
}
