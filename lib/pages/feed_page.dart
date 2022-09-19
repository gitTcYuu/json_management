import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_management/blocs/feeds/feeds_bloc.dart';
import 'package:json_management/widgets/text_widget.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<FeedsBloc, FeedsState>(builder: (context, state) {
          if (state is FeedsInitial) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state is FeedsLoaded) {
            return Center(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: state.feed.length,
                  itemBuilder: (context, index) {
                    var data = state.feed[index];
                    return _cardPost(
                        userId: data.userId,
                        id: data.id,
                        title: data.title,
                        body: data.body);
                  },
                ),
              ),
            );
          }
          return const Center(
            child: Text('Someting went wrong!'),
          );
        }),
      ),
    );
  }
}

Widget _cardPost(
    {required int userId,
    required int id,
    required String title,
    required String body}) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        width: double.maxFinite,
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: double.maxFinite,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextHeader(data: title),
                  const SizedBox(height: 15),
                  TextContent(data: body)
                ],
              ),
            ),
            SizedBox(
              height: 60,
              child: Column(
                children: [
                  Divider(color: Colors.grey[400]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextContent(data: userId.toString()),
                      TextContent(data: '#$id'),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
