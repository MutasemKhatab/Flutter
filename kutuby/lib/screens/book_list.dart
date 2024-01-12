import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kutuby/main.dart';
import 'package:kutuby/models/book.dart';
import 'package:kutuby/providers/book_provider.dart';
import 'package:kutuby/widgets/book_widget.dart';

class BookList extends ConsumerStatefulWidget {
  const BookList({this.mine = false, this.books = const [], super.key});
  final bool mine;
  final List<Book> books;
  @override
  ConsumerState<BookList> createState() => _BookListState();
}

class _BookListState extends ConsumerState<BookList> {
  @override
  Widget build(BuildContext context) {
    List<Book> books;
    books = widget.books;
    return Scaffold(
        backgroundColor: const Color(0xffF3F4F6),
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 124, 58, 237),
            title: Text(
              widget.mine ? 'كتبي' : 'جميع الكتب',
              style: GoogleFonts.cairo(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white,
              ),
            )),
        body: books.isEmpty
            ? Center(
                child: Text(
                  'ليس هناك كتب لعرضها',
                  style: GoogleFonts.cairo(fontSize: 20),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemBuilder: (context, index) => BookWidget(
                  refresh: () async {
                    Navigator.pop(context);
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookList(
                            mine: true,
                            books: ref
                                .watch(bookProvider.notifier)
                                .getAllBooks()
                                .where((element) => element.userID == user!.uid)
                                .toList(),
                          ),
                        ));
                  },
                  book: books[index],
                  canRemove: widget.mine,
                ),
                itemCount: books.length,
              ));
  }
}
