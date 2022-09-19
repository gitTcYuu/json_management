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
  return GridView.builder(
    gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 300,
      childAspectRatio: 3 / 2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
    ),
    itemCount: photos.length,
    itemBuilder: (context, index) {
      return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(photos[index].thumbnailUrl))),
      );
    },
  );
}
