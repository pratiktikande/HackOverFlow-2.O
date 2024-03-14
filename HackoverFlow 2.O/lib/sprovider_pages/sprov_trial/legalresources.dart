// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
//
//
// /// Represents Homepage for Navigation
// class PDFScreenT extends StatefulWidget {
//   @override
//   _HomePage createState() => _HomePage();
// }
//
// class _HomePage extends State<PDFScreenT> {
//   final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Syncfusion Flutter PDF Viewer'),
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(
//               Icons.bookmark,
//               color: Colors.white,
//               semanticLabel: 'Bookmark',
//             ),
//             onPressed: () {
//               _pdfViewerKey.currentState?.openBookmarkView();
//             },
//           ),
//         ],
//       ),
//       // body: SfPdfViewer.asset(
//       //         'assets/pdfs/trial1.pdf'),
//
//       body: SfPdfViewer.network(
//         'https://www.icsi.edu/media/webmodules/Drafting_Apperances_Pleadings_NewSyllabus.pdf.pdf',
//         key: _pdfViewerKey,
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../components/navigation_drawer.dart';


// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'PDF Viewer Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: PDFListScreen(),
//     );
//   }
// }

class PDFListScreen extends StatelessWidget {
  final List<Map<String, String>> documents = [
    {
      'title': 'THE LEGAL SERVICE AUTHORITIES ACT 1987:',
      'link':
      'https://www.indiacode.nic.in/bitstream/123456789/19023/1/legal_service_authorities_act%2C_1987.pdf',
      // You can provide preview image links or use AssetImage for local images
      'previewImage': 'assets/legres/img.png',
    },
    {
      'title': 'Drafting Apperances Pleadings NewSyllabus',
      'link':
      'https://www.icsi.edu/media/webmodules/Drafting_Apperances_Pleadings_NewSyllabus.pdf.pdf',
      // You can provide preview image links or use AssetImage for local images
      'previewImage': 'assets/legres/img3.png',
    },
    {
      'title': 'INTRODUCTION TO LAW AND LEGAL REASONING',
      'link':
      'https://www.uncfsu.edu/assets/Documents/College%20of%20Business%20and%20Economics/legal.pdf',
      // You can provide preview image links or use AssetImage for local images
      'previewImage': 'assets/legres/img2.png',
    },
    {
      'title': 'THE UNDERSTANDABILITY OF LEGAL DOCUMENTS:',
      'link':
      'https://www.safetyhumanfactors.org/wp-content/uploads/2020/07/67)Howe,Wogalter(1994).pdf',
      // You can provide preview image links or use AssetImage for local images
      'previewImage': 'assets/legres/img1.png',
    },
    {
      'title': 'ILS RULES:',
      'link':
      'https://legalaffairs.gov.in/sites/default/files/ILS_RULES_0.pdf',
      // You can provide preview image links or use AssetImage for local images
      'previewImage': 'assets/legres/img4.png',
    },
    // Add more documents as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RESOURCES FOR STUDY'),
      ),
      drawer: NavDrawer(),
      body: ListView.builder(
        itemCount: documents.length,
        itemBuilder: (context, index) {
          final document = documents[index];
          return ListTile(
            title: Card(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PDFScreenT(
                        pdfLink: document['link']!,
                      ),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // AssetImage("./assets/images/logo.png")),
                    Image.asset(
                      document['previewImage']!,
                      width: double.infinity,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    // Image.network(
                    //   document['previewImage']!,
                    //   width: double.infinity,
                    //   height: 200,
                    //   fit: BoxFit.cover,
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        document['title']!,
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class PDFScreenT extends StatelessWidget {
  final String pdfLink;

  const PDFScreenT({required this.pdfLink});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Viewer'),
      ),
      body: SfPdfViewer.network(
        pdfLink,
        key: GlobalKey(),
      ),
    );
  }
}
