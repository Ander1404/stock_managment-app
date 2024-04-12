import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
late  var tr;
class Pdfapi{
  static Future<File> generatepdf(
    {required String code,
    required String nom
    ,required String date,
    required String datecurrent,
    required String codereser}
  ) async {    
    final document=PdfDocument();
    final page=document.pages.add();
    drawdrid(code,nom,date,datecurrent,codereser, page);
    //drawSignature(name,page);
    
    return savedfile(document);
  }
  
  static  void drawdrid(String code,String nom,String date,String datecurrent,String codereser, PdfPage page) {
    final grid=PdfGrid();
    grid.columns.add(count: 4);
    final headerrow=grid.headers.add(1)[0];
    headerrow.style.textBrush=PdfBrushes.white;
    headerrow.cells[0].value("Date:$datecurrent");
    headerrow.cells[1].value("Nom du client:$nom");
    headerrow.cells[2].value("Date de la ceremonie:$date");
    headerrow.cells[3].value("Code de la ceremonie:$codereser");

    // headerrow.style.font=PdfStandardFont(PdfFontFamily.helvetica, 10,style: PdfFontStyle.bold);

    final row=grid.rows.add();
    row.cells[0].value="15-09-2021";
    row.cells[1].value="John Doe";   
    row.cells[2].value="16-09-2021"; 
    row.cells[3].value="16-09-2021";  

    for(int i=0;i<headerrow.cells.count;i++){
      headerrow.cells[i].style.cellPadding=PdfPaddings(
        bottom: 5, left:5, right: 5, top: 5
      );
    }

    grid.draw(
      page: page,
      bounds: Rect.fromLTWH(0, 40, 0, 0),
    )!;
  }
static Future<File> savedfile(PdfDocument document)async {
  final path =await getApplicationDocumentsDirectory();
  String tmpvalue=DateTime.now().toIso8601String();
  final fileName='${path.path}/Invoice{$tmpvalue}.pdf';
  
  final file=File(fileName);
file.writeAsBytes(document.save() as List<int>);
document.dispose();
  await document.save();
  //final
  
  return file;
}

static Future<String> makestring(PdfDocument document)async {
  final path =await getApplicationDocumentsDirectory();
  String tmpvalue=DateTime.now().toIso8601String();
  final fileName='${path.path}/Invoice{$tmpvalue}.pdf';
  
  final file=File(fileName);
file.writeAsBytes(document.save() as List<int>);
document.dispose();
  await document.save();
  //final
  return fileName;
}





}