import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kutuby/main.dart';
import 'package:kutuby/providers/book_provider.dart';
import 'package:kutuby/screens/book_list.dart';

class NoSearch extends ConsumerStatefulWidget {
  const NoSearch({required this.bookNo, Key? key}) : super(key: key);
  final int bookNo;

  @override
  ConsumerState<NoSearch> createState() => _NoSearchState();
}

class _NoSearchState extends ConsumerState<NoSearch> {
  bool isLoading = false;
  final searchController = TextEditingController();
  void _showError() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          alignment: Alignment.center,
          shape: const LinearBorder(),
          title: Text(
            'حدث خطأ ما',
            textAlign: TextAlign.center,
            style: GoogleFonts.cairo(),
          ),
        ),
      );

  Future<void> signInWithGoogle() async {
    setState(() {
      isLoading = true;
    });
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      setState(() {
        print(userCredential.user!.displayName);
        user = userCredential.user;
      });
      // } catch (e) {
      //   _showError();
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final books = ref.watch(bookProvider.notifier).getAllBooks();
    return Container(
      width: 300,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: const Border.fromBorderSide(BorderSide(
            color: Color.fromARGB(255, 202, 201, 201),
            width: 0.5,
          ))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: const Border.fromBorderSide(BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ))),
            child: Column(children: [
              Text("يوجد", style: GoogleFonts.cairo(fontSize: 15)),
              Text(
                widget.bookNo.toString(),
                style: GoogleFonts.cairo(
                    color: const Color(0xFF7C3AED),
                    fontSize: 35,
                    fontWeight: FontWeight.w900),
              ),
              Text("كتاباً متوفراً",
                  style: GoogleFonts.cairo(
                    fontSize: 15,
                  )),
            ]),
          ),
          const SizedBox(height: 10),
          TextField(
            onTapOutside: (event) =>
                FocusScope.of(context).requestFocus(FocusNode()),
            textAlign: TextAlign.right,
            controller: searchController,
            style: GoogleFonts.cairo(fontSize: 14),
            decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintStyle: GoogleFonts.cairo(fontSize: 14),
                hintText: 'بحث عن اسم كتاب'),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FilledButton.icon(
                  style: FilledButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  onPressed: () {
                    if (searchController.text == '') return;
                    final result = books
                        .where((element) =>
                            element.name.contains(searchController.text))
                        .toList();

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BookList(books: result),
                        ));
                  },
                  icon: const Icon(Icons.search),
                  label: Text(
                    'بحث',
                    style: GoogleFonts.cairo(fontSize: 14),
                  )),
              OutlinedButton.icon(
                  style: FilledButton.styleFrom(
                      side: const BorderSide(width: 0.5, color: Colors.grey),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  onPressed: () async {
                    final categories =
                        ref.watch(bookProvider.notifier).specializations.keys;
                    String collageController = categories.first;
                    await showDialog(
                        context: context,
                        builder: (context) =>
                            StatefulBuilder(builder: (context, setState) {
                              final searchController = TextEditingController();
                              return AlertDialog(
                                backgroundColor: Colors.white,
                                surfaceTintColor: Colors.white,
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      onTapOutside: (event) =>
                                          FocusScope.of(context)
                                              .requestFocus(FocusNode()),
                                      textAlign: TextAlign.right,
                                      controller: searchController,
                                      style: GoogleFonts.cairo(fontSize: 14),
                                      decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          border: const OutlineInputBorder(),
                                          hintStyle:
                                              GoogleFonts.cairo(fontSize: 14),
                                          hintText: 'بحث عن اسم كتاب'),
                                    ),
                                    const SizedBox(height: 10),
                                    Text(
                                      'الكلية',
                                      style: GoogleFonts.cairo(),
                                    ),
                                    const SizedBox(height: 10),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: const Border.fromBorderSide(
                                              BorderSide(
                                            color: Color.fromARGB(
                                                255, 202, 201, 201),
                                            width: 0.5,
                                          ))),
                                      child: DropdownButton(
                                          isExpanded: true,
                                          underline: const SizedBox(),
                                          value: collageController,
                                          items: [
                                            for (var cat in categories)
                                              DropdownMenuItem(
                                                alignment:
                                                    Alignment.centerRight,
                                                value: cat,
                                                child: Text(
                                                  cat,
                                                  textDirection:
                                                      TextDirection.rtl,
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.cairo(),
                                                ),
                                              ),
                                          ],
                                          onChanged: (value) {
                                            setState(() {
                                              collageController = value!;
                                            });
                                          }),
                                    ),
                                    const SizedBox(height: 10),
                                    FilledButton.icon(
                                        style: FilledButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5))),
                                        onPressed: () {
                                          if (searchController.text == '') {
                                            return;
                                          }
                                          final result = books
                                              .where((element) =>
                                                  element.name.contains(
                                                      searchController.text) &&
                                                  element.collage.trim() ==
                                                      collageController)
                                              .toList();
                                          print(collageController);
                                          print(books.first.collage);
                                          Navigator.pop(context);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    BookList(books: result),
                                              ));
                                        },
                                        icon: const Icon(Icons.search),
                                        label: Text(
                                          'بحث',
                                          style:
                                              GoogleFonts.cairo(fontSize: 14),
                                        )),
                                  ],
                                ),
                              );
                            }));
                  },
                  icon: const Icon(Icons.filter_alt_outlined,
                      color: Colors.black),
                  label: Text(
                    'بحث بالتفاصيل',
                    style: GoogleFonts.cairo(fontSize: 14, color: Colors.black),
                  ))
            ],
          ),
          if (user == null)
            Column(
              children: [
                const SizedBox(height: 10),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  width: double.infinity,
                  height: 1,
                  color: Colors.grey,
                ),
                const SizedBox(height: 10),
                Text(
                  '.يجب عليك تسجيل الدخول أولاً لإضافة كتاب',
                  style: GoogleFonts.cairo(),
                ),
                const SizedBox(height: 10),
                OutlinedButton.icon(
                    style: FilledButton.styleFrom(
                        padding: const EdgeInsets.all(7),
                        side: const BorderSide(width: 0.5, color: Colors.grey),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    onPressed: isLoading ? () {} : signInWithGoogle,
                    icon: isLoading
                        ? const CircularProgressIndicator()
                        : SvgPicture.asset(
                            'assets/icons/google-icon.svg',
                            width: 30,
                            height: 30,
                          ),
                    label: Text(
                      'تسجيل دخول باستخدام غوغل',
                      style:
                          GoogleFonts.cairo(fontSize: 14, color: Colors.black),
                    ))
              ],
            )
        ],
      ),
    );
  }
}
