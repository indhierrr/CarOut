// ignore_for_file: prefer_typing_uninitialized_variables, no_logic_in_create_state, library_private_types_in_public_api

import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class DetailTugas extends StatefulWidget {
  DocumentSnapshot docid;
  DetailTugas({super.key, required this.docid});
 
  @override
   _DetailTugasState createState() => _DetailTugasState(docid: docid);
}

class _DetailTugasState extends State<DetailTugas> {
  DocumentSnapshot docid;
  _DetailTugasState({required this.docid});
  final pdf = pw.Document();
  var bagian;
  var karyawan;
  var keperluan;
  var tujuan;
  var berangkat;
  var pulang;
  var driver;
  var kendaraan;
  var acchead;
  var accpjk;
  var accgam;
  var start;
  var finish;

  var marks;
  void initState() {
    
    setState(() {
      bagian = widget.docid.get('bagian');
      karyawan = widget.docid.get('karyawan');
      keperluan = widget.docid.get('keperluan');
      tujuan = widget.docid.get('tujuan');
      berangkat = widget.docid.get('keberangkatan');
      pulang = widget.docid.get('perkiraan kembali');
      driver = widget.docid.get('driver');
      kendaraan = widget.docid.get ('kendaraan');
      acchead = widget.docid.get('acchead');
      accpjk = widget.docid.get('accpjk');
      accgam = widget.docid.get('accgam');
      start = widget.docid.get('start');
      finish = widget.docid.get ('finish');

      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PdfPreview(
      // maxPageWidth: 1000,
      // useActions: false,
      // canChangePageFormat: true,
      canChangeOrientation: false,
      // pageFormats:pageformat,
      canDebug: false,

      build: (format) => generateDocument(
        format,
      ),
    );
  }

  Future<Uint8List> generateDocument(PdfPageFormat format) async {
    final doc = pw.Document(pageMode: PdfPageMode.outlines);

    final font1 = await PdfGoogleFonts.openSansRegular();
    final font2 = await PdfGoogleFonts.openSansBold();
    // final image = await imageFromAssetBundle('assets/r2.svg');

    //String? _logo = await rootBundle.loadString('assets/logo/logo-splash.png');

    doc.addPage(
      pw.Page(
        pageTheme: pw.PageTheme(
          pageFormat: format.copyWith(
            marginBottom: 20,
            marginLeft: 20,
            marginRight: 20,
            marginTop: 20,
          ),
          orientation: pw.PageOrientation.portrait,
          theme: pw.ThemeData.withFont(
            base: font1,
            bold: font2,
          ),
        ),
        build: (context) {
          return pw.Center(
              child: pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              //pw.Flexible(
                //child: pw.SvgImage(
                  //svg: _logo,
                  //height: 100,
                //),
              //),
              pw.SizedBox(
                height: 20,
              ),
              pw.Center(
                child: pw.Text(
                  'Final Report Tugas Luar',
                  style: const pw.TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              pw.SizedBox(
                height: 20,
              ),
              pw.Divider(),
              pw.SizedBox(
                height: 20,
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(
                    'Bagian : ',
                    style: const pw.TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  pw.Text(
                    bagian,
                    style: const pw.TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(
                    'Karyawan : ',
                    style: const pw.TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  pw.Text(
                    karyawan,
                    style: const pw.TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(
                    'Keperluan : ',
                    style: const pw.TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  pw.Text(
                    keperluan,
                    style: const pw.TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(
                    'Tujuan : ',
                    style: const pw.TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  pw.Text(
                    tujuan,
                    style: const pw.TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(
                    'Jadwal keberangkatan : ',
                    style: const pw.TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  pw.Text(
                    berangkat,
                    style: const pw.TextStyle(
                      fontSize: 12,
                    ),
                  ),]),
                  pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(
                    'Perkiraan kembali : ',
                    style: const pw.TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  pw.Text(
                    pulang,
                    style: const pw.TextStyle(
                      fontSize: 12,
                    ),
                  ),]),
                  pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(
                    'Driver : ',
                    style: const pw.TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  pw.Text(
                    driver,
                    style: const pw.TextStyle(
                      fontSize: 12,
                    ),
                  ),]),
                  pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(
                    'Kendaraan : ',
                    style: const pw.TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  pw.Text(
                    kendaraan,
                    style: const pw.TextStyle(
                      fontSize: 12,
                    ),
                  ),
              
            ],
          ),
          pw.SizedBox(
                height: 80,
              ),
          pw.Text(
                    'Menyetujui,',
                    style: const pw.TextStyle(
                      fontSize: 12,
                    ),
                  ),
          pw.Text(
                    'Pemberi Tugas',
                    style: const pw.TextStyle(
                      fontSize: 12,
                    ),
                  ),
          pw.SizedBox(
                height: 30,
              ),
          pw.Text(
                    acchead,
                    style: const pw.TextStyle(
                      fontSize: 12,
                    ),
          ),
          pw.SizedBox(
                height: 10,
              ),
           pw.Text(
                    'Penanggungjawab Kendaraan',
                    style: const pw.TextStyle(
                      fontSize: 12,
                    ),
                  ),
          pw.SizedBox(
                height: 30,
              ),
          pw.Text(
                    accpjk,
                    style: const pw.TextStyle(
                      fontSize: 12,
                    ),
          ),
          pw.SizedBox(
                height: 10,
              ),
           pw.Text(
                    'DGM Adminitration',
                    style: const pw.TextStyle(
                      fontSize: 12,
                    ),
                  ),
          pw.SizedBox(
                height: 30,
              ),
          pw.Text(
                    accgam,
                    style: const pw.TextStyle(
                      fontSize: 12,
                    ),
          ),
          pw.SizedBox(
                height: 150,
              ),
          pw.Divider(),
              
              
              
              pw.SizedBox(
                height: 20,
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(
                    'Start : ',
                    style: const pw.TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  pw.Text(
                    start,
                    style: const pw.TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  
                ],
              ),
              
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(
                    'Finish : ',
                    style: const pw.TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  pw.Text(
                    finish,
                    style: const pw.TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  
                ],
              ),
              
              ]));
        },
      ),
    );

    return doc.save();
  }
}