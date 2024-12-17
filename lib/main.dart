import 'dart:io';

import 'package:cv_creator/structure/enums/enums.dart';
import 'package:cv_creator/structure/models/model.dart';
import 'package:cv_creator/structure/skills.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CV Creator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'CV Creator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  printCv() async {
    final pdf = pw.Document();
    User user = User(
        name: 'John Doe',
        title: 'Software Developer',
        address: '123 Main St, City, Country',
        about:
            'I am a software developer with 5 years of experience in Flutter and Dart.',
        email: 'john@doe.eu',
        phoneNumber: '1234567890',
        socials: [
          SocialLink(
            link: 'http://github.com',
            social: Socials.github,
          ),
          SocialLink(
            link: 'http://linkedin.com',
            social: Socials.linkedin,
          ),
        ],
        skills: [
          'Flutter',
          'Dart',
          'Java',
          'Kotlin',
          'Swift',
        ],
        educations: [
          Education(
            university: 'University of Flutter',
            faculty: 'Computer Science',
            location: 'Flutterland',
            from: '2015',
            to: '2019',
            major: 'Computer Science',
          ),
          Education(
            university: 'University of Dart',
            faculty: 'Computer Science',
            location: 'Dartland',
            from: '2019',
            to: '2021',
            major: 'Electrical Engineering',
          ),
        ],
        languages: [
          Language(
            language: "English",
            level: Level.fluent,
          ),
          Language(
            language: "Arabic",
            level: Level.native,
          ),
          Language(
            language: "French",
            level: Level.beginner,
          ),
        ],
        experiences: [
          Experience(
            company: 'Flutter Inc.',
            position: 'Software Developer',
            location: 'Flutterland',
            from: '2019',
            to: '2021',
            description:
                'Developed mobile applications using Flutter and Dart.',
          ),
          Experience(
            company: 'Dart Inc.',
            position: 'Software Developer',
            location: 'Dartland',
            from: '2021',
            to: 'Present',
            description:
                'Developed mobile applications using Flutter and Dart.',
            responsibilities: [
              'Developed mobile applications using Flutter and Dart.',
              'Developed mobile applications using Flutter and Dart.',
              'Developed mobile applications using Flutter and Dart.',
            ],
          ),
        ],
        projects: [
          Project(
            name: 'Project 1',
            description: 'Description 1',
            from: '2019',
            to: '2020',
            url: 'http://project1.com',
            responsibilities: [
              'Developed mobile applications using Flutter and Dart.',
              'Developed mobile applications using Flutter and Dart.',
              'Developed mobile applications using Flutter and Dart.',
            ],
          ),
          Project(
            name: 'Project 2',
            description: 'Description 2',
            from: '2020',
            to: '2021',
            url: 'http://project2.com',
            responsibilities: [
              'Developed mobile applications using Flutter and Dart.',
              'Developed mobile applications using Flutter and Dart.',
              'Developed mobile applications using Flutter and Dart.',
            ],
          ),
        ]);
    pdf.addPage(
      pw.MultiPage(
        crossAxisAlignment: pw.CrossAxisAlignment.stretch,
        pageFormat: PdfPageFormat.a4,
        build: (context) => [
          pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.Text(
                user.name,
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(
                  fontSize: 22,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Text(
                user.title,
                textAlign: pw.TextAlign.center,
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Row(
                mainAxisAlignment: pw.MainAxisAlignment.center,
                children: [
                  pw.Text(
                    user.address,
                    style: pw.TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  pw.Text(
                    ' - ',
                    style: pw.TextStyle(
                      fontSize: 12,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.Text(
                    user.email,
                    style: pw.TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  pw.Text(
                    ' - ',
                    style: pw.TextStyle(
                      fontSize: 12,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  pw.Text(
                    user.phoneNumber,
                    style: pw.TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  pw.Text(
                    ' - ',
                    style: pw.TextStyle(
                      fontSize: 12,
                      fontWeight: pw.FontWeight.bold,
                    ),
                  ),
                  for (var social in user.socials)
                    pw.Container(
                      margin: const pw.EdgeInsets.only(right: 6),
                      child: pw.UrlLink(
                        child: pw.Text(
                          social.social == Socials.other
                              ? social.name
                              : social.social.name,
                        ),
                        destination: social.link,
                      ),
                    )
                ],
              ),
            ],
          ),
          pw.SizedBox(height: 20),
          ...getSummary(user),
          pw.SizedBox(height: 20),
          ...getSkills(user),
          pw.SizedBox(height: 20),
          ...getEducation(user),
          pw.SizedBox(height: 10),
          ...getLanguages(user),
          pw.SizedBox(height: 16),
          ...getExperience(user),
          pw.SizedBox(height: 15),
          ...getProjects(user),
        ],
      ),
    );
    final file = File("file-${DateTime.now().second}.pdf");
    await file.writeAsBytes(await pdf.save());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextButton(
              onPressed: () {
                printCv();
              },
              child: const Text('Click me'),
            ),
            SizedBox(height: 30),
            SearchAnchor.bar(
              suggestionsBuilder:
                  (BuildContext context, SearchController controller) {
                return skills
                    .where((e) =>
                        e.toLowerCase().contains(controller.text.toLowerCase()))
                    .map(
                      (value) => ListTile(
                        title: Text(value),
                        onTap: () {
                          controller.closeView(value);
                        },
                      ),
                    )
                    .toList();
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  List<pw.Widget> getSkills(User user) {
    return [
      pw.Text(
        'Skills',
        style: pw.TextStyle(
          fontSize: 18,
          fontWeight: pw.FontWeight.bold,
        ),
      ),
      pw.Divider(
        height: 10,
        color: PdfColors.black,
        thickness: 1,
      ),
      if (user.skills.isEmpty)
        pw.Text('No skills')
      else
        pw.Wrap(
          children: List.generate(
            user.skills.length,
            (index) {
              var skill = user.skills[index];
              return pw.Text(
                '$skill${index < user.skills.length - 1 ? ', ' : '.'}',
                style: pw.TextStyle(
                  fontSize: 14,
                ),
              );
            },
          ),
        ),
    ];
  }

  List<pw.Widget> getEducation(user) {
    return [
      pw.Text(
        'Education',
        style: pw.TextStyle(
          fontSize: 18,
          fontWeight: pw.FontWeight.bold,
        ),
      ),
      pw.Divider(
        height: 10,
        color: PdfColors.black,
        thickness: 1,
      ),
      if (user.educations.isEmpty)
        pw.Text('No education')
      else
        pw.Column(
          children: List.generate(
            user.educations.length,
            (index) {
              var education = user.educations[index];
              return pw.Container(
                margin: const pw.EdgeInsets.only(bottom: 10),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      '${education.university} - ${education.location}',
                      style: pw.TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text(
                          '${education.faculty} - ${education.major}',
                          style: pw.TextStyle(
                            fontSize: 12,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Text(
                          '${education.from} - ${education.to}',
                          style: pw.TextStyle(
                            fontSize: 12,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
    ];
  }

  List<pw.Widget> getLanguages(User user) {
    return [
      pw.Text(
        'Languages',
        style: pw.TextStyle(
          fontSize: 18,
          fontWeight: pw.FontWeight.bold,
        ),
      ),
      pw.Divider(
        height: 10,
        color: PdfColors.black,
        thickness: 1,
      ),
      if (user.languages.isEmpty)
        pw.Text('No languages')
      else
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: List.generate(
            user.languages.length,
            (index) {
              var language = user.languages[index];
              return pw.Container(
                margin: const pw.EdgeInsets.only(bottom: 4),
                child: pw.Text(
                  '${language.language} - ${language.level.name}',
                  style: pw.TextStyle(
                    fontSize: 12,
                  ),
                ),
              );
            },
          ),
        ),
    ];
  }

  List<pw.Widget> getExperience(User user) {
    return [
      pw.Text(
        'Experience',
        style: pw.TextStyle(
          fontSize: 18,
          fontWeight: pw.FontWeight.bold,
        ),
      ),
      pw.Divider(
        height: 10,
        color: PdfColors.black,
        thickness: 1,
      ),
      if (user.experiences.isEmpty)
        pw.Text('No experience')
      else
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: List.generate(
            user.experiences.length,
            (index) {
              var experience = user.experiences[index];
              return pw.Container(
                margin: const pw.EdgeInsets.only(bottom: 10),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      '${experience.company} - ${experience.location}',
                      style: pw.TextStyle(
                        fontSize: 14,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text(
                          experience.position,
                          style: pw.TextStyle(
                            fontSize: 12,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.Text(
                          '${experience.from} - ${experience.to}',
                          style: pw.TextStyle(
                            fontSize: 12,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    pw.SizedBox(height: 4),
                    pw.Text(
                      experience.description,
                      style: pw.TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    pw.SizedBox(height: 4),
                    if (experience.responsibilities.isEmpty)
                      pw.SizedBox()
                    else
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: List.generate(
                          experience.responsibilities.length,
                          (index) {
                            var responsibility =
                                experience.responsibilities[index];
                            return pw.Container(
                              margin: const pw.EdgeInsets.only(bottom: 5),
                              child: pw.Row(
                                children: [
                                  pw.Text(
                                    '- ',
                                    style: pw.TextStyle(
                                      fontSize: 10,
                                      fontWeight: pw.FontWeight.bold,
                                    ),
                                  ),
                                  pw.Text(
                                    responsibility,
                                    style: pw.TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
    ];
  }

  List<pw.Widget> getProjects(User user) {
    return [
      pw.Text(
        'Projects',
        style: pw.TextStyle(
          fontSize: 18,
          fontWeight: pw.FontWeight.bold,
        ),
      ),
      pw.Divider(
        height: 10,
        color: PdfColors.black,
        thickness: 1,
      ),
      if (user.projects.isEmpty)
        pw.Text('No projects')
      else
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: List.generate(
            user.projects.length,
            (index) {
              var project = user.projects[index];
              return pw.Container(
                margin: const pw.EdgeInsets.only(bottom: 10),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      project.name,
                      style: pw.TextStyle(
                        fontSize: 14,
                        fontWeight: pw.FontWeight.bold,
                      ),
                    ),
                    pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text(
                          '${project.from} - ${project.to}',
                          style: pw.TextStyle(
                            fontSize: 12,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.UrlLink(
                          child: pw.Text(
                            project.url,
                            style: pw.TextStyle(
                              fontSize: 12,
                            ),
                          ),
                          destination: project.url,
                        ),
                      ],
                    ),
                    pw.SizedBox(height: 4),
                    pw.Text(
                      project.description,
                      style: pw.TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    pw.SizedBox(height: 4),
                    if (project.responsibilities.isEmpty)
                      pw.SizedBox()
                    else
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: List.generate(
                          project.responsibilities.length,
                          (index) {
                            var responsibility =
                                project.responsibilities[index];
                            return pw.Container(
                              margin: const pw.EdgeInsets.only(bottom: 5),
                              child: pw.Row(
                                children: [
                                  pw.Text(
                                    '- ',
                                    style: pw.TextStyle(
                                      fontSize: 10,
                                      fontWeight: pw.FontWeight.bold,
                                    ),
                                  ),
                                  pw.Text(
                                    responsibility,
                                    style: pw.TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
    ];
  }

  List<pw.Widget> getSummary(User user) {
    return [
      pw.Text(
        'Summary',
        style: pw.TextStyle(
          fontSize: 18,
          fontWeight: pw.FontWeight.bold,
        ),
      ),
      pw.Divider(
        height: 10,
        color: PdfColors.black,
        thickness: 1,
      ),
      pw.Text(
        user.about,
        style: pw.TextStyle(
          fontSize: 14,
        ),
      ),
    ];
  }
}
