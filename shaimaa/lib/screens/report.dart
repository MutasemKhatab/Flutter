import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shaimaa/models/report.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen(
      {super.key,
      required this.reportType,
      required this.isAdd,
      this.report,
      this.isView = false});
  final bool isView;
  final String reportType;
  final bool isAdd;
  final Report? report;

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  Widget? title,
      fromTo,
      loop,
      absent,
      studentName,
      studentNum,
      save,
      revison,
      rating,
      numericRating,
      upload;
  TextEditingController titleController = TextEditingController();
  TextEditingController fromToController = TextEditingController();
  TextEditingController loopController = TextEditingController();
  TextEditingController ratingController = TextEditingController();
  TextEditingController absentController = TextEditingController();
  TextEditingController studentNameController = TextEditingController();
  TextEditingController studentNumController = TextEditingController();
  TextEditingController saveController = TextEditingController();
  TextEditingController revisonController = TextEditingController();
  TextEditingController nSaveController = TextEditingController();
  TextEditingController nRevisonController = TextEditingController();
  TextEditingController nTajweedController = TextEditingController();
  TextEditingController nTafseerController = TextEditingController();
  TextEditingController nMeaningController = TextEditingController();
  TextEditingController nPerformanceController = TextEditingController();
  TextEditingController nBehaviorController = TextEditingController();
  TextEditingController nAttendanceController = TextEditingController();
  @override
  void initState() {
    super.initState();
    if (widget.isAdd) {
      _buildAdd();
    } else {
      titleController.text = widget.report!.title;
      fromToController.text = widget.report!.date;
      loopController.text = widget.report!.loop;
      ratingController.text = widget.report!.rate;
      absentController.text = widget.report!.absent;
      studentNameController.text = widget.report!.studentName;
      studentNumController.text = widget.report!.studentNumber;
      saveController.text = widget.report!.save;
      revisonController.text = widget.report!.revison;
      nSaveController.text = widget.report!.nSave;
      nRevisonController.text = widget.report!.nRevison;
      nTajweedController.text = widget.report!.nTajweed;
      nTafseerController.text = widget.report!.nTafseer;
      nMeaningController.text = widget.report!.nMeaning;
      nPerformanceController.text = widget.report!.nAdaa;
      nBehaviorController.text = widget.report!.nBehaviour;
      nAttendanceController.text = widget.report!.nMowadaba;
      _buildAdd();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('تقرير ${widget.reportType}'),
        ),
        body: Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/back2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  children: [
                    title!,
                    const SizedBox(
                      height: 5,
                    ),
                    fromTo!,
                    loop!,
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                const Text(
                                  'التقييم العام',
                                  textAlign: TextAlign.center,
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                rating!
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                const Text(
                                  'الغياب',
                                  textAlign: TextAlign.center,
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                absent!,
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'رقم الطالبة',
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          studentNum!,
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'اسم الطالبة',
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          studentName!,
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'حققت في الحفظ',
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          save!,
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'حققت في المراجعة',
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          revison!,
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    numericRating!,
                    if (!widget.isView) upload!,
                  ],
                ),
              ),
            )));
  }

  void _buildAdd() {
    title = Container(
      height: 60,
      margin: const EdgeInsets.all(10),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextField(
          readOnly: widget.isView,
          controller: titleController,
          decoration: InputDecoration(
            labelText: 'عنوان التقرير',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
    fromTo = Container(
        height: 60,
        margin: const EdgeInsets.all(10),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: TextField(
            readOnly: widget.isView,
            controller: fromToController,
            decoration: InputDecoration(
              labelText: 'من - الي',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ));
    loop = Container(
        height: 60,
        margin: const EdgeInsets.all(10),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: TextField(
            readOnly: widget.isView,
            controller: loopController,
            decoration: InputDecoration(
              labelText: 'الحلقة',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ));
    absent = SizedBox(
      height: 60,
      child: TextField(
        readOnly: widget.isView,
        controller: absentController,
        decoration: InputDecoration(
          labelText: 'الغياب',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
    studentName = SizedBox(
      width: 180,
      height: 60,
      child: TextField(
        readOnly: widget.isView,
        controller: studentNameController,
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
    save = SizedBox(
      height: 60,
      width: 180,
      child: TextField(
        readOnly: widget.isView,
        controller: saveController,
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
    revison = Container(
      alignment: Alignment.center,
      width: 170,
      child: TextField(
        readOnly: widget.isView,
        controller: revisonController,
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
    rating = SizedBox(
      height: 60,
      child: TextField(
        readOnly: widget.isView,
        controller: ratingController,
        decoration: InputDecoration(
          labelText: 'التقييم العام',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
    studentNum = SizedBox(
      height: 60,
      width: 200,
      child: TextField(
        readOnly: widget.isView,
        controller: studentNumController,
        textAlignVertical: TextAlignVertical.top,
        decoration: InputDecoration(
          focusColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
        ),
      ),
    );
    numericRating = Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.pinkAccent.shade100,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(children: [
          const Text(
            'التقييم العددي',
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Text('الحفظ', style: TextStyle(fontSize: 15)),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 50,
                    child: TextField(
                      readOnly: widget.isView,
                      controller: nSaveController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text('المراجعة', style: TextStyle(fontSize: 15)),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 50,
                    child: TextField(
                      readOnly: widget.isView,
                      controller: nRevisonController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text('التجويد', style: TextStyle(fontSize: 15)),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 50,
                    child: TextField(
                      readOnly: widget.isView,
                      controller: nTajweedController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text('التفسير', style: TextStyle(fontSize: 15)),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 50,
                    child: TextField(
                      readOnly: widget.isView,
                      controller: nTafseerController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Text('المعاني', style: TextStyle(fontSize: 15)),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 50,
                    child: TextField(
                      readOnly: widget.isView,
                      controller: nMeaningController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text('الأداء', style: TextStyle(fontSize: 15)),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 50,
                    child: TextField(
                      readOnly: widget.isView,
                      controller: nPerformanceController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text('السلوك', style: TextStyle(fontSize: 15)),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 50,
                    child: TextField(
                      readOnly: widget.isView,
                      controller: nBehaviorController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const Text('المواظبة', style: TextStyle(fontSize: 15)),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 50,
                    child: TextField(
                      readOnly: widget.isView,
                      controller: nAttendanceController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ]));
    upload = Padding(
      padding: const EdgeInsets.all(10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            fixedSize: const Size(300, 60),
            foregroundColor: const Color(0xFF5F2E8E),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: () async {
          if (titleController.text.isEmpty ||
              fromToController.text.isEmpty ||
              loopController.text.isEmpty ||
              ratingController.text.isEmpty ||
              absentController.text.isEmpty ||
              studentNameController.text.isEmpty ||
              studentNumController.text.isEmpty ||
              saveController.text.isEmpty ||
              revisonController.text.isEmpty ||
              nSaveController.text.isEmpty ||
              nRevisonController.text.isEmpty ||
              nTajweedController.text.isEmpty ||
              nTafseerController.text.isEmpty ||
              nMeaningController.text.isEmpty ||
              nPerformanceController.text.isEmpty ||
              nBehaviorController.text.isEmpty ||
              nAttendanceController.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('الرجاء ملئ جميع الحقول'),
              ),
            );
            return;
          }

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('جاري رفع التقرير'),
              duration: Duration(seconds: 1),
            ),
          );
          if (widget.isAdd) {
            final doc =
                await FirebaseFirestore.instance.collection('reports').add({});
            final report = Report(
                id: doc.id,
                type: widget.reportType,
                title: titleController.text,
                date: fromToController.text,
                loop: loopController.text,
                rate: ratingController.text,
                absent: absentController.text,
                studentNumber: studentNumController.text,
                studentName: studentNameController.text,
                save: saveController.text,
                revison: revisonController.text,
                nSave: nSaveController.text,
                nRevison: nRevisonController.text,
                nTajweed: nTajweedController.text,
                nTafseer: nTafseerController.text,
                nMeaning: nMeaningController.text,
                nAdaa: nPerformanceController.text,
                nBehaviour: nBehaviorController.text,
                nMowadaba: nAttendanceController.text);
            await FirebaseFirestore.instance
                .collection('reports')
                .doc(doc.id)
                .set(report.toJson());
          } else {
            final report = Report(
                id: widget.report!.id,
                type: widget.reportType,
                title: titleController.text,
                date: fromToController.text,
                loop: loopController.text,
                rate: ratingController.text,
                absent: absentController.text,
                studentNumber: studentNumController.text,
                studentName: studentNameController.text,
                save: saveController.text,
                revison: revisonController.text,
                nSave: nSaveController.text,
                nRevison: nRevisonController.text,
                nTajweed: nTajweedController.text,
                nTafseer: nTafseerController.text,
                nMeaning: nMeaningController.text,
                nAdaa: nPerformanceController.text,
                nBehaviour: nBehaviorController.text,
                nMowadaba: nAttendanceController.text);

            FirebaseFirestore.instance
                .collection('reports')
                .doc(widget.report!.id)
                .update(report.toJson());
            if (!context.mounted) {
              return;
            }
            Navigator.of(context).pop();
          }
          if (!context.mounted) {
            return;
          } else {
            titleController.clear();
            fromToController.clear();
            loopController.clear();
            absentController.clear();
            studentNameController.clear();
            studentNumController.clear();
            saveController.clear();
            revisonController.clear();
            ratingController.clear();
            nSaveController.clear();
            nRevisonController.clear();
            nTajweedController.clear();
            nTafseerController.clear();
            nMeaningController.clear();
            nPerformanceController.clear();
            nBehaviorController.clear();
            nAttendanceController.clear();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('تم رفع التقرير بنجاح'),
                duration: Duration(seconds: 1),
              ),
            );
          }
        },
        child: Text(
          widget.isAdd ? 'رفع التقرير' : 'تعديل التقرير',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
