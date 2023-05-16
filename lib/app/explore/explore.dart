import 'package:audread/app/explore/featured_topics.dart';
import 'package:audread/app/explore/recent_subjects.dart';
import 'package:audread/app/widgets/bottom_nav.dart';
import 'package:audread/utils/utils.dart';
import 'package:flutter/material.dart';

import '../widgets/header.dart';

final utils = Utils();

class ExploreTopicsPage extends StatefulWidget {
  const ExploreTopicsPage({Key? key}) : super(key: key);

  @override
  ExploreTopicsPageState createState() => ExploreTopicsPageState();
}

class ExploreTopicsPageState extends State<ExploreTopicsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const AudHeader(),
              const SizedBox(height: 20),
              TextFormField(
                textAlign: TextAlign.center,
                decoration: utils.inputFields.searchButtonDecoration(context),
              ),
              const SizedBox(height: 20),
              const RecentSubjects(),
              const SizedBox(height: 20),
              const FeaturedTopics(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNav(),
    );
  }
}
