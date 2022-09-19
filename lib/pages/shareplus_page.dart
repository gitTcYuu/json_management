import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_management/blocs/photos/photos_bloc.dart';
import 'package:json_management/models/photos_model.dart';
import 'package:json_management/widgets/text_widget.dart';

class SharePlusPage extends StatefulWidget {
  const SharePlusPage({super.key});

  @override
  State<SharePlusPage> createState() => _SharePlusPageState();
}

class _SharePlusPageState extends State<SharePlusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<PhotosBloc, PhotosState>(
          builder: (context, state) {
            if (state is PhotosInitial) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            if (state is PhotosLoaded) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: _gridView(photos: state.photos),
              );
            }
            return const Center(
              child: TextContent(data: 'Someting went wrong.'),
            );
          },
        ),
      ),
    );
  }
}

Widget _gridView({required List<Photo> photos}) {
  return ListView.separated(
    separatorBuilder: (context, index) => const SizedBox(height: 10),
    itemCount: photos.length,
    itemBuilder: (context, index) {
      return Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(photos[index].thumbnailUrl))),
      );
    },
  );
}
